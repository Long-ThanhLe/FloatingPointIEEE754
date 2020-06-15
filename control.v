module control(
    diff_exp,
    sign_exp,
    fraction_a,
    fraction_b,
    sign_a,
    sign_b,
    symbol,
    sign_out,
    out
);

input [23: 0] fraction_a, fraction_b;
input [7: 0] diff_exp;
input sign_exp;
input sign_a, sign_b, symbol;

wire check_23;
wire [23: 0] fraction_a_BigALU, fraction_b_BigALU;
wire [4: 0] shift_num;
wire [31: 0] fraction_a_32_shift, fraction_b_32_shift;
wire [7: 0] shift_tmp;

output [24: 0] out;
output sign_out;


FS_8 FS_8_SHIFT(.a(diff_exp), .b(8'b00011001), .cin(1'b0), .out(shift_tmp), .cout(check_23));

assign shift_num = ({5{!check_23}} & (5'b10111)) | ({5{check_23}} & diff_exp[4:0]);  // 5 bits


SHIFT_RIGHT shift_fraction_a(.in({8'b0, fraction_a}), .out(fraction_a_32_shift), .shift_num(shift_num));
SHIFT_RIGHT shift_fraction_b(.in({8'b0, fraction_b}), .out(fraction_b_32_shift), .shift_num(shift_num));


assign fraction_a_BigALU = ({24{!sign_exp}} & (fraction_a)) | ({24{sign_exp}} & (fraction_a_32_shift[23: 0]));
assign fraction_b_BigALU = ({24{!sign_exp}} & (fraction_b_32_shift[23: 0])) | ({24{sign_exp}} & (fraction_b));

BigAlu  BigALU_1(.a(fraction_a_BigALU),    .b(fraction_b_BigALU),
                 .sign_a(sign_a),           .sign_b(sign_b),        .symbol(symbol),
                 .out(out),                 .sign_out(sign_out));

endmodule


module control_CLA(
    diff_exp,
    sign_exp,
    fraction_a,
    fraction_b,
    sign_a,
    sign_b,
    symbol,
    sign_out,
    out
);

input [23: 0] fraction_a, fraction_b;
input [7: 0] diff_exp;
input sign_exp;
input sign_a, sign_b, symbol;

wire check_23;
wire [23: 0] fraction_a_BigALU, fraction_b_BigALU;
wire [4: 0] shift_num;
wire [31: 0] fraction_a_32_shift, fraction_b_32_shift;
wire [7: 0] shift_tmp;

output [24: 0] out;
output sign_out;


SUB_CLA_8 SUB_CLA_8_SHIFT(.iA(diff_exp), .iB(8'b00011001), .iC(1'b0), .oS(shift_tmp), .oC(check_23), .oP(), .oG());

assign shift_num = ({5{!check_23}} & (5'b10111)) | ({5{check_23}} & diff_exp[4:0]);  // 5 bits


SHIFT_RIGHT shift_fraction_a(.in({8'b0, fraction_a}), .out(fraction_a_32_shift), .shift_num(shift_num));
SHIFT_RIGHT shift_fraction_b(.in({8'b0, fraction_b}), .out(fraction_b_32_shift), .shift_num(shift_num));


assign fraction_a_BigALU = ({24{!sign_exp}} & (fraction_a)) | ({24{sign_exp}} & (fraction_a_32_shift[23: 0]));
assign fraction_b_BigALU = ({24{!sign_exp}} & (fraction_b_32_shift[23: 0])) | ({24{sign_exp}} & (fraction_b));

BigAlu_CLA  BigALU_CLA_(.a(fraction_a_BigALU),    .b(fraction_b_BigALU),
                        .sign_a(sign_a),           .sign_b(sign_b),        .symbol(symbol),
                        .out(out),                 .sign_out(sign_out));

endmodule