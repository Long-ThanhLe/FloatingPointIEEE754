module exponent_max(
    exp_0,
    exp_1,
    exp_max
);

input   [7: 0]  exp_0, exp_1;
output  [7: 0]  exp_max;

wire    [7: 0]  exp_tmp;
wire            cout_exp;

FS_8    FS_8_EXP(.a(exp_0), .b(exp_1), .cin(1'b0), .out(exp_tmp), .cout(cout_exp));

assign exp_max = ({8{!cout_exp}} & (exp_0)) | ({8{cout_exp}} & (exp_1));

endmodule


module exponent_max_cla(
    exp_0,
    exp_1,
    exp_max
);

input   [7: 0]  exp_0, exp_1;
output  [7: 0]  exp_max;

wire    [7: 0]  exp_tmp;
wire            cout_exp;

SUB_CLA_8    SUB_CLA_8_EXP(.iA(exp_0), .iB(exp_1), .iC(1'b0), .oS(exp_tmp), .oC(cout_exp), .oP(), .oG());

assign exp_max = ({8{!cout_exp}} & (exp_0)) | ({8{cout_exp}} & (exp_1));

endmodule