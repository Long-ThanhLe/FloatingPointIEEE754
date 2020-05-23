
module EXP_REAL(
	base,
	exp,
	out
);

input [31:0] base;
input [31:0] exp;
output [31:0] out;


// reg [31:0] base;
// reg [31:0] exp;

reg [32 -1 :0 ] num_ln2    = 32'b0_01111110_01100010111001000011000;

wire [7:0] exp_of_base ;
wire [23:0] frac_of_base ;
wire [31:0] fp_frac_of_base_div_4 ;

assign exp_of_base [7:0] = base[30:23];
// 
assign frac_of_base [23:0] = {1'b1, base[22:0]};
assign fp_frac_of_base_div_4 [31:0] = {9'b001111101, frac_of_base [22:0] };

wire [31:0] ln_frac_of_base_div_4;



TAYLOR_LN LN_frac_of_base_DIV_4(.in(fp_frac_of_base_div_4), .out(ln_frac_of_base_div_4));

wire [31:0] ln2_0, ln2_1, ln2_2, ln2_3, ln2_4, ln2_5, ln2_6, ln2_7;
wire [7:0] exp_tmp_0, exp_tmp_1,exp_tmp_2,exp_tmp_3,exp_tmp_4,exp_tmp_5,exp_tmp_6,exp_tmp_7;
wire [31:0] in_tmp_0, in_tmp_1,in_tmp_2,in_tmp_3,in_tmp_4,in_tmp_5,in_tmp_6,in_tmp_7; 

wire [7:0]cout;

assign exp_tmp_0[7:0] = num_ln2[30:23];
FA_8 ADD_1(.a(num_ln2[30:23]), .b(8'd1), .cin(1'b0),.cout(cout[1]), .s(exp_tmp_1[7:0]));
FA_8 ADD_2(.a(num_ln2[30:23]), .b(8'd2), .cin(1'b0),.cout(cout[2]), .s(exp_tmp_2[7:0]));
FA_8 ADD_3(.a(num_ln2[30:23]), .b(8'd3), .cin(1'b0),.cout(cout[3]), .s(exp_tmp_3[7:0]));
FA_8 ADD_4(.a(num_ln2[30:23]), .b(8'd4), .cin(1'b0),.cout(cout[4]), .s(exp_tmp_4[7:0]));
FA_8 ADD_5(.a(num_ln2[30:23]), .b(8'd5), .cin(1'b0),.cout(cout[5]), .s(exp_tmp_5[7:0]));
FA_8 ADD_6(.a(num_ln2[30:23]), .b(8'd6), .cin(1'b0),.cout(cout[6]), .s(exp_tmp_6[7:0]));
FA_8 ADD_7(.a(num_ln2[30:23]), .b(8'd7), .cin(1'b0),.cout(cout[7]), .s(exp_tmp_7[7:0]));
assign ln2_0 = {num_ln2[31], exp_tmp_0[7:0], num_ln2[22:0]};
assign ln2_1 = {num_ln2[31], exp_tmp_1[7:0], num_ln2[22:0]};
assign ln2_2 = {num_ln2[31], exp_tmp_2[7:0], num_ln2[22:0]};
assign ln2_3 = {num_ln2[31], exp_tmp_3[7:0], num_ln2[22:0]};
assign ln2_4 = {num_ln2[31], exp_tmp_4[7:0], num_ln2[22:0]};
assign ln2_5 = {num_ln2[31], exp_tmp_5[7:0], num_ln2[22:0]};
assign ln2_6 = {num_ln2[31], exp_tmp_6[7:0], num_ln2[22:0]};
assign ln2_7 = {num_ln2[31], exp_tmp_7[7:0], num_ln2[22:0]};
ADD ADD_EXP_0(.a(ln_frac_of_base_div_4[31:0]), .b(ln2_0[31:0] & {32{exp_of_base[0]}}), .symbol(1'b0), .out(in_tmp_0[31:0]));
ADD ADD_EXP_1(.a(in_tmp_0), .b(ln2_1[31:0] & {32{exp_of_base[1]}}), .symbol(1'b0), .out(in_tmp_1[31:0]));
ADD ADD_EXP_2(.a(in_tmp_1), .b(ln2_2[31:0] & {32{exp_of_base[2]}}), .symbol(1'b0), .out(in_tmp_2[31:0]));
ADD ADD_EXP_3(.a(in_tmp_2), .b(ln2_3[31:0] & {32{exp_of_base[3]}}), .symbol(1'b0), .out(in_tmp_3[31:0]));
ADD ADD_EXP_4(.a(in_tmp_3), .b(ln2_4[31:0] & {32{exp_of_base[4]}}), .symbol(1'b0), .out(in_tmp_4[31:0]));
ADD ADD_EXP_5(.a(in_tmp_4), .b(ln2_5[31:0] & {32{exp_of_base[5]}}), .symbol(1'b0), .out(in_tmp_5[31:0]));
ADD ADD_EXP_6(.a(in_tmp_5), .b(ln2_6[31:0] & {32{exp_of_base[6]}}), .symbol(1'b0), .out(in_tmp_6[31:0]));
ADD ADD_EXP_7(.a(in_tmp_6), .b(ln2_7[31:0] & {32{exp_of_base[7]}}), .symbol(1'b0), .out(in_tmp_7[31:0]));

wire [31:0] total_exp ;
ADD ADD_(.a(in_tmp_7[31:0]), .b(32'b01000010101011010100100101101011), .symbol(1'b1), .out(total_exp[31:0]));

wire [31:0] total_exp_mul_b;
MUL TOTAL_EXP(.in1(total_exp[31:0]), .in2(exp[31:0]), .out(total_exp_mul_b[31:0]));

wire [31:0] total_exp_div_1024;
DIV SCALE(.in1(total_exp_mul_b[31:0]), .in2(32'b01000100100000000000000000000000), .out(total_exp_div_1024[31:0]));

wire [31:0]result__1024;
TAYLOR_EXP EXP(.in(total_exp_div_1024[31:0]), .out(result__1024[31:0]));

wire [31:0] result__512,result__256,result__128, result__64, result__32,result__16, result__8, result__4, result__2, result__1;
MUL MUL_(.in1(result__1024[31:0]), .in2(result__1024[31:0]), .out(result__512[31:0]));
MUL MUL__(.in1(result__512[31:0]), .in2(result__512[31:0]), .out(result__256[31:0]));
MUL MUL___(.in1(result__256[31:0]), .in2(result__256[31:0]), .out(result__128[31:0]));
MUL MUL____(.in1(result__128[31:0]), .in2(result__128[31:0]), .out(result__64[31:0]));
MUL MUL_____(.in1(result__64[31:0]), .in2(result__64[31:0]), .out(result__32[31:0]));
MUL MUL______(.in1(result__32[31:0]), .in2(result__32[31:0]), .out(result__16[31:0]));
MUL MUL_______(.in1(result__16[31:0]), .in2(result__16[31:0]), .out(result__8[31:0]));
MUL MUL________(.in1(result__8[31:0]), .in2(result__8[31:0]), .out(result__4[31:0]));
MUL MUL_________(.in1(result__4[31:0]), .in2(result__4[31:0]), .out(result__2[31:0]));
MUL MUL__________(.in1(result__2[31:0]), .in2(result__2[31:0]), .out(result__1[31:0]));

assign out = result__1[31:0];

endmodule

