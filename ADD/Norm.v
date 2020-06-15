module Norm(
    exp_max,
    fraction_25,
    exp_out,
    fraction_out
);

input   [7: 0]    exp_max;
input   [24: 0]   fraction_25;

output  [7: 0]   exp_out;
output  [22: 0]  fraction_out;

wire    [31: 0] fraction_shift;
wire    [4: 0]  index;
wire    [7: 0]  shift_num, exp_inc, exp_sub_index, exp_out_tmp, index_25;
wire            cout, cout_exp_inc, cout_exp_sub_index, cout_bias;


FIRST_1_DETECTOR    FRIST_1_DETECT_0(.in({7'b0,fraction_25}), .out(index));

FS_8                FS_Index(.a(8'b00010111), .b({3'b0,index}),   .cin(1'b0),
                             .out(shift_num),    .cout(cout));

FA_8                FA_EXP(.a(exp_max),     .b(8'b00000001),   .cin(1'b0),     .s(exp_inc),    .cout(cout_exp_inc));

FS_8                FS_EXP_INDEX(.a(exp_max), .b(shift_num), .cin(1'b0), .out(exp_sub_index),    .cout(cout_exp_sub_index));

SHIFT_LEFT          SHIFT_LEFT_FRACTION(.in({7'b0,fraction_25}),  .out(fraction_shift), .shift_num(shift_num[4:0]));

assign fraction_out =   (({23{~cout}}) & (fraction_shift[22:0])) | (({23{cout}}) & (fraction_25[23:1]));
assign exp_out_tmp  =   (({8{~cout}}) & (exp_sub_index)) | (({8{cout}}) & (exp_inc));

FA_8                FA_8_BIAS(.a(exp_out_tmp),  .b(8'b01111111),    .cin(1'b0),    .s(exp_out),    .cout(cout_bias));

endmodule


module Norm_CLA(
    exp_max,
    fraction_25,
    exp_out,
    fraction_out
);

input   [7: 0]    exp_max;
input   [24: 0]   fraction_25;

output  [7: 0]   exp_out;
output  [22: 0]  fraction_out;

wire    [31: 0] fraction_shift;
wire    [4: 0]  index;
wire    [7: 0]  shift_num, exp_inc, exp_sub_index, exp_out_tmp, index_25;
wire            cout, cout_exp_inc, cout_exp_sub_index, cout_bias;


FIRST_1_DETECTOR    FRIST_1_DETECT_0(.in({7'b0,fraction_25}), .out(index));

SUB_CLA_8           SUB_CLA_Index(.iA(8'b00010111), .iB({3'b0,index}),   .iC(1'b0),
                                  .oS(shift_num),    .oC(cout), .oP(), .oG());

ADD_CLA_8           ADD_CLA_EXP(.iA(exp_max),     .iB(8'b00000001),   .iC(1'b0),
                                .oS(exp_inc),     .oC(cout_exp_inc), .oP(), .oG());

SUB_CLA_8           SUB_CLA_EXP_INDEX(.iA(exp_max), .iB(shift_num), .iC(1'b0),
                                      .oS(exp_sub_index),    .oC(cout_exp_sub_index), .oP(), .oG());

SHIFT_LEFT          SHIFT_LEFT_FRACTION(.in({7'b0,fraction_25}),  .out(fraction_shift), .shift_num(shift_num[4:0]));

assign fraction_out =   (({23{~cout}}) & (fraction_shift[22:0])) | (({23{cout}}) & (fraction_25[23:1]));
assign exp_out_tmp  =   (({8{~cout}}) & (exp_sub_index)) | (({8{cout}}) & (exp_inc));

ADD_CLA_8           ADD_CLA_8_BIAS(.iA(exp_out_tmp),  .iB(8'b01111111),    .iC(1'b0),
                                   .oS(exp_out),    .oC(cout_bias), .oP(), .oG());

endmodule