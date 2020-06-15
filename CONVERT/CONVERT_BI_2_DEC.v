
module COVERT_BI_2_DEC(
	in,
	out_floor,
	out_frac,
	out_sign
);

input [31:0]in;
output [127:0]out_floor, out_frac;
output out_sign;


wire [22:0] in_frac;
wire [23:0] in_frac_1;
reg [127:0] tmp_floor, tmp_frac;
wire [127:0] F5, F7, F8, F11, F12, F13, F15, F16, F18, F20;
wire [10:0] cout_tmp;



assign out_sign = in[31];
assign in_frac_1 = {{1'b1}, in[22:0]};
assign out_frac[127:0] = F20[127:0];
assign out_floor[127:0] = tmp_floor[127:0];

// 0.01001011001110110101
// 10^38/ 2^128

FA_128 F_5 (.a({{2 {1'b0}}, tmp_frac[127:2 ]}), .b({{5{1'b0}}, tmp_frac[127:5]}), .s(F5), .cin(1'b0), .cout(cout_tmp[0]));
FA_128 F_7 (.a({{7 {1'b0}}, tmp_frac[127:7 ]}), .b(F5 ), .s(F7 ), .cin(cout_tmp[0]), .cout(cout_tmp[1]));
FA_128 F_8 (.a({{8 {1'b0}}, tmp_frac[127:8 ]}), .b(F7 ), .s(F8 ), .cin(cout_tmp[1]), .cout(cout_tmp[2]));
FA_128 F_11(.a({{11{1'b0}}, tmp_frac[127:11]}), .b(F8 ), .s(F11), .cin(cout_tmp[2]), .cout(cout_tmp[3]));
FA_128 F_12(.a({{12{1'b0}}, tmp_frac[127:12]}), .b(F11), .s(F12), .cin(cout_tmp[3]), .cout(cout_tmp[4]));
FA_128 F_13(.a({{13{1'b0}}, tmp_frac[127:13]}), .b(F12), .s(F13), .cin(cout_tmp[4]), .cout(cout_tmp[5]));
FA_128 F_15(.a({{15{1'b0}}, tmp_frac[127:15]}), .b(F13), .s(F15), .cin(cout_tmp[5]), .cout(cout_tmp[6]));
FA_128 F_16(.a({{16{1'b0}}, tmp_frac[127:16]}), .b(F15), .s(F16), .cin(cout_tmp[6]), .cout(cout_tmp[7]));
FA_128 F_18(.a({{18{1'b0}}, tmp_frac[127:18]}), .b(F16), .s(F18), .cin(cout_tmp[7]), .cout(cout_tmp[8]));
FA_128 F_20(.a({{20{1'b0}}, tmp_frac[127:20]}), .b(F18), .s(F20), .cin(cout_tmp[8]), .cout(cout_tmp[9]));

always @(in[31:0]) begin
	case (in[30:23])

		8'd001: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 126 - 1){1'b0}}, in_frac_1[23: 22]                               }; end
		8'd002: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 125 - 1){1'b0}}, in_frac_1[23: 21]                               }; end
		8'd003: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 124 - 1){1'b0}}, in_frac_1[23: 20]                               }; end
		8'd004: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 123 - 1){1'b0}}, in_frac_1[23: 19]                               }; end
		8'd005: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 122 - 1){1'b0}}, in_frac_1[23: 18]                               }; end
		8'd006: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 121 - 1){1'b0}}, in_frac_1[23: 17]                               }; end//
		8'd007: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 120 - 1){1'b0}}, in_frac_1[23: 16]                               }; end
		8'd008: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 119 - 1){1'b0}}, in_frac_1[23: 15]                               }; end
		8'd069: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 118 - 1){1'b0}}, in_frac_1[23: 14]                               }; end
		8'd010: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 117 - 1){1'b0}}, in_frac_1[23: 13]                               }; end
		8'd011: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 116 - 1){1'b0}}, in_frac_1[23: 12]                               }; end
		8'd012: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 115 - 1){1'b0}}, in_frac_1[23: 11]                               }; end
		8'd013: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 114 - 1){1'b0}}, in_frac_1[23: 10]                               }; end
		8'd014: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 113 - 1){1'b0}}, in_frac_1[23:  9]                               }; end
		8'd015: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 112 - 1){1'b0}}, in_frac_1[23:  8]                               }; end
		8'd016: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 111 - 1){1'b0}}, in_frac_1[23:  7]                               }; end
		8'd017: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 110 - 1){1'b0}}, in_frac_1[23:  6]                               }; end
		8'd018: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 109 - 1){1'b0}}, in_frac_1[23:  5]                               }; end
		8'd019: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 108 - 1){1'b0}}, in_frac_1[23:  4]                               }; end
		8'd020: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 107 - 1){1'b0}}, in_frac_1[23:  3]                               }; end
		8'd021: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 106 - 1){1'b0}}, in_frac_1[23:  2]                               }; end
		8'd022: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 105 - 1){1'b0}}, in_frac_1[23:  1]                               }; end
		8'd023: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 104 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 104 + 1) {1'b0}} }; end
		8'd024: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 103 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 103 + 1) {1'b0}} }; end
		8'd025: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 102 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 102 + 1) {1'b0}} }; end
		8'd026: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 101 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 101 + 1) {1'b0}} }; end//
		8'd027: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 100 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 100 + 1) {1'b0}} }; end
		8'd028: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 099 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 099 + 1) {1'b0}} }; end
		8'd029: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 098 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 098 + 1) {1'b0}} }; end
		8'd030: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 097 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 097 + 1) {1'b0}} }; end
		8'd031: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 096 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 096 + 1) {1'b0}} }; end
		8'd032: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 095 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 095 + 1) {1'b0}} }; end
		8'd033: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 094 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 094 + 1) {1'b0}} }; end
		8'd034: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 093 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 093 + 1) {1'b0}} }; end
		8'd035: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 092 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 092 + 1) {1'b0}} }; end
		8'd036: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 091 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 091 + 1) {1'b0}} }; end
		8'd037: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 090 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 090 + 1) {1'b0}} }; end
		8'd038: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 089 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 089 + 1) {1'b0}} }; end
		8'd039: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 088 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 088 + 1) {1'b0}} }; end
		8'd040: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 087 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 087 + 1) {1'b0}} }; end
		8'd041: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 086 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 086 + 1) {1'b0}} }; end
		8'd042: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 085 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 085 + 1) {1'b0}} }; end
		8'd043: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 084 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 084 + 1) {1'b0}} }; end
		8'd044: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 083 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 083 + 1) {1'b0}} }; end
		8'd045: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 082 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 082 + 1) {1'b0}} }; end
		8'd046: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 081 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 081 + 1) {1'b0}} }; end//
		8'd047: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 080 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 080 + 1) {1'b0}} }; end
		8'd048: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 079 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 079 + 1) {1'b0}} }; end
		8'd049: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 078 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 078 + 1) {1'b0}} }; end
		8'd050: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 077 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 077 + 1) {1'b0}} }; end
		8'd051: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 076 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 076 + 1) {1'b0}} }; end
		8'd052: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 075 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 075 + 1) {1'b0}} }; end
		8'd053: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 074 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 074 + 1) {1'b0}} }; end
		8'd054: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 073 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 073 + 1) {1'b0}} }; end
		8'd055: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 072 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 072 + 1) {1'b0}} }; end
		8'd056: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 071 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 071 + 1) {1'b0}} }; end
		8'd057: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 070 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 070 + 1) {1'b0}} }; end
		8'd058: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 069 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 069 + 1) {1'b0}} }; end
		8'd059: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 068 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 068 + 1) {1'b0}} }; end
		8'd060: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 067 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 067 + 1) {1'b0}} }; end
		8'd061: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 066 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 066 + 1) {1'b0}} }; end
		8'd062: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 065 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 065 + 1) {1'b0}} }; end
		8'd063: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 064 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 064 + 1) {1'b0}} }; end
		8'd064: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 063 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 063 + 1) {1'b0}} }; end
		8'd065: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 062 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 062 + 1) {1'b0}} }; end
		8'd066: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 061 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 061 + 1) {1'b0}} }; end//
		8'd067: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 060 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 060 + 1) {1'b0}} }; end
		8'd068: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 059 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 059 + 1) {1'b0}} }; end
		8'd069: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 058 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 058 + 1) {1'b0}} }; end
		8'd070: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 057 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 057 + 1) {1'b0}} }; end
		8'd071: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 056 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 056 + 1) {1'b0}} }; end
		8'd072: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 055 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 055 + 1) {1'b0}} }; end
		8'd073: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 054 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 054 + 1) {1'b0}} }; end
		8'd074: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 053 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 053 + 1) {1'b0}} }; end
		8'd075: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 052 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 052 + 1) {1'b0}} }; end
		8'd076: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 051 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 051 + 1) {1'b0}} }; end
		8'd077: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 050 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 050 + 1) {1'b0}} }; end
		8'd078: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 049 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 049 + 1) {1'b0}} }; end
		8'd079: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 048 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 048 + 1) {1'b0}} }; end
		8'd080: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 047 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 047 + 1) {1'b0}} }; end
		8'd081: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 046 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 046 + 1) {1'b0}} }; end
		8'd082: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 045 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 045 + 1) {1'b0}} }; end
		8'd083: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 044 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 044 + 1) {1'b0}} }; end
		8'd084: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 043 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 043 + 1) {1'b0}} }; end
		8'd085: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 042 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 042 + 1) {1'b0}} }; end
		8'd086: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 041 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 041 + 1) {1'b0}} }; end//
		8'd087: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 040 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 040 + 1) {1'b0}} }; end
		8'd088: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 039 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 039 + 1) {1'b0}} }; end
		8'd089: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 038 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 038 + 1) {1'b0}} }; end
		8'd090: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 037 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 037 + 1) {1'b0}} }; end
		8'd091: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 036 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 036 + 1) {1'b0}} }; end
		8'd092: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 035 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 035 + 1) {1'b0}} }; end
		8'd093: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 034 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 034 + 1) {1'b0}} }; end
		8'd094: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 033 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 033 + 1) {1'b0}} }; end
		8'd095: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 032 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 032 + 1) {1'b0}} }; end
		8'd096: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 031 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 031 + 1) {1'b0}} }; end
		8'd097: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 030 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 030 + 1) {1'b0}} }; end
		8'd098: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 029 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 029 + 1) {1'b0}} }; end
		8'd099: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 028 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 028 + 1) {1'b0}} }; end
		8'd100: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 027 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 027 + 1) {1'b0}} }; end
		8'd101: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 026 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 026 + 1) {1'b0}} }; end
		8'd102: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 025 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 025 + 1) {1'b0}} }; end
		8'd103: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 024 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 024 + 1) {1'b0}} }; end
		8'd104: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 023 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 023 + 1) {1'b0}} }; end
		8'd105: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 022 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 022 + 1) {1'b0}} }; end
		8'd106: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 021 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 021 + 1) {1'b0}} }; end//
		8'd107: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 020 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 020 + 1) {1'b0}} }; end
		8'd108: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 019 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 019 + 1) {1'b0}} }; end
		8'd109: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 018 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 018 + 1) {1'b0}} }; end
		8'd110: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 017 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 017 + 1) {1'b0}} }; end
		8'd111: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 016 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 016 + 1) {1'b0}} }; end
		8'd112: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 015 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 015 + 1) {1'b0}} }; end
		8'd113: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 014 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 014 + 1) {1'b0}} }; end
		8'd114: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 013 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 013 + 1) {1'b0}} }; end
		8'd115: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 012 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 012 + 1) {1'b0}} }; end
		8'd116: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 011 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 011 + 1) {1'b0}} }; end
		8'd117: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 010 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 010 + 1) {1'b0}} }; end
		8'd118: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 009 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 009 + 1) {1'b0}} }; end
		8'd119: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 008 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 008 + 1) {1'b0}} }; end
		8'd120: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 007 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 007 + 1) {1'b0}} }; end
		8'd121: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 006 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 006 + 1) {1'b0}} }; end
		8'd122: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 005 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 005 + 1) {1'b0}} }; end
		8'd123: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 004 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 004 + 1) {1'b0}} }; end
		8'd124: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 003 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 003 + 1) {1'b0}} }; end
		8'd125: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 002 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 002 + 1) {1'b0}} }; end
		8'd126: begin tmp_floor[127:0] = {128{1'b0}}; tmp_frac[127:0] = {{( 001 - 1){1'b0}}, in_frac_1[23:0], { (128 - 24 - 001 + 1) {1'b0}} }; end
		8'd127: begin tmp_floor[127:0] = {{(127){1'b0}}, in_frac_1[23:23]}; tmp_frac[127:0] = {in_frac_1[22:0], {(128 - 23 ){1'b0}}}; end
		8'd128: begin tmp_floor[127:0] = {{(126){1'b0}}, in_frac_1[23:22]}; tmp_frac[127:0] = {in_frac_1[21:0], {(128 - 22 ){1'b0}}}; end
		8'd129: begin tmp_floor[127:0] = {{(125){1'b0}}, in_frac_1[23:21]}; tmp_frac[127:0] = {in_frac_1[20:0], {(128 - 21 ){1'b0}}}; end
		8'd130: begin tmp_floor[127:0] = {{(124){1'b0}}, in_frac_1[23:20]}; tmp_frac[127:0] = {in_frac_1[19:0], {(128 - 20 ){1'b0}}}; end
		8'd131: begin tmp_floor[127:0] = {{(123){1'b0}}, in_frac_1[23:19]}; tmp_frac[127:0] = {in_frac_1[18:0], {(128 - 19 ){1'b0}}}; end
		8'd132: begin tmp_floor[127:0] = {{(122){1'b0}}, in_frac_1[23:18]}; tmp_frac[127:0] = {in_frac_1[17:0], {(128 - 18 ){1'b0}}}; end
		8'd133: begin tmp_floor[127:0] = {{(121){1'b0}}, in_frac_1[23:17]}; tmp_frac[127:0] = {in_frac_1[16:0], {(128 - 17 ){1'b0}}}; end
		8'd134: begin tmp_floor[127:0] = {{(120){1'b0}}, in_frac_1[23:16]}; tmp_frac[127:0] = {in_frac_1[15:0], {(128 - 16 ){1'b0}}}; end
		8'd135: begin tmp_floor[127:0] = {{(119){1'b0}}, in_frac_1[23:15]}; tmp_frac[127:0] = {in_frac_1[14:0], {(128 - 15 ){1'b0}}}; end
		8'd136: begin tmp_floor[127:0] = {{(118){1'b0}}, in_frac_1[23:14]}; tmp_frac[127:0] = {in_frac_1[13:0], {(128 - 14 ){1'b0}}}; end
		8'd137: begin tmp_floor[127:0] = {{(117){1'b0}}, in_frac_1[23:13]}; tmp_frac[127:0] = {in_frac_1[12:0], {(128 - 13 ){1'b0}}}; end
		8'd138: begin tmp_floor[127:0] = {{(116){1'b0}}, in_frac_1[23:12]}; tmp_frac[127:0] = {in_frac_1[11:0], {(128 - 12 ){1'b0}}}; end
		8'd139: begin tmp_floor[127:0] = {{(115){1'b0}}, in_frac_1[23:11]}; tmp_frac[127:0] = {in_frac_1[10:0], {(128 - 11 ){1'b0}}}; end
		8'd140: begin tmp_floor[127:0] = {{(114){1'b0}}, in_frac_1[23:00]}; tmp_frac[127:0] = {in_frac_1[09:0], {(128 - 10 ){1'b0}}}; end
		8'd141: begin tmp_floor[127:0] = {{(113){1'b0}}, in_frac_1[23:09]}; tmp_frac[127:0] = {in_frac_1[08:0], {(128 - 09 ){1'b0}}}; end
		8'd142: begin tmp_floor[127:0] = {{(112){1'b0}}, in_frac_1[23:08]}; tmp_frac[127:0] = {in_frac_1[07:0], {(128 - 08 ){1'b0}}}; end
		8'd143: begin tmp_floor[127:0] = {{(111){1'b0}}, in_frac_1[23:07]}; tmp_frac[127:0] = {in_frac_1[06:0], {(128 - 07 ){1'b0}}}; end
		8'd144: begin tmp_floor[127:0] = {{(110){1'b0}}, in_frac_1[23:06]}; tmp_frac[127:0] = {in_frac_1[05:0], {(128 - 06 ){1'b0}}}; end
		8'd145: begin tmp_floor[127:0] = {{(109){1'b0}}, in_frac_1[23:05]}; tmp_frac[127:0] = {in_frac_1[04:0], {(128 - 05 ){1'b0}}}; end
		8'd146: begin tmp_floor[127:0] = {{(108){1'b0}}, in_frac_1[23:04]}; tmp_frac[127:0] = {in_frac_1[03:0], {(128 - 04 ){1'b0}}}; end
		8'd147: begin tmp_floor[127:0] = {{(107){1'b0}}, in_frac_1[23:03]}; tmp_frac[127:0] = {in_frac_1[02:0], {(128 - 03 ){1'b0}}}; end
		8'd148: begin tmp_floor[127:0] = {{(106){1'b0}}, in_frac_1[23:02]}; tmp_frac[127:0] = {in_frac_1[01:0], {(128 - 02 ){1'b0}}}; end
		8'd149: begin tmp_floor[127:0] = {{(105){1'b0}}, in_frac_1[23:01]}; tmp_frac[127:0] = {in_frac_1[00:0], {(128 - 01 ){1'b0}}}; end
		8'd150: begin tmp_floor[127:0] = {{(104){1'b0}}, in_frac_1[23:00], { 000{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd151: begin tmp_floor[127:0] = {{(103){1'b0}}, in_frac_1[23:00], { 001{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd152: begin tmp_floor[127:0] = {{(102){1'b0}}, in_frac_1[23:00], { 002{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd153: begin tmp_floor[127:0] = {{(101){1'b0}}, in_frac_1[23:00], { 003{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd154: begin tmp_floor[127:0] = {{(100){1'b0}}, in_frac_1[23:00], { 004{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd155: begin tmp_floor[127:0] = {{(099){1'b0}}, in_frac_1[23:00], { 005{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd156: begin tmp_floor[127:0] = {{(098){1'b0}}, in_frac_1[23:00], { 006{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd157: begin tmp_floor[127:0] = {{(097){1'b0}}, in_frac_1[23:00], { 007{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd158: begin tmp_floor[127:0] = {{(096){1'b0}}, in_frac_1[23:00], { 008{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd159: begin tmp_floor[127:0] = {{(095){1'b0}}, in_frac_1[23:00], { 009{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd160: begin tmp_floor[127:0] = {{(094){1'b0}}, in_frac_1[23:00], { 010{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd161: begin tmp_floor[127:0] = {{(093){1'b0}}, in_frac_1[23:00], { 011{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd162: begin tmp_floor[127:0] = {{(092){1'b0}}, in_frac_1[23:00], { 012{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd163: begin tmp_floor[127:0] = {{(091){1'b0}}, in_frac_1[23:00], { 013{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd164: begin tmp_floor[127:0] = {{(090){1'b0}}, in_frac_1[23:00], { 014{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd165: begin tmp_floor[127:0] = {{(089){1'b0}}, in_frac_1[23:00], { 015{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd166: begin tmp_floor[127:0] = {{(088){1'b0}}, in_frac_1[23:00], { 016{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd167: begin tmp_floor[127:0] = {{(087){1'b0}}, in_frac_1[23:00], { 017{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd168: begin tmp_floor[127:0] = {{(086){1'b0}}, in_frac_1[23:00], { 018{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd169: begin tmp_floor[127:0] = {{(085){1'b0}}, in_frac_1[23:00], { 019{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd170: begin tmp_floor[127:0] = {{(084){1'b0}}, in_frac_1[23:00], { 020{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd171: begin tmp_floor[127:0] = {{(083){1'b0}}, in_frac_1[23:00], { 021{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd172: begin tmp_floor[127:0] = {{(082){1'b0}}, in_frac_1[23:00], { 022{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd173: begin tmp_floor[127:0] = {{(081){1'b0}}, in_frac_1[23:00], { 023{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd174: begin tmp_floor[127:0] = {{(080){1'b0}}, in_frac_1[23:00], { 024{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd175: begin tmp_floor[127:0] = {{(079){1'b0}}, in_frac_1[23:00], { 025{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd176: begin tmp_floor[127:0] = {{(078){1'b0}}, in_frac_1[23:00], { 026{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd177: begin tmp_floor[127:0] = {{(077){1'b0}}, in_frac_1[23:00], { 027{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd178: begin tmp_floor[127:0] = {{(076){1'b0}}, in_frac_1[23:00], { 028{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd179: begin tmp_floor[127:0] = {{(075){1'b0}}, in_frac_1[23:00], { 029{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd180: begin tmp_floor[127:0] = {{(074){1'b0}}, in_frac_1[23:00], { 030{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd181: begin tmp_floor[127:0] = {{(073){1'b0}}, in_frac_1[23:00], { 031{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd182: begin tmp_floor[127:0] = {{(072){1'b0}}, in_frac_1[23:00], { 032{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd183: begin tmp_floor[127:0] = {{(071){1'b0}}, in_frac_1[23:00], { 033{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd184: begin tmp_floor[127:0] = {{(070){1'b0}}, in_frac_1[23:00], { 034{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd185: begin tmp_floor[127:0] = {{(069){1'b0}}, in_frac_1[23:00], { 035{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd186: begin tmp_floor[127:0] = {{(068){1'b0}}, in_frac_1[23:00], { 036{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd187: begin tmp_floor[127:0] = {{(067){1'b0}}, in_frac_1[23:00], { 037{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd188: begin tmp_floor[127:0] = {{(066){1'b0}}, in_frac_1[23:00], { 038{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd189: begin tmp_floor[127:0] = {{(065){1'b0}}, in_frac_1[23:00], { 039{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd190: begin tmp_floor[127:0] = {{(064){1'b0}}, in_frac_1[23:00], { 040{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd191: begin tmp_floor[127:0] = {{(063){1'b0}}, in_frac_1[23:00], { 041{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd192: begin tmp_floor[127:0] = {{(062){1'b0}}, in_frac_1[23:00], { 042{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd193: begin tmp_floor[127:0] = {{(061){1'b0}}, in_frac_1[23:00], { 043{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd194: begin tmp_floor[127:0] = {{(060){1'b0}}, in_frac_1[23:00], { 044{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd195: begin tmp_floor[127:0] = {{(059){1'b0}}, in_frac_1[23:00], { 045{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd196: begin tmp_floor[127:0] = {{(058){1'b0}}, in_frac_1[23:00], { 046{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd197: begin tmp_floor[127:0] = {{(057){1'b0}}, in_frac_1[23:00], { 047{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd198: begin tmp_floor[127:0] = {{(056){1'b0}}, in_frac_1[23:00], { 048{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd199: begin tmp_floor[127:0] = {{(055){1'b0}}, in_frac_1[23:00], { 049{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd200: begin tmp_floor[127:0] = {{(054){1'b0}}, in_frac_1[23:00], { 050{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd201: begin tmp_floor[127:0] = {{(053){1'b0}}, in_frac_1[23:00], { 051{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd202: begin tmp_floor[127:0] = {{(052){1'b0}}, in_frac_1[23:00], { 052{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd203: begin tmp_floor[127:0] = {{(051){1'b0}}, in_frac_1[23:00], { 053{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd204: begin tmp_floor[127:0] = {{(050){1'b0}}, in_frac_1[23:00], { 054{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd205: begin tmp_floor[127:0] = {{(049){1'b0}}, in_frac_1[23:00], { 055{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd206: begin tmp_floor[127:0] = {{(048){1'b0}}, in_frac_1[23:00], { 056{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd207: begin tmp_floor[127:0] = {{(047){1'b0}}, in_frac_1[23:00], { 057{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd208: begin tmp_floor[127:0] = {{(046){1'b0}}, in_frac_1[23:00], { 058{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd209: begin tmp_floor[127:0] = {{(045){1'b0}}, in_frac_1[23:00], { 059{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd210: begin tmp_floor[127:0] = {{(044){1'b0}}, in_frac_1[23:00], { 060{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd211: begin tmp_floor[127:0] = {{(043){1'b0}}, in_frac_1[23:00], { 061{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd212: begin tmp_floor[127:0] = {{(042){1'b0}}, in_frac_1[23:00], { 062{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd213: begin tmp_floor[127:0] = {{(041){1'b0}}, in_frac_1[23:00], { 063{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd214: begin tmp_floor[127:0] = {{(040){1'b0}}, in_frac_1[23:00], { 064{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd215: begin tmp_floor[127:0] = {{(039){1'b0}}, in_frac_1[23:00], { 065{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd216: begin tmp_floor[127:0] = {{(038){1'b0}}, in_frac_1[23:00], { 066{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd217: begin tmp_floor[127:0] = {{(037){1'b0}}, in_frac_1[23:00], { 067{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd218: begin tmp_floor[127:0] = {{(036){1'b0}}, in_frac_1[23:00], { 068{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd219: begin tmp_floor[127:0] = {{(035){1'b0}}, in_frac_1[23:00], { 069{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd220: begin tmp_floor[127:0] = {{(034){1'b0}}, in_frac_1[23:00], { 070{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd221: begin tmp_floor[127:0] = {{(033){1'b0}}, in_frac_1[23:00], { 071{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd222: begin tmp_floor[127:0] = {{(032){1'b0}}, in_frac_1[23:00], { 072{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd223: begin tmp_floor[127:0] = {{(031){1'b0}}, in_frac_1[23:00], { 073{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd224: begin tmp_floor[127:0] = {{(030){1'b0}}, in_frac_1[23:00], { 074{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd225: begin tmp_floor[127:0] = {{(029){1'b0}}, in_frac_1[23:00], { 075{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd226: begin tmp_floor[127:0] = {{(028){1'b0}}, in_frac_1[23:00], { 076{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd227: begin tmp_floor[127:0] = {{(027){1'b0}}, in_frac_1[23:00], { 077{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd228: begin tmp_floor[127:0] = {{(026){1'b0}}, in_frac_1[23:00], { 078{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd229: begin tmp_floor[127:0] = {{(025){1'b0}}, in_frac_1[23:00], { 079{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd230: begin tmp_floor[127:0] = {{(024){1'b0}}, in_frac_1[23:00], { 080{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd231: begin tmp_floor[127:0] = {{(023){1'b0}}, in_frac_1[23:00], { 081{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd232: begin tmp_floor[127:0] = {{(022){1'b0}}, in_frac_1[23:00], { 082{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd233: begin tmp_floor[127:0] = {{(021){1'b0}}, in_frac_1[23:00], { 083{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd234: begin tmp_floor[127:0] = {{(020){1'b0}}, in_frac_1[23:00], { 084{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd235: begin tmp_floor[127:0] = {{(019){1'b0}}, in_frac_1[23:00], { 085{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd236: begin tmp_floor[127:0] = {{(018){1'b0}}, in_frac_1[23:00], { 086{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd237: begin tmp_floor[127:0] = {{(017){1'b0}}, in_frac_1[23:00], { 087{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd238: begin tmp_floor[127:0] = {{(016){1'b0}}, in_frac_1[23:00], { 088{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd239: begin tmp_floor[127:0] = {{(015){1'b0}}, in_frac_1[23:00], { 089{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd240: begin tmp_floor[127:0] = {{(014){1'b0}}, in_frac_1[23:00], { 090{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd241: begin tmp_floor[127:0] = {{(013){1'b0}}, in_frac_1[23:00], { 091{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd242: begin tmp_floor[127:0] = {{(012){1'b0}}, in_frac_1[23:00], { 092{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd243: begin tmp_floor[127:0] = {{(011){1'b0}}, in_frac_1[23:00], { 093{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd244: begin tmp_floor[127:0] = {{(010){1'b0}}, in_frac_1[23:00], { 094{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd245: begin tmp_floor[127:0] = {{(009){1'b0}}, in_frac_1[23:00], { 095{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd246: begin tmp_floor[127:0] = {{(008){1'b0}}, in_frac_1[23:00], { 096{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd247: begin tmp_floor[127:0] = {{(007){1'b0}}, in_frac_1[23:00], { 097{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd248: begin tmp_floor[127:0] = {{(006){1'b0}}, in_frac_1[23:00], { 098{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd249: begin tmp_floor[127:0] = {{(005){1'b0}}, in_frac_1[23:00], { 099{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd250: begin tmp_floor[127:0] = {{(004){1'b0}}, in_frac_1[23:00], { 100{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd251: begin tmp_floor[127:0] = {{(003){1'b0}}, in_frac_1[23:00], { 101{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd252: begin tmp_floor[127:0] = {{(002){1'b0}}, in_frac_1[23:00], { 102{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd253: begin tmp_floor[127:0] = {{(001){1'b0}}, in_frac_1[23:00], { 103{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
		8'd254: begin tmp_floor[127:0] = {{(000){1'b0}}, in_frac_1[23:00], { 104{1'b0} } }; tmp_frac[127:0] = {128{1'b0}}; end
	endcase
end

endmodule