module ADD_CLA_FINAL(
    a,
    b,
    symbol,
    out
);

parameter DATA_WIDTH = 32;

input   [DATA_WIDTH - 1:  0]  a, b;
input   symbol;
output  [DATA_WIDTH - 1: 0] out;


wire    [24:0]  fraction_25;
wire    [7: 0]  diff_exp, exp_max, exp_max_tmp;
wire            sign_diff_exp, cout_exp_tmp;

wire    [31: 0] out_normal, out_special;
wire            check_special;

smallALU_CLA        SMALL_ALU_CLA(.in_0(a[30:23]),  .in_1(b[30:23]),    .out(diff_exp),     .sign_out(sign_diff_exp));
control_CLA         CONTROL_CLA(.diff_exp(diff_exp),    .sign_exp(sign_diff_exp),   .fraction_a({1'b1,a[22:0]}),    .fraction_b({1'b1,b[22:0]}),
                                .sign_a(a[31]),  .sign_b(b[31]), .symbol(symbol),
                                .sign_out(out_normal[31]),    .out(fraction_25));
exponent_max_cla    EXP_MAX_CLA(.exp_0(a[30:23]),   .exp_1(b[30:23]),   .exp_max(exp_max_tmp));
SUB_CLA_8           FS_EXP_MAX_CLA(.iA(exp_max_tmp), .iB(8'b01111111),    .iC(1'b0),
                                   .oS(exp_max),  .oC(cout_exp_tmp), .oP(), .oG());
Norm_CLA            NORM_FRAC_CLA(.exp_max(exp_max),   .fraction_25(fraction_25),
                                  .exp_out(out_normal[30:23]),   .fraction_out(out_normal[22:0]));

Special_Add     SP_ADD(.a(a),   .b(b),  .symbol(symbol),
                       .out(out_special),   .check_special(check_special));

assign  out = ({32{!check_special}} & (out_normal)) | ({32{check_special}} & (out_special));

endmodule