module DIV(in1, in2, out);

parameter DATA_WIDTH = 32;

input [DATA_WIDTH-1:0]in1,in2;
output  [DATA_WIDTH-1:0]out;

wire [DATA_WIDTH-1:0]	out;
wire [23:0]	in_tmp[24:0];
wire [23:0]	r_tmp [24:0];
wire [24:0]	q;

wire [23:0]	exponent_tmp;
wire [23:0]	exponent_tmp_sub_128;
wire      	exponent_cout; //debug and testbench
wire      	exponent_cout_sub_128; //debug and testbench
wire 		last_cout, lcout;
wire [23:0] out_normal_tmp;

wire    [31: 0] out_normal, out_special;
wire            check_special;

// Special Case
DIV_special_case     SP_DIV(.a(in1[31:0]), .b(in2[31:0]), .out(out_special[31:0]), .check_special(check_special));

// Normal Case
FS_24   FRACTION_  (.a({{1{1'b1}},in1[22 - 0: 0]}),     .b({{  1{1'b1}},in2[22 :  0 ]}),.out(r_tmp[  0]),.cin(1'b0),.cout(q[24 -  0 ])); assign in_tmp[  0] = {{1{1'b1}},in1[22 - 0: 0]};
FS_24   FRACTION_0 (.a(({24{q[24 -  0]}}&in_tmp[ 0] ) | (({24{~q[24 -  0]}})&r_tmp[  0]  )   ), .b({{  1{1'b0}},{1{1'b1}},in2[22 :  1]}),.out(r_tmp[  1]),.cin(1'b0),.cout(q[24 -  1 ])); assign in_tmp[  1] = ({24{q[24 -  0]}}&in_tmp[ 0] ) | (({24{~q[24 -  0]}})&r_tmp[  0]  )  ;
FS_24   FRACTION_1 (.a(({24{q[24 -  1]}}&in_tmp[ 1] ) | (({24{~q[24 -  1]}})&r_tmp[  1]  )   ), .b({{  2{1'b0}},{1{1'b1}},in2[22 :  2]}),.out(r_tmp[  2]),.cin(1'b0),.cout(q[24 -  2 ])); assign in_tmp[  2] = ({24{q[24 -  1]}}&in_tmp[ 1] ) | (({24{~q[24 -  1]}})&r_tmp[  1]  )  ;
FS_24   FRACTION_2 (.a(({24{q[24 -  2]}}&in_tmp[ 2] ) | (({24{~q[24 -  2]}})&r_tmp[  2]  )   ), .b({{  3{1'b0}},{1{1'b1}},in2[22 :  3]}),.out(r_tmp[  3]),.cin(1'b0),.cout(q[24 -  3 ])); assign in_tmp[  3] = ({24{q[24 -  2]}}&in_tmp[ 2] ) | (({24{~q[24 -  2]}})&r_tmp[  2]  )  ;
FS_24   FRACTION_3 (.a(({24{q[24 -  3]}}&in_tmp[ 3] ) | (({24{~q[24 -  3]}})&r_tmp[  3]  )   ), .b({{  4{1'b0}},{1{1'b1}},in2[22 :  4]}),.out(r_tmp[  4]),.cin(1'b0),.cout(q[24 -  4 ])); assign in_tmp[  4] = ({24{q[24 -  3]}}&in_tmp[ 3] ) | (({24{~q[24 -  3]}})&r_tmp[  3]  )  ;
FS_24   FRACTION_4 (.a(({24{q[24 -  4]}}&in_tmp[ 4] ) | (({24{~q[24 -  4]}})&r_tmp[  4]  )   ), .b({{  5{1'b0}},{1{1'b1}},in2[22 :  5]}),.out(r_tmp[  5]),.cin(1'b0),.cout(q[24 -  5 ])); assign in_tmp[  5] = ({24{q[24 -  4]}}&in_tmp[ 4] ) | (({24{~q[24 -  4]}})&r_tmp[  4]  )  ;
FS_24   FRACTION_5 (.a(({24{q[24 -  5]}}&in_tmp[ 5] ) | (({24{~q[24 -  5]}})&r_tmp[  5]  )   ), .b({{  6{1'b0}},{1{1'b1}},in2[22 :  6]}),.out(r_tmp[  6]),.cin(1'b0),.cout(q[24 -  6 ])); assign in_tmp[  6] = ({24{q[24 -  5]}}&in_tmp[ 5] ) | (({24{~q[24 -  5]}})&r_tmp[  5]  )  ;
FS_24   FRACTION_6 (.a(({24{q[24 -  6]}}&in_tmp[ 6] ) | (({24{~q[24 -  6]}})&r_tmp[  6]  )   ), .b({{  7{1'b0}},{1{1'b1}},in2[22 :  7]}),.out(r_tmp[  7]),.cin(1'b0),.cout(q[24 -  7 ])); assign in_tmp[  7] = ({24{q[24 -  6]}}&in_tmp[ 6] ) | (({24{~q[24 -  6]}})&r_tmp[  6]  )  ;
FS_24   FRACTION_7 (.a(({24{q[24 -  7]}}&in_tmp[ 7] ) | (({24{~q[24 -  7]}})&r_tmp[  7]  )   ), .b({{  8{1'b0}},{1{1'b1}},in2[22 :  8]}),.out(r_tmp[  8]),.cin(1'b0),.cout(q[24 -  8 ])); assign in_tmp[  8] = ({24{q[24 -  7]}}&in_tmp[ 7] ) | (({24{~q[24 -  7]}})&r_tmp[  7]  )  ;
FS_24   FRACTION_8 (.a(({24{q[24 -  8]}}&in_tmp[ 8] ) | (({24{~q[24 -  8]}})&r_tmp[  8]  )   ), .b({{  9{1'b0}},{1{1'b1}},in2[22 :  9]}),.out(r_tmp[  9]),.cin(1'b0),.cout(q[24 -  9 ])); assign in_tmp[  9] = ({24{q[24 -  8]}}&in_tmp[ 8] ) | (({24{~q[24 -  8]}})&r_tmp[  8]  )  ;
FS_24   FRACTION_9 (.a(({24{q[24 -  9]}}&in_tmp[ 9] ) | (({24{~q[24 -  9]}})&r_tmp[  9]  )   ), .b({{ 10{1'b0}},{1{1'b1}},in2[22 : 10]}),.out(r_tmp[ 10]),.cin(1'b0),.cout(q[24 - 10 ])); assign in_tmp[ 10] = ({24{q[24 -  9]}}&in_tmp[ 9] ) | (({24{~q[24 -  9]}})&r_tmp[  9]  )  ;
FS_24  FRACTION_10 (.a(({24{q[24 - 10]}}&in_tmp[10] ) | (({24{~q[24 - 10]}})&r_tmp[ 10]  )   ), .b({{ 11{1'b0}},{1{1'b1}},in2[22 : 11]}),.out(r_tmp[ 11]),.cin(1'b0),.cout(q[24 - 11 ])); assign in_tmp[ 11] = ({24{q[24 - 10]}}&in_tmp[10] ) | (({24{~q[24 - 10]}})&r_tmp[ 10]  )  ;
FS_24  FRACTION_11 (.a(({24{q[24 - 11]}}&in_tmp[11] ) | (({24{~q[24 - 11]}})&r_tmp[ 11]  )   ), .b({{ 12{1'b0}},{1{1'b1}},in2[22 : 12]}),.out(r_tmp[ 12]),.cin(1'b0),.cout(q[24 - 12 ])); assign in_tmp[ 12] = ({24{q[24 - 11]}}&in_tmp[11] ) | (({24{~q[24 - 11]}})&r_tmp[ 11]  )  ;
FS_24  FRACTION_12 (.a(({24{q[24 - 12]}}&in_tmp[12] ) | (({24{~q[24 - 12]}})&r_tmp[ 12]  )   ), .b({{ 13{1'b0}},{1{1'b1}},in2[22 : 13]}),.out(r_tmp[ 13]),.cin(1'b0),.cout(q[24 - 13 ])); assign in_tmp[ 13] = ({24{q[24 - 12]}}&in_tmp[12] ) | (({24{~q[24 - 12]}})&r_tmp[ 12]  )  ;
FS_24  FRACTION_13 (.a(({24{q[24 - 13]}}&in_tmp[13] ) | (({24{~q[24 - 13]}})&r_tmp[ 13]  )   ), .b({{ 14{1'b0}},{1{1'b1}},in2[22 : 14]}),.out(r_tmp[ 14]),.cin(1'b0),.cout(q[24 - 14 ])); assign in_tmp[ 14] = ({24{q[24 - 13]}}&in_tmp[13] ) | (({24{~q[24 - 13]}})&r_tmp[ 13]  )  ;
FS_24  FRACTION_14 (.a(({24{q[24 - 14]}}&in_tmp[14] ) | (({24{~q[24 - 14]}})&r_tmp[ 14]  )   ), .b({{ 15{1'b0}},{1{1'b1}},in2[22 : 15]}),.out(r_tmp[ 15]),.cin(1'b0),.cout(q[24 - 15 ])); assign in_tmp[ 15] = ({24{q[24 - 14]}}&in_tmp[14] ) | (({24{~q[24 - 14]}})&r_tmp[ 14]  )  ;
FS_24  FRACTION_15 (.a(({24{q[24 - 15]}}&in_tmp[15] ) | (({24{~q[24 - 15]}})&r_tmp[ 15]  )   ), .b({{ 16{1'b0}},{1{1'b1}},in2[22 : 16]}),.out(r_tmp[ 16]),.cin(1'b0),.cout(q[24 - 16 ])); assign in_tmp[ 16] = ({24{q[24 - 15]}}&in_tmp[15] ) | (({24{~q[24 - 15]}})&r_tmp[ 15]  )  ;
FS_24  FRACTION_16 (.a(({24{q[24 - 16]}}&in_tmp[16] ) | (({24{~q[24 - 16]}})&r_tmp[ 16]  )   ), .b({{ 17{1'b0}},{1{1'b1}},in2[22 : 17]}),.out(r_tmp[ 17]),.cin(1'b0),.cout(q[24 - 17 ])); assign in_tmp[ 17] = ({24{q[24 - 16]}}&in_tmp[16] ) | (({24{~q[24 - 16]}})&r_tmp[ 16]  )  ;
FS_24  FRACTION_17 (.a(({24{q[24 - 17]}}&in_tmp[17] ) | (({24{~q[24 - 17]}})&r_tmp[ 17]  )   ), .b({{ 18{1'b0}},{1{1'b1}},in2[22 : 18]}),.out(r_tmp[ 18]),.cin(1'b0),.cout(q[24 - 18 ])); assign in_tmp[ 18] = ({24{q[24 - 17]}}&in_tmp[17] ) | (({24{~q[24 - 17]}})&r_tmp[ 17]  )  ;
FS_24  FRACTION_18 (.a(({24{q[24 - 18]}}&in_tmp[18] ) | (({24{~q[24 - 18]}})&r_tmp[ 18]  )   ), .b({{ 19{1'b0}},{1{1'b1}},in2[22 : 19]}),.out(r_tmp[ 19]),.cin(1'b0),.cout(q[24 - 19 ])); assign in_tmp[ 19] = ({24{q[24 - 18]}}&in_tmp[18] ) | (({24{~q[24 - 18]}})&r_tmp[ 18]  )  ;
FS_24  FRACTION_19 (.a(({24{q[24 - 19]}}&in_tmp[19] ) | (({24{~q[24 - 19]}})&r_tmp[ 19]  )   ), .b({{ 20{1'b0}},{1{1'b1}},in2[22 : 20]}),.out(r_tmp[ 20]),.cin(1'b0),.cout(q[24 - 20 ])); assign in_tmp[ 20] = ({24{q[24 - 19]}}&in_tmp[19] ) | (({24{~q[24 - 19]}})&r_tmp[ 19]  )  ;
FS_24  FRACTION_20 (.a(({24{q[24 - 20]}}&in_tmp[20] ) | (({24{~q[24 - 20]}})&r_tmp[ 20]  )   ), .b({{ 21{1'b0}},{1{1'b1}},in2[22 : 21]}),.out(r_tmp[ 21]),.cin(1'b0),.cout(q[24 - 21 ])); assign in_tmp[ 21] = ({24{q[24 - 20]}}&in_tmp[20] ) | (({24{~q[24 - 20]}})&r_tmp[ 20]  )  ;
FS_24  FRACTION_21 (.a(({24{q[24 - 21]}}&in_tmp[21] ) | (({24{~q[24 - 21]}})&r_tmp[ 21]  )   ), .b({{ 22{1'b0}},{1{1'b1}},in2[22 : 22]}),.out(r_tmp[ 22]),.cin(1'b0),.cout(q[24 - 22 ])); assign in_tmp[ 22] = ({24{q[24 - 21]}}&in_tmp[21] ) | (({24{~q[24 - 21]}})&r_tmp[ 21]  )  ;
FS_24  FRACTION_22 (.a(({24{q[24 - 22]}}&in_tmp[22] ) | (({24{~q[24 - 22]}})&r_tmp[ 22]  )   ), .b({{ 23{1'b0}},{1{1'b1}}             }),.out(r_tmp[ 23]),.cin(1'b0),.cout(q[24 - 23 ])); assign in_tmp[ 23] = ({24{q[24 - 22]}}&in_tmp[22] ) | (({24{~q[24 - 22]}})&r_tmp[ 22]  )  ;
FS_24  FRACTION_23 (.a(({24{q[24 - 23]}}&in_tmp[23] ) | (({24{~q[24 - 23]}})&r_tmp[ 23]  )   ), .b({{ 24{1'b0}}                       }),.out(r_tmp[ 24]),.cin(1'b0),.cout(q[24 - 24 ])); assign in_tmp[ 24] = ({24{q[24 - 23]}}&in_tmp[23] ) | (({24{~q[24 - 23]}})&r_tmp[ 23]  )  ;

FS_24 EXP(.a({{16{1'b0}},in1[30:23]}), .b({{16{1'b0}},in2[30:23]}), .cin(q[24]), .cout(last_cout), .out(exponent_tmp[23:0]));
FA_24 EXP_(.a(exponent_tmp[23:0]), .b(24'd127), .s(out_normal_tmp[23:0]), .cin(1'b0), .cout(lcout));

assign	out_normal[30:23] = out_normal_tmp[7:0];
assign	out_normal[22:0] = (({23{q[24]}})&~q[22:0])    | ({23{~q[24]}}&~q[23:1]);
assign 	out_normal[31] = in1[31]^in2[31];

// Result
assign  out = ({32{!check_special}} & (out_normal)) | ({32{check_special}} & (out_special));

endmodule