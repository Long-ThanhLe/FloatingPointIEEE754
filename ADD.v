module ADD(
    a,
    b,
    symbol,
    out
);

// CHoLongCommit
parameter DATA_WIDTH = 32;

input   [DATA_WIDTH - 1:  0]  a, b;
input   symbol;
output  [DATA_WIDTH - 1: 0] out;

wire    [24:0]  fraction_25;
wire    [7: 0]  diff_exp, exp_max, exp_max_tmp;
wire            sign_diff_exp, cout_exp_tmp;

smallALU        SMALL_ALU(.in_0(a[30:23]),  .in_1(b[30:23]),    .out(diff_exp),     .sign_out(sign_diff_exp));
control         CONTROL(.diff_exp(diff_exp),    .sign_exp(sign_diff_exp),   .fraction_a({1'b1,a[22:0]}),    .fraction_b({1'b1,b[22:0]}),
                        .sign_a(a[31]),  .sign_b(b[31]), .symbol(symbol),    .sign_out(out[31]),    .out(fraction_25));
exponent_max    EXP_MAX(.exp_0(a[30:23]),   .exp_1(b[30:23]),   .exp_max(exp_max_tmp));
FS_8            FS_EXP_MAX(.a(exp_max_tmp), .b(8'b01111111),    .cin(1'b0), .out(exp_max),  .cout(cout_exp_tmp));
Norm            NORM_FRAC(.exp_max(exp_max),   .fraction_25(fraction_25),  .exp_out(out[30:23]),   .fraction_out(out[22:0]));

endmodule