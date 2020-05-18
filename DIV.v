module DIV(in1, in2, out);

parameter DATA_WIDTH = 32;

input [DATA_WIDTH-1:0]in1,in2;
output  [DATA_WIDTH-1:0]out;


wire  [DATA_WIDTH-1:0]out;

assign out[31] = in1[31]^in2[31];

wire [24:0]in_tmp[24:0];
wire [24:0]r_tmp [24:0];
wire [24:0]q;

wire [23:0]exponent_tmp;
wire [23:0]exponent_tmp_sub_128;
wire      exponent_cout; //debug and testbench
wire      exponent_cout_sub_128; //debug and testbench

FS_24   FRACTION_  (.a({{1{1'b1}},in1[22 - 0: 0]}),                           .b({  {1{1'b1}},in2[22 :  0]}),  .out(r_tmp[0]),.cin(0),.cout(q[24 - 0]));   assign in_tmp[  0] = in1[22 - 0: 0];
FS_24   FRACTION_0 (.a(({23{q}}&in_tmp[ 0] ) | ((~{23{q}})&r_tmp[  0]  )   ), .b({{  1{1'b0}},in2[23 :  1]}),.out(r_tmp[  1]),.cin(0),.cout(q[24 -  1 ])); assign in_tmp[  1] = ({23{q}}&in_tmp[  0] ) | ((~{23{q}})&r_tmp[ 0]  );
FS_24   FRACTION_1 (.a(({23{q}}&in_tmp[ 1] ) | ((~{23{q}})&r_tmp[  1]  )   ), .b({{  2{1'b0}},in2[23 :  2]}),.out(r_tmp[  2]),.cin(0),.cout(q[24 -  2 ])); assign in_tmp[  2] = ({23{q}}&in_tmp[  1] ) | ((~{23{q}})&r_tmp[  1]  );
FS_24   FRACTION_2 (.a(({23{q}}&in_tmp[ 2] ) | ((~{23{q}})&r_tmp[  2]  )   ), .b({{  3{1'b0}},in2[23 :  3]}),.out(r_tmp[  3]),.cin(0),.cout(q[24 -  3 ])); assign in_tmp[  3] = ({23{q}}&in_tmp[  2] ) | ((~{23{q}})&r_tmp[  2]  );
FS_24   FRACTION_3 (.a(({23{q}}&in_tmp[ 3] ) | ((~{23{q}})&r_tmp[  3]  )   ), .b({{  4{1'b0}},in2[23 :  4]}),.out(r_tmp[  4]),.cin(0),.cout(q[24 -  4 ])); assign in_tmp[  4] = ({23{q}}&in_tmp[  3] ) | ((~{23{q}})&r_tmp[  3]  );
FS_24   FRACTION_4 (.a(({23{q}}&in_tmp[ 4] ) | ((~{23{q}})&r_tmp[  4]  )   ), .b({{  5{1'b0}},in2[23 :  5]}),.out(r_tmp[  5]),.cin(0),.cout(q[24 -  5 ])); assign in_tmp[  5] = ({23{q}}&in_tmp[  4] ) | ((~{23{q}})&r_tmp[  4]  );
FS_24   FRACTION_5 (.a(({23{q}}&in_tmp[ 5] ) | ((~{23{q}})&r_tmp[  5]  )   ), .b({{  6{1'b0}},in2[23 :  6]}),.out(r_tmp[  6]),.cin(0),.cout(q[24 -  6 ])); assign in_tmp[  6] = ({23{q}}&in_tmp[  5] ) | ((~{23{q}})&r_tmp[  5]  );
FS_24   FRACTION_6 (.a(({23{q}}&in_tmp[ 6] ) | ((~{23{q}})&r_tmp[  6]  )   ), .b({{  7{1'b0}},in2[23 :  7]}),.out(r_tmp[  7]),.cin(0),.cout(q[24 -  7 ])); assign in_tmp[  7] = ({23{q}}&in_tmp[  6] ) | ((~{23{q}})&r_tmp[  6]  );
FS_24   FRACTION_7 (.a(({23{q}}&in_tmp[ 7] ) | ((~{23{q}})&r_tmp[  7]  )   ), .b({{  8{1'b0}},in2[23 :  8]}),.out(r_tmp[  8]),.cin(0),.cout(q[24 -  8 ])); assign in_tmp[  8] = ({23{q}}&in_tmp[  7] ) | ((~{23{q}})&r_tmp[  7]  );
FS_24   FRACTION_8 (.a(({23{q}}&in_tmp[ 8] ) | ((~{23{q}})&r_tmp[  8]  )   ), .b({{  9{1'b0}},in2[23 :  9]}),.out(r_tmp[  9]),.cin(0),.cout(q[24 -  9 ])); assign in_tmp[  9] = ({23{q}}&in_tmp[  8] ) | ((~{23{q}})&r_tmp[  8]  );
FS_24   FRACTION_9 (.a(({23{q}}&in_tmp[ 9] ) | ((~{23{q}})&r_tmp[  9]  )   ), .b({{ 10{1'b0}},in2[23 : 10]}),.out(r_tmp[ 10]),.cin(0),.cout(q[24 - 10 ])); assign in_tmp[ 10] = ({23{q}}&in_tmp[  9] ) | ((~{23{q}})&r_tmp[  9]  );
FS_24  FRACTION_10 (.a(({23{q}}&in_tmp[10] ) | ((~{23{q}})&r_tmp[ 10]  )   ), .b({{ 11{1'b0}},in2[23 : 11]}),.out(r_tmp[ 11]),.cin(0),.cout(q[24 - 11 ])); assign in_tmp[ 11] = ({23{q}}&in_tmp[ 10] ) | ((~{23{q}})&r_tmp[ 10]  );
FS_24  FRACTION_11 (.a(({23{q}}&in_tmp[11] ) | ((~{23{q}})&r_tmp[ 11]  )   ), .b({{ 12{1'b0}},in2[23 : 12]}),.out(r_tmp[ 12]),.cin(0),.cout(q[24 - 12 ])); assign in_tmp[ 12] = ({23{q}}&in_tmp[ 11] ) | ((~{23{q}})&r_tmp[ 11]  );
FS_24  FRACTION_12 (.a(({23{q}}&in_tmp[12] ) | ((~{23{q}})&r_tmp[ 12]  )   ), .b({{ 13{1'b0}},in2[23 : 13]}),.out(r_tmp[ 13]),.cin(0),.cout(q[24 - 13 ])); assign in_tmp[ 13] = ({23{q}}&in_tmp[ 12] ) | ((~{23{q}})&r_tmp[ 12]  );
FS_24  FRACTION_13 (.a(({23{q}}&in_tmp[13] ) | ((~{23{q}})&r_tmp[ 13]  )   ), .b({{ 14{1'b0}},in2[23 : 14]}),.out(r_tmp[ 14]),.cin(0),.cout(q[24 - 14 ])); assign in_tmp[ 14] = ({23{q}}&in_tmp[ 13] ) | ((~{23{q}})&r_tmp[ 13]  );
FS_24  FRACTION_14 (.a(({23{q}}&in_tmp[14] ) | ((~{23{q}})&r_tmp[ 14]  )   ), .b({{ 15{1'b0}},in2[23 : 15]}),.out(r_tmp[ 15]),.cin(0),.cout(q[24 - 15 ])); assign in_tmp[ 15] = ({23{q}}&in_tmp[ 14] ) | ((~{23{q}})&r_tmp[ 14]  );
FS_24  FRACTION_15 (.a(({23{q}}&in_tmp[15] ) | ((~{23{q}})&r_tmp[ 15]  )   ), .b({{ 16{1'b0}},in2[23 : 16]}),.out(r_tmp[ 16]),.cin(0),.cout(q[24 - 16 ])); assign in_tmp[ 16] = ({23{q}}&in_tmp[ 15] ) | ((~{23{q}})&r_tmp[ 15]  );
FS_24  FRACTION_16 (.a(({23{q}}&in_tmp[16] ) | ((~{23{q}})&r_tmp[ 16]  )   ), .b({{ 17{1'b0}},in2[23 : 17]}),.out(r_tmp[ 17]),.cin(0),.cout(q[24 - 17 ])); assign in_tmp[ 17] = ({23{q}}&in_tmp[ 16] ) | ((~{23{q}})&r_tmp[ 16]  );
FS_24  FRACTION_17 (.a(({23{q}}&in_tmp[17] ) | ((~{23{q}})&r_tmp[ 17]  )   ), .b({{ 18{1'b0}},in2[23 : 18]}),.out(r_tmp[ 18]),.cin(0),.cout(q[24 - 18 ])); assign in_tmp[ 18] = ({23{q}}&in_tmp[ 17] ) | ((~{23{q}})&r_tmp[ 17]  );
FS_24  FRACTION_18 (.a(({23{q}}&in_tmp[18] ) | ((~{23{q}})&r_tmp[ 18]  )   ), .b({{ 19{1'b0}},in2[23 : 19]}),.out(r_tmp[ 19]),.cin(0),.cout(q[24 - 19 ])); assign in_tmp[ 19] = ({23{q}}&in_tmp[ 18] ) | ((~{23{q}})&r_tmp[ 18]  );
FS_24  FRACTION_19 (.a(({23{q}}&in_tmp[19] ) | ((~{23{q}})&r_tmp[ 19]  )   ), .b({{ 20{1'b0}},in2[23 : 20]}),.out(r_tmp[ 20]),.cin(0),.cout(q[24 - 20 ])); assign in_tmp[ 20] = ({23{q}}&in_tmp[ 19] ) | ((~{23{q}})&r_tmp[ 19]  );
FS_24  FRACTION_20 (.a(({23{q}}&in_tmp[20] ) | ((~{23{q}})&r_tmp[ 20]  )   ), .b({{ 21{1'b0}},in2[23 : 21]}),.out(r_tmp[ 21]),.cin(0),.cout(q[24 - 21 ])); assign in_tmp[ 21] = ({23{q}}&in_tmp[ 20] ) | ((~{23{q}})&r_tmp[ 20]  );
FS_24  FRACTION_21 (.a(({23{q}}&in_tmp[21] ) | ((~{23{q}})&r_tmp[ 21]  )   ), .b({{ 22{1'b0}},in2[23 : 22]}),.out(r_tmp[ 22]),.cin(0),.cout(q[24 - 22 ])); assign in_tmp[ 22] = ({23{q}}&in_tmp[ 21] ) | ((~{23{q}})&r_tmp[ 21]  );
FS_24  FRACTION_22 (.a(({23{q}}&in_tmp[22] ) | ((~{23{q}})&r_tmp[ 22]  )   ), .b({{ 23{1'b0}},in2[23 : 23]}),.out(r_tmp[ 23]),.cin(0),.cout(q[24 - 23 ])); assign in_tmp[ 23] = ({23{q}}&in_tmp[ 22] ) | ((~{23{q}})&r_tmp[ 22]  );
FS_24  FRACTION_23 (.a(({23{q}}&in_tmp[23] ) | ((~{23{q}})&r_tmp[ 23]  )   ), .b({{ 24{1'b0}}             }),.out(r_tmp[ 24]),.cin(0),.cout(q[24 - 24 ])); assign in_tmp[ 24] = ({23{q}}&in_tmp[ 23] ) | ((~{23{q}})&r_tmp[ 22]  );


assign out[22:0] = (({23{q[24]}})&~q[22:0])    | ({23{~q[24]}}&~q[23:1]);



endmodule