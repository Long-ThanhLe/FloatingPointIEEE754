
module CONVERTER_DEC_2_BI(
	sign,
	in_floor,
	in_frac,
	out
);

input sign;
input [127:0]in_floor;
input [127:0]in_frac;
output [31:0]out;

reg [7:0] exp_tmp;
wire [7:0] exp;
reg [22:0] out_frac_tmp;
wire [255:0] in_frac_temp;
wire [127:0]tmp;
wire cout;
wire [127:0] tmp_0, tmp_2, tmp_3, tmp_6, tmp_7, tmp_8, tmp_12, tmp_13, tmp_14, tmp_15, tmp_16;
wire [10:0] cout_tmp;

FS_8 EXP(.a(8'b1111_1111), .b(exp_tmp[7:0]), .out(exp[7:0]), .cin(1'b1), .cout(cout));
// 11.01100111000111110
// 2^128 / 10^38
FA_128 F_0(.a({in_frac[126:0],{1{1'b0}}}), .b({{in_frac[127:0]}}), .s(tmp_0[127:0]), .cin(1'b0), .cout(cout_tmp[0]));
FA_128 F_2(.a(tmp_0[127:0]), .b({{2{1'b0}}, {in_frac[127:2]}}), .s(tmp_2[127:0]), .cin(cout_tmp[0]), .cout(cout_tmp[1]));
FA_128 F_3(.a(tmp_2[127:0]), .b({{3{1'b0}}, {in_frac[127:3]}}), .s(tmp_3[127:0]), .cin(cout_tmp[1]), .cout(cout_tmp[2]));
FA_128 F_6(.a(tmp_3[127:0]), .b({{6{1'b0}}, {in_frac[127:6]}}), .s(tmp_6[127:0]), .cin(cout_tmp[2]), .cout(cout_tmp[3]));
FA_128 F_7(.a(tmp_6[127:0]), .b({{7{1'b0}}, {in_frac[127:7]}}), .s(tmp_7[127:0]), .cin(cout_tmp[3]), .cout(cout_tmp[4]));
FA_128 F_8(.a(tmp_7[127:0]), .b({{8{1'b0}}, {in_frac[127:8]}}), .s(tmp_8[127:0]), .cin(cout_tmp[4]), .cout(cout_tmp[5]));
FA_128 F_12(.a(tmp_8[127:0]), .b({{12{1'b0}}, {in_frac[127:12]}}), .s(tmp_12[127:0]), .cin(cout_tmp[5]), .cout(cout_tmp[6]));
FA_128 F_13(.a(tmp_12[127:0]), .b({{13{1'b0}}, {in_frac[127:13]}}), .s(tmp_13[127:0]), .cin(cout_tmp[6]), .cout(cout_tmp[7]));
FA_128 F_14(.a(tmp_13[127:0]), .b({{14{1'b0}}, {in_frac[127:14]}}), .s(tmp_14[127:0]), .cin(cout_tmp[7]), .cout(cout_tmp[8]));
FA_128 F_15(.a(tmp_14[127:0]), .b({{15{1'b0}}, {in_frac[127:15]}}), .s(tmp_15[127:0]), .cin(cout_tmp[8]), .cout(cout_tmp[9]));
FA_128 F_16(.a(tmp_15[127:0]), .b({{16{1'b0}}, {in_frac[127:16]}}), .s(tmp_16[127:0]), .cin(cout_tmp[9]), .cout(cout_tmp[10]));

assign out[31] = sign;
assign out[22:0] = out_frac_tmp[22:0];
assign out[30:23] = exp[7:0];
assign in_frac_temp[255:0] = {{in_floor[127:0]}, {tmp_16[127:0]}};

always @(sign, in_floor[127:0], tmp_16[127:0]) 
begin
	casex(in_frac_temp[255:0])
		{{000{1'b0}}, 1'b1 , { (255 - 000) {1'bx}}}: begin exp_tmp[7:0] = 8'd000; out_frac_tmp[22:0] = in_frac_temp[(255 - (000 + 1)): (255 - (000 + 1) - 22) ] ; end
		{{001{1'b0}}, 1'b1 , { (255 - 001) {1'bx}}}: begin exp_tmp[7:0] = 8'd001; out_frac_tmp[22:0] = in_frac_temp[(255 - (001 + 1)): (255 - (001 + 1) - 22) ] ; end
		{{002{1'b0}}, 1'b1 , { (255 - 002) {1'bx}}}: begin exp_tmp[7:0] = 8'd002; out_frac_tmp[22:0] = in_frac_temp[(255 - (002 + 1)): (255 - (002 + 1) - 22) ] ; end
		{{003{1'b0}}, 1'b1 , { (255 - 003) {1'bx}}}: begin exp_tmp[7:0] = 8'd003; out_frac_tmp[22:0] = in_frac_temp[(255 - (003 + 1)): (255 - (003 + 1) - 22) ] ; end
		{{004{1'b0}}, 1'b1 , { (255 - 004) {1'bx}}}: begin exp_tmp[7:0] = 8'd004; out_frac_tmp[22:0] = in_frac_temp[(255 - (004 + 1)): (255 - (004 + 1) - 22) ] ; end
		{{005{1'b0}}, 1'b1 , { (255 - 005) {1'bx}}}: begin exp_tmp[7:0] = 8'd005; out_frac_tmp[22:0] = in_frac_temp[(255 - (005 + 1)): (255 - (005 + 1) - 22) ] ; end
		{{006{1'b0}}, 1'b1 , { (255 - 006) {1'bx}}}: begin exp_tmp[7:0] = 8'd006; out_frac_tmp[22:0] = in_frac_temp[(255 - (006 + 1)): (255 - (006 + 1) - 22) ] ; end
		{{007{1'b0}}, 1'b1 , { (255 - 007) {1'bx}}}: begin exp_tmp[7:0] = 8'd007; out_frac_tmp[22:0] = in_frac_temp[(255 - (007 + 1)): (255 - (007 + 1) - 22) ] ; end
		{{008{1'b0}}, 1'b1 , { (255 - 008) {1'bx}}}: begin exp_tmp[7:0] = 8'd008; out_frac_tmp[22:0] = in_frac_temp[(255 - (008 + 1)): (255 - (008 + 1) - 22) ] ; end
		{{009{1'b0}}, 1'b1 , { (255 - 009) {1'bx}}}: begin exp_tmp[7:0] = 8'd009; out_frac_tmp[22:0] = in_frac_temp[(255 - (009 + 1)): (255 - (009 + 1) - 22) ] ; end
		{{010{1'b0}}, 1'b1 , { (255 - 010) {1'bx}}}: begin exp_tmp[7:0] = 8'd010; out_frac_tmp[22:0] = in_frac_temp[(255 - (010 + 1)): (255 - (010 + 1) - 22) ] ; end//
		{{011{1'b0}}, 1'b1 , { (255 - 011) {1'bx}}}: begin exp_tmp[7:0] = 8'd011; out_frac_tmp[22:0] = in_frac_temp[(255 - (011 + 1)): (255 - (011 + 1) - 22) ] ; end
		{{012{1'b0}}, 1'b1 , { (255 - 012) {1'bx}}}: begin exp_tmp[7:0] = 8'd012; out_frac_tmp[22:0] = in_frac_temp[(255 - (012 + 1)): (255 - (012 + 1) - 22) ] ; end
		{{013{1'b0}}, 1'b1 , { (255 - 013) {1'bx}}}: begin exp_tmp[7:0] = 8'd013; out_frac_tmp[22:0] = in_frac_temp[(255 - (013 + 1)): (255 - (013 + 1) - 22) ] ; end
		{{014{1'b0}}, 1'b1 , { (255 - 014) {1'bx}}}: begin exp_tmp[7:0] = 8'd014; out_frac_tmp[22:0] = in_frac_temp[(255 - (014 + 1)): (255 - (014 + 1) - 22) ] ; end
		{{015{1'b0}}, 1'b1 , { (255 - 015) {1'bx}}}: begin exp_tmp[7:0] = 8'd015; out_frac_tmp[22:0] = in_frac_temp[(255 - (015 + 1)): (255 - (015 + 1) - 22) ] ; end
		{{016{1'b0}}, 1'b1 , { (255 - 016) {1'bx}}}: begin exp_tmp[7:0] = 8'd016; out_frac_tmp[22:0] = in_frac_temp[(255 - (016 + 1)): (255 - (016 + 1) - 22) ] ; end
		{{017{1'b0}}, 1'b1 , { (255 - 017) {1'bx}}}: begin exp_tmp[7:0] = 8'd017; out_frac_tmp[22:0] = in_frac_temp[(255 - (017 + 1)): (255 - (017 + 1) - 22) ] ; end
		{{018{1'b0}}, 1'b1 , { (255 - 018) {1'bx}}}: begin exp_tmp[7:0] = 8'd018; out_frac_tmp[22:0] = in_frac_temp[(255 - (018 + 1)): (255 - (018 + 1) - 22) ] ; end
		{{019{1'b0}}, 1'b1 , { (255 - 019) {1'bx}}}: begin exp_tmp[7:0] = 8'd019; out_frac_tmp[22:0] = in_frac_temp[(255 - (019 + 1)): (255 - (019 + 1) - 22) ] ; end
		{{020{1'b0}}, 1'b1 , { (255 - 020) {1'bx}}}: begin exp_tmp[7:0] = 8'd020; out_frac_tmp[22:0] = in_frac_temp[(255 - (020 + 1)): (255 - (020 + 1) - 22) ] ; end//
		{{021{1'b0}}, 1'b1 , { (255 - 021) {1'bx}}}: begin exp_tmp[7:0] = 8'd021; out_frac_tmp[22:0] = in_frac_temp[(255 - (021 + 1)): (255 - (021 + 1) - 22) ] ; end
		{{022{1'b0}}, 1'b1 , { (255 - 022) {1'bx}}}: begin exp_tmp[7:0] = 8'd022; out_frac_tmp[22:0] = in_frac_temp[(255 - (022 + 1)): (255 - (022 + 1) - 22) ] ; end
		{{023{1'b0}}, 1'b1 , { (255 - 023) {1'bx}}}: begin exp_tmp[7:0] = 8'd023; out_frac_tmp[22:0] = in_frac_temp[(255 - (023 + 1)): (255 - (023 + 1) - 22) ] ; end
		{{024{1'b0}}, 1'b1 , { (255 - 024) {1'bx}}}: begin exp_tmp[7:0] = 8'd024; out_frac_tmp[22:0] = in_frac_temp[(255 - (024 + 1)): (255 - (024 + 1) - 22) ] ; end
		{{025{1'b0}}, 1'b1 , { (255 - 025) {1'bx}}}: begin exp_tmp[7:0] = 8'd025; out_frac_tmp[22:0] = in_frac_temp[(255 - (025 + 1)): (255 - (025 + 1) - 22) ] ; end
		{{026{1'b0}}, 1'b1 , { (255 - 026) {1'bx}}}: begin exp_tmp[7:0] = 8'd026; out_frac_tmp[22:0] = in_frac_temp[(255 - (026 + 1)): (255 - (026 + 1) - 22) ] ; end
		{{027{1'b0}}, 1'b1 , { (255 - 027) {1'bx}}}: begin exp_tmp[7:0] = 8'd027; out_frac_tmp[22:0] = in_frac_temp[(255 - (027 + 1)): (255 - (027 + 1) - 22) ] ; end
		{{028{1'b0}}, 1'b1 , { (255 - 028) {1'bx}}}: begin exp_tmp[7:0] = 8'd028; out_frac_tmp[22:0] = in_frac_temp[(255 - (028 + 1)): (255 - (028 + 1) - 22) ] ; end
		{{029{1'b0}}, 1'b1 , { (255 - 029) {1'bx}}}: begin exp_tmp[7:0] = 8'd029; out_frac_tmp[22:0] = in_frac_temp[(255 - (029 + 1)): (255 - (029 + 1) - 22) ] ; end
		{{030{1'b0}}, 1'b1 , { (255 - 030) {1'bx}}}: begin exp_tmp[7:0] = 8'd030; out_frac_tmp[22:0] = in_frac_temp[(255 - (030 + 1)): (255 - (030 + 1) - 22) ] ; end//
		{{031{1'b0}}, 1'b1 , { (255 - 031) {1'bx}}}: begin exp_tmp[7:0] = 8'd031; out_frac_tmp[22:0] = in_frac_temp[(255 - (031 + 1)): (255 - (031 + 1) - 22) ] ; end
		{{032{1'b0}}, 1'b1 , { (255 - 032) {1'bx}}}: begin exp_tmp[7:0] = 8'd032; out_frac_tmp[22:0] = in_frac_temp[(255 - (032 + 1)): (255 - (032 + 1) - 22) ] ; end
		{{033{1'b0}}, 1'b1 , { (255 - 033) {1'bx}}}: begin exp_tmp[7:0] = 8'd033; out_frac_tmp[22:0] = in_frac_temp[(255 - (033 + 1)): (255 - (033 + 1) - 22) ] ; end
		{{034{1'b0}}, 1'b1 , { (255 - 034) {1'bx}}}: begin exp_tmp[7:0] = 8'd034; out_frac_tmp[22:0] = in_frac_temp[(255 - (034 + 1)): (255 - (034 + 1) - 22) ] ; end
		{{035{1'b0}}, 1'b1 , { (255 - 035) {1'bx}}}: begin exp_tmp[7:0] = 8'd035; out_frac_tmp[22:0] = in_frac_temp[(255 - (035 + 1)): (255 - (035 + 1) - 22) ] ; end
		{{036{1'b0}}, 1'b1 , { (255 - 036) {1'bx}}}: begin exp_tmp[7:0] = 8'd036; out_frac_tmp[22:0] = in_frac_temp[(255 - (036 + 1)): (255 - (036 + 1) - 22) ] ; end
		{{037{1'b0}}, 1'b1 , { (255 - 037) {1'bx}}}: begin exp_tmp[7:0] = 8'd037; out_frac_tmp[22:0] = in_frac_temp[(255 - (037 + 1)): (255 - (037 + 1) - 22) ] ; end
		{{038{1'b0}}, 1'b1 , { (255 - 038) {1'bx}}}: begin exp_tmp[7:0] = 8'd038; out_frac_tmp[22:0] = in_frac_temp[(255 - (038 + 1)): (255 - (038 + 1) - 22) ] ; end
		{{039{1'b0}}, 1'b1 , { (255 - 039) {1'bx}}}: begin exp_tmp[7:0] = 8'd039; out_frac_tmp[22:0] = in_frac_temp[(255 - (039 + 1)): (255 - (039 + 1) - 22) ] ; end
		{{040{1'b0}}, 1'b1 , { (255 - 040) {1'bx}}}: begin exp_tmp[7:0] = 8'd040; out_frac_tmp[22:0] = in_frac_temp[(255 - (040 + 1)): (255 - (040 + 1) - 22) ] ; end//
		{{041{1'b0}}, 1'b1 , { (255 - 041) {1'bx}}}: begin exp_tmp[7:0] = 8'd041; out_frac_tmp[22:0] = in_frac_temp[(255 - (041 + 1)): (255 - (041 + 1) - 22) ] ; end
		{{042{1'b0}}, 1'b1 , { (255 - 042) {1'bx}}}: begin exp_tmp[7:0] = 8'd042; out_frac_tmp[22:0] = in_frac_temp[(255 - (042 + 1)): (255 - (042 + 1) - 22) ] ; end
		{{043{1'b0}}, 1'b1 , { (255 - 043) {1'bx}}}: begin exp_tmp[7:0] = 8'd043; out_frac_tmp[22:0] = in_frac_temp[(255 - (043 + 1)): (255 - (043 + 1) - 22) ] ; end
		{{044{1'b0}}, 1'b1 , { (255 - 044) {1'bx}}}: begin exp_tmp[7:0] = 8'd044; out_frac_tmp[22:0] = in_frac_temp[(255 - (044 + 1)): (255 - (044 + 1) - 22) ] ; end
		{{045{1'b0}}, 1'b1 , { (255 - 045) {1'bx}}}: begin exp_tmp[7:0] = 8'd045; out_frac_tmp[22:0] = in_frac_temp[(255 - (045 + 1)): (255 - (045 + 1) - 22) ] ; end
		{{046{1'b0}}, 1'b1 , { (255 - 046) {1'bx}}}: begin exp_tmp[7:0] = 8'd046; out_frac_tmp[22:0] = in_frac_temp[(255 - (046 + 1)): (255 - (046 + 1) - 22) ] ; end
		{{047{1'b0}}, 1'b1 , { (255 - 047) {1'bx}}}: begin exp_tmp[7:0] = 8'd047; out_frac_tmp[22:0] = in_frac_temp[(255 - (047 + 1)): (255 - (047 + 1) - 22) ] ; end
		{{048{1'b0}}, 1'b1 , { (255 - 048) {1'bx}}}: begin exp_tmp[7:0] = 8'd048; out_frac_tmp[22:0] = in_frac_temp[(255 - (048 + 1)): (255 - (048 + 1) - 22) ] ; end
		{{049{1'b0}}, 1'b1 , { (255 - 049) {1'bx}}}: begin exp_tmp[7:0] = 8'd049; out_frac_tmp[22:0] = in_frac_temp[(255 - (049 + 1)): (255 - (049 + 1) - 22) ] ; end
		{{050{1'b0}}, 1'b1 , { (255 - 050) {1'bx}}}: begin exp_tmp[7:0] = 8'd050; out_frac_tmp[22:0] = in_frac_temp[(255 - (050 + 1)): (255 - (050 + 1) - 22) ] ; end//
		{{051{1'b0}}, 1'b1 , { (255 - 051) {1'bx}}}: begin exp_tmp[7:0] = 8'd051; out_frac_tmp[22:0] = in_frac_temp[(255 - (051 + 1)): (255 - (051 + 1) - 22) ] ; end
		{{052{1'b0}}, 1'b1 , { (255 - 052) {1'bx}}}: begin exp_tmp[7:0] = 8'd052; out_frac_tmp[22:0] = in_frac_temp[(255 - (052 + 1)): (255 - (052 + 1) - 22) ] ; end
		{{053{1'b0}}, 1'b1 , { (255 - 053) {1'bx}}}: begin exp_tmp[7:0] = 8'd053; out_frac_tmp[22:0] = in_frac_temp[(255 - (053 + 1)): (255 - (053 + 1) - 22) ] ; end
		{{054{1'b0}}, 1'b1 , { (255 - 054) {1'bx}}}: begin exp_tmp[7:0] = 8'd054; out_frac_tmp[22:0] = in_frac_temp[(255 - (054 + 1)): (255 - (054 + 1) - 22) ] ; end
		{{055{1'b0}}, 1'b1 , { (255 - 055) {1'bx}}}: begin exp_tmp[7:0] = 8'd055; out_frac_tmp[22:0] = in_frac_temp[(255 - (055 + 1)): (255 - (055 + 1) - 22) ] ; end
		{{056{1'b0}}, 1'b1 , { (255 - 056) {1'bx}}}: begin exp_tmp[7:0] = 8'd056; out_frac_tmp[22:0] = in_frac_temp[(255 - (056 + 1)): (255 - (056 + 1) - 22) ] ; end
		{{057{1'b0}}, 1'b1 , { (255 - 057) {1'bx}}}: begin exp_tmp[7:0] = 8'd057; out_frac_tmp[22:0] = in_frac_temp[(255 - (057 + 1)): (255 - (057 + 1) - 22) ] ; end
		{{058{1'b0}}, 1'b1 , { (255 - 058) {1'bx}}}: begin exp_tmp[7:0] = 8'd058; out_frac_tmp[22:0] = in_frac_temp[(255 - (058 + 1)): (255 - (058 + 1) - 22) ] ; end
		{{059{1'b0}}, 1'b1 , { (255 - 059) {1'bx}}}: begin exp_tmp[7:0] = 8'd059; out_frac_tmp[22:0] = in_frac_temp[(255 - (059 + 1)): (255 - (059 + 1) - 22) ] ; end
		{{060{1'b0}}, 1'b1 , { (255 - 060) {1'bx}}}: begin exp_tmp[7:0] = 8'd060; out_frac_tmp[22:0] = in_frac_temp[(255 - (060 + 1)): (255 - (060 + 1) - 22) ] ; end//
		{{061{1'b0}}, 1'b1 , { (255 - 061) {1'bx}}}: begin exp_tmp[7:0] = 8'd061; out_frac_tmp[22:0] = in_frac_temp[(255 - (061 + 1)): (255 - (061 + 1) - 22) ] ; end
		{{062{1'b0}}, 1'b1 , { (255 - 062) {1'bx}}}: begin exp_tmp[7:0] = 8'd062; out_frac_tmp[22:0] = in_frac_temp[(255 - (062 + 1)): (255 - (062 + 1) - 22) ] ; end
		{{063{1'b0}}, 1'b1 , { (255 - 063) {1'bx}}}: begin exp_tmp[7:0] = 8'd063; out_frac_tmp[22:0] = in_frac_temp[(255 - (063 + 1)): (255 - (063 + 1) - 22) ] ; end
		{{064{1'b0}}, 1'b1 , { (255 - 064) {1'bx}}}: begin exp_tmp[7:0] = 8'd064; out_frac_tmp[22:0] = in_frac_temp[(255 - (064 + 1)): (255 - (064 + 1) - 22) ] ; end
		{{065{1'b0}}, 1'b1 , { (255 - 065) {1'bx}}}: begin exp_tmp[7:0] = 8'd065; out_frac_tmp[22:0] = in_frac_temp[(255 - (065 + 1)): (255 - (065 + 1) - 22) ] ; end
		{{066{1'b0}}, 1'b1 , { (255 - 066) {1'bx}}}: begin exp_tmp[7:0] = 8'd066; out_frac_tmp[22:0] = in_frac_temp[(255 - (066 + 1)): (255 - (066 + 1) - 22) ] ; end
		{{067{1'b0}}, 1'b1 , { (255 - 067) {1'bx}}}: begin exp_tmp[7:0] = 8'd067; out_frac_tmp[22:0] = in_frac_temp[(255 - (067 + 1)): (255 - (067 + 1) - 22) ] ; end
		{{068{1'b0}}, 1'b1 , { (255 - 068) {1'bx}}}: begin exp_tmp[7:0] = 8'd068; out_frac_tmp[22:0] = in_frac_temp[(255 - (068 + 1)): (255 - (068 + 1) - 22) ] ; end
		{{069{1'b0}}, 1'b1 , { (255 - 069) {1'bx}}}: begin exp_tmp[7:0] = 8'd069; out_frac_tmp[22:0] = in_frac_temp[(255 - (069 + 1)): (255 - (069 + 1) - 22) ] ; end
		{{070{1'b0}}, 1'b1 , { (255 - 070) {1'bx}}}: begin exp_tmp[7:0] = 8'd070; out_frac_tmp[22:0] = in_frac_temp[(255 - (070 + 1)): (255 - (070 + 1) - 22) ] ; end//
		{{071{1'b0}}, 1'b1 , { (255 - 071) {1'bx}}}: begin exp_tmp[7:0] = 8'd071; out_frac_tmp[22:0] = in_frac_temp[(255 - (071 + 1)): (255 - (071 + 1) - 22) ] ; end
		{{072{1'b0}}, 1'b1 , { (255 - 072) {1'bx}}}: begin exp_tmp[7:0] = 8'd072; out_frac_tmp[22:0] = in_frac_temp[(255 - (072 + 1)): (255 - (072 + 1) - 22) ] ; end
		{{073{1'b0}}, 1'b1 , { (255 - 073) {1'bx}}}: begin exp_tmp[7:0] = 8'd073; out_frac_tmp[22:0] = in_frac_temp[(255 - (073 + 1)): (255 - (073 + 1) - 22) ] ; end
		{{074{1'b0}}, 1'b1 , { (255 - 074) {1'bx}}}: begin exp_tmp[7:0] = 8'd074; out_frac_tmp[22:0] = in_frac_temp[(255 - (074 + 1)): (255 - (074 + 1) - 22) ] ; end
		{{075{1'b0}}, 1'b1 , { (255 - 075) {1'bx}}}: begin exp_tmp[7:0] = 8'd075; out_frac_tmp[22:0] = in_frac_temp[(255 - (075 + 1)): (255 - (075 + 1) - 22) ] ; end
		{{076{1'b0}}, 1'b1 , { (255 - 076) {1'bx}}}: begin exp_tmp[7:0] = 8'd076; out_frac_tmp[22:0] = in_frac_temp[(255 - (076 + 1)): (255 - (076 + 1) - 22) ] ; end
		{{077{1'b0}}, 1'b1 , { (255 - 077) {1'bx}}}: begin exp_tmp[7:0] = 8'd077; out_frac_tmp[22:0] = in_frac_temp[(255 - (077 + 1)): (255 - (077 + 1) - 22) ] ; end
		{{078{1'b0}}, 1'b1 , { (255 - 078) {1'bx}}}: begin exp_tmp[7:0] = 8'd078; out_frac_tmp[22:0] = in_frac_temp[(255 - (078 + 1)): (255 - (078 + 1) - 22) ] ; end
		{{079{1'b0}}, 1'b1 , { (255 - 079) {1'bx}}}: begin exp_tmp[7:0] = 8'd079; out_frac_tmp[22:0] = in_frac_temp[(255 - (079 + 1)): (255 - (079 + 1) - 22) ] ; end
		{{080{1'b0}}, 1'b1 , { (255 - 080) {1'bx}}}: begin exp_tmp[7:0] = 8'd080; out_frac_tmp[22:0] = in_frac_temp[(255 - (080 + 1)): (255 - (080 + 1) - 22) ] ; end//
		{{081{1'b0}}, 1'b1 , { (255 - 081) {1'bx}}}: begin exp_tmp[7:0] = 8'd081; out_frac_tmp[22:0] = in_frac_temp[(255 - (081 + 1)): (255 - (081 + 1) - 22) ] ; end
		{{082{1'b0}}, 1'b1 , { (255 - 082) {1'bx}}}: begin exp_tmp[7:0] = 8'd082; out_frac_tmp[22:0] = in_frac_temp[(255 - (082 + 1)): (255 - (082 + 1) - 22) ] ; end
		{{083{1'b0}}, 1'b1 , { (255 - 083) {1'bx}}}: begin exp_tmp[7:0] = 8'd083; out_frac_tmp[22:0] = in_frac_temp[(255 - (083 + 1)): (255 - (083 + 1) - 22) ] ; end
		{{084{1'b0}}, 1'b1 , { (255 - 084) {1'bx}}}: begin exp_tmp[7:0] = 8'd084; out_frac_tmp[22:0] = in_frac_temp[(255 - (084 + 1)): (255 - (084 + 1) - 22) ] ; end
		{{085{1'b0}}, 1'b1 , { (255 - 085) {1'bx}}}: begin exp_tmp[7:0] = 8'd085; out_frac_tmp[22:0] = in_frac_temp[(255 - (085 + 1)): (255 - (085 + 1) - 22) ] ; end
		{{086{1'b0}}, 1'b1 , { (255 - 086) {1'bx}}}: begin exp_tmp[7:0] = 8'd086; out_frac_tmp[22:0] = in_frac_temp[(255 - (086 + 1)): (255 - (086 + 1) - 22) ] ; end
		{{087{1'b0}}, 1'b1 , { (255 - 087) {1'bx}}}: begin exp_tmp[7:0] = 8'd087; out_frac_tmp[22:0] = in_frac_temp[(255 - (087 + 1)): (255 - (087 + 1) - 22) ] ; end
		{{088{1'b0}}, 1'b1 , { (255 - 088) {1'bx}}}: begin exp_tmp[7:0] = 8'd088; out_frac_tmp[22:0] = in_frac_temp[(255 - (088 + 1)): (255 - (088 + 1) - 22) ] ; end
		{{089{1'b0}}, 1'b1 , { (255 - 089) {1'bx}}}: begin exp_tmp[7:0] = 8'd089; out_frac_tmp[22:0] = in_frac_temp[(255 - (089 + 1)): (255 - (089 + 1) - 22) ] ; end
		{{090{1'b0}}, 1'b1 , { (255 - 090) {1'bx}}}: begin exp_tmp[7:0] = 8'd090; out_frac_tmp[22:0] = in_frac_temp[(255 - (090 + 1)): (255 - (090 + 1) - 22) ] ; end//
		{{091{1'b0}}, 1'b1 , { (255 - 091) {1'bx}}}: begin exp_tmp[7:0] = 8'd091; out_frac_tmp[22:0] = in_frac_temp[(255 - (091 + 1)): (255 - (091 + 1) - 22) ] ; end
		{{092{1'b0}}, 1'b1 , { (255 - 092) {1'bx}}}: begin exp_tmp[7:0] = 8'd092; out_frac_tmp[22:0] = in_frac_temp[(255 - (092 + 1)): (255 - (092 + 1) - 22) ] ; end
		{{093{1'b0}}, 1'b1 , { (255 - 093) {1'bx}}}: begin exp_tmp[7:0] = 8'd093; out_frac_tmp[22:0] = in_frac_temp[(255 - (093 + 1)): (255 - (093 + 1) - 22) ] ; end
		{{094{1'b0}}, 1'b1 , { (255 - 094) {1'bx}}}: begin exp_tmp[7:0] = 8'd094; out_frac_tmp[22:0] = in_frac_temp[(255 - (094 + 1)): (255 - (094 + 1) - 22) ] ; end
		{{095{1'b0}}, 1'b1 , { (255 - 095) {1'bx}}}: begin exp_tmp[7:0] = 8'd095; out_frac_tmp[22:0] = in_frac_temp[(255 - (095 + 1)): (255 - (095 + 1) - 22) ] ; end
		{{096{1'b0}}, 1'b1 , { (255 - 096) {1'bx}}}: begin exp_tmp[7:0] = 8'd096; out_frac_tmp[22:0] = in_frac_temp[(255 - (096 + 1)): (255 - (096 + 1) - 22) ] ; end
		{{097{1'b0}}, 1'b1 , { (255 - 097) {1'bx}}}: begin exp_tmp[7:0] = 8'd097; out_frac_tmp[22:0] = in_frac_temp[(255 - (097 + 1)): (255 - (097 + 1) - 22) ] ; end
		{{098{1'b0}}, 1'b1 , { (255 - 098) {1'bx}}}: begin exp_tmp[7:0] = 8'd098; out_frac_tmp[22:0] = in_frac_temp[(255 - (098 + 1)): (255 - (098 + 1) - 22) ] ; end
		{{099{1'b0}}, 1'b1 , { (255 - 099) {1'bx}}}: begin exp_tmp[7:0] = 8'd099; out_frac_tmp[22:0] = in_frac_temp[(255 - (099 + 1)): (255 - (099 + 1) - 22) ] ; end
		{{100{1'b0}}, 1'b1 , { (255 - 100) {1'bx}}}: begin exp_tmp[7:0] = 8'd100; out_frac_tmp[22:0] = in_frac_temp[(255 - (100 + 1)): (255 - (100 + 1) - 22) ] ; end////////
		{{101{1'b0}}, 1'b1 , { (255 - 101) {1'bx}}}: begin exp_tmp[7:0] = 8'd101; out_frac_tmp[22:0] = in_frac_temp[(255 - (101 + 1)): (255 - (101 + 1) - 22) ] ; end
		{{102{1'b0}}, 1'b1 , { (255 - 102) {1'bx}}}: begin exp_tmp[7:0] = 8'd102; out_frac_tmp[22:0] = in_frac_temp[(255 - (102 + 1)): (255 - (102 + 1) - 22) ] ; end
		{{103{1'b0}}, 1'b1 , { (255 - 103) {1'bx}}}: begin exp_tmp[7:0] = 8'd103; out_frac_tmp[22:0] = in_frac_temp[(255 - (103 + 1)): (255 - (103 + 1) - 22) ] ; end
		{{104{1'b0}}, 1'b1 , { (255 - 104) {1'bx}}}: begin exp_tmp[7:0] = 8'd104; out_frac_tmp[22:0] = in_frac_temp[(255 - (104 + 1)): (255 - (104 + 1) - 22) ] ; end
		{{105{1'b0}}, 1'b1 , { (255 - 105) {1'bx}}}: begin exp_tmp[7:0] = 8'd105; out_frac_tmp[22:0] = in_frac_temp[(255 - (105 + 1)): (255 - (105 + 1) - 22) ] ; end
		{{106{1'b0}}, 1'b1 , { (255 - 106) {1'bx}}}: begin exp_tmp[7:0] = 8'd106; out_frac_tmp[22:0] = in_frac_temp[(255 - (106 + 1)): (255 - (106 + 1) - 22) ] ; end
		{{107{1'b0}}, 1'b1 , { (255 - 107) {1'bx}}}: begin exp_tmp[7:0] = 8'd107; out_frac_tmp[22:0] = in_frac_temp[(255 - (107 + 1)): (255 - (107 + 1) - 22) ] ; end
		{{108{1'b0}}, 1'b1 , { (255 - 108) {1'bx}}}: begin exp_tmp[7:0] = 8'd108; out_frac_tmp[22:0] = in_frac_temp[(255 - (108 + 1)): (255 - (108 + 1) - 22) ] ; end
		{{109{1'b0}}, 1'b1 , { (255 - 109) {1'bx}}}: begin exp_tmp[7:0] = 8'd109; out_frac_tmp[22:0] = in_frac_temp[(255 - (109 + 1)): (255 - (109 + 1) - 22) ] ; end
		{{110{1'b0}}, 1'b1 , { (255 - 110) {1'bx}}}: begin exp_tmp[7:0] = 8'd110; out_frac_tmp[22:0] = in_frac_temp[(255 - (110 + 1)): (255 - (110 + 1) - 22) ] ; end//
		{{111{1'b0}}, 1'b1 , { (255 - 111) {1'bx}}}: begin exp_tmp[7:0] = 8'd111; out_frac_tmp[22:0] = in_frac_temp[(255 - (111 + 1)): (255 - (111 + 1) - 22) ] ; end
		{{112{1'b0}}, 1'b1 , { (255 - 112) {1'bx}}}: begin exp_tmp[7:0] = 8'd112; out_frac_tmp[22:0] = in_frac_temp[(255 - (112 + 1)): (255 - (112 + 1) - 22) ] ; end
		{{113{1'b0}}, 1'b1 , { (255 - 113) {1'bx}}}: begin exp_tmp[7:0] = 8'd113; out_frac_tmp[22:0] = in_frac_temp[(255 - (113 + 1)): (255 - (113 + 1) - 22) ] ; end
		{{114{1'b0}}, 1'b1 , { (255 - 114) {1'bx}}}: begin exp_tmp[7:0] = 8'd114; out_frac_tmp[22:0] = in_frac_temp[(255 - (114 + 1)): (255 - (114 + 1) - 22) ] ; end
		{{115{1'b0}}, 1'b1 , { (255 - 115) {1'bx}}}: begin exp_tmp[7:0] = 8'd115; out_frac_tmp[22:0] = in_frac_temp[(255 - (115 + 1)): (255 - (115 + 1) - 22) ] ; end
		{{116{1'b0}}, 1'b1 , { (255 - 116) {1'bx}}}: begin exp_tmp[7:0] = 8'd116; out_frac_tmp[22:0] = in_frac_temp[(255 - (116 + 1)): (255 - (116 + 1) - 22) ] ; end
		{{117{1'b0}}, 1'b1 , { (255 - 117) {1'bx}}}: begin exp_tmp[7:0] = 8'd117; out_frac_tmp[22:0] = in_frac_temp[(255 - (117 + 1)): (255 - (117 + 1) - 22) ] ; end
		{{118{1'b0}}, 1'b1 , { (255 - 118) {1'bx}}}: begin exp_tmp[7:0] = 8'd118; out_frac_tmp[22:0] = in_frac_temp[(255 - (118 + 1)): (255 - (118 + 1) - 22) ] ; end
		{{119{1'b0}}, 1'b1 , { (255 - 119) {1'bx}}}: begin exp_tmp[7:0] = 8'd119; out_frac_tmp[22:0] = in_frac_temp[(255 - (119 + 1)): (255 - (119 + 1) - 22) ] ; end
		{{120{1'b0}}, 1'b1 , { (255 - 120) {1'bx}}}: begin exp_tmp[7:0] = 8'd120; out_frac_tmp[22:0] = in_frac_temp[(255 - (120 + 1)): (255 - (120 + 1) - 22) ] ; end//
		{{121{1'b0}}, 1'b1 , { (255 - 121) {1'bx}}}: begin exp_tmp[7:0] = 8'd121; out_frac_tmp[22:0] = in_frac_temp[(255 - (121 + 1)): (255 - (121 + 1) - 22) ] ; end
		{{122{1'b0}}, 1'b1 , { (255 - 122) {1'bx}}}: begin exp_tmp[7:0] = 8'd122; out_frac_tmp[22:0] = in_frac_temp[(255 - (122 + 1)): (255 - (122 + 1) - 22) ] ; end
		{{123{1'b0}}, 1'b1 , { (255 - 123) {1'bx}}}: begin exp_tmp[7:0] = 8'd123; out_frac_tmp[22:0] = in_frac_temp[(255 - (123 + 1)): (255 - (123 + 1) - 22) ] ; end
		{{124{1'b0}}, 1'b1 , { (255 - 124) {1'bx}}}: begin exp_tmp[7:0] = 8'd124; out_frac_tmp[22:0] = in_frac_temp[(255 - (124 + 1)): (255 - (124 + 1) - 22) ] ; end
		{{125{1'b0}}, 1'b1 , { (255 - 125) {1'bx}}}: begin exp_tmp[7:0] = 8'd125; out_frac_tmp[22:0] = in_frac_temp[(255 - (125 + 1)): (255 - (125 + 1) - 22) ] ; end
		{{126{1'b0}}, 1'b1 , { (255 - 126) {1'bx}}}: begin exp_tmp[7:0] = 8'd126; out_frac_tmp[22:0] = in_frac_temp[(255 - (126 + 1)): (255 - (126 + 1) - 22) ] ; end
		{{127{1'b0}}, 1'b1 , { (255 - 127) {1'bx}}}: begin exp_tmp[7:0] = 8'd127; out_frac_tmp[22:0] = in_frac_temp[(255 - (127 + 1)): (255 - (127 + 1) - 22) ] ; end
		{{128{1'b0}}, 1'b1 , { (255 - 128) {1'bx}}}: begin exp_tmp[7:0] = 8'd128; out_frac_tmp[22:0] = in_frac_temp[(255 - (128 + 1)): (255 - (128 + 1) - 22) ] ; end
		{{129{1'b0}}, 1'b1 , { (255 - 129) {1'bx}}}: begin exp_tmp[7:0] = 8'd129; out_frac_tmp[22:0] = in_frac_temp[(255 - (129 + 1)): (255 - (129 + 1) - 22) ] ; end
		{{130{1'b0}}, 1'b1 , { (255 - 130) {1'bx}}}: begin exp_tmp[7:0] = 8'd130; out_frac_tmp[22:0] = in_frac_temp[(255 - (130 + 1)): (255 - (130 + 1) - 22) ] ; end//
		{{131{1'b0}}, 1'b1 , { (255 - 131) {1'bx}}}: begin exp_tmp[7:0] = 8'd131; out_frac_tmp[22:0] = in_frac_temp[(255 - (131 + 1)): (255 - (131 + 1) - 22) ] ; end
		{{132{1'b0}}, 1'b1 , { (255 - 132) {1'bx}}}: begin exp_tmp[7:0] = 8'd132; out_frac_tmp[22:0] = in_frac_temp[(255 - (132 + 1)): (255 - (132 + 1) - 22) ] ; end
		{{133{1'b0}}, 1'b1 , { (255 - 133) {1'bx}}}: begin exp_tmp[7:0] = 8'd133; out_frac_tmp[22:0] = in_frac_temp[(255 - (133 + 1)): (255 - (133 + 1) - 22) ] ; end
		{{134{1'b0}}, 1'b1 , { (255 - 134) {1'bx}}}: begin exp_tmp[7:0] = 8'd134; out_frac_tmp[22:0] = in_frac_temp[(255 - (134 + 1)): (255 - (134 + 1) - 22) ] ; end
		{{135{1'b0}}, 1'b1 , { (255 - 135) {1'bx}}}: begin exp_tmp[7:0] = 8'd135; out_frac_tmp[22:0] = in_frac_temp[(255 - (135 + 1)): (255 - (135 + 1) - 22) ] ; end
		{{136{1'b0}}, 1'b1 , { (255 - 136) {1'bx}}}: begin exp_tmp[7:0] = 8'd136; out_frac_tmp[22:0] = in_frac_temp[(255 - (136 + 1)): (255 - (136 + 1) - 22) ] ; end
		{{137{1'b0}}, 1'b1 , { (255 - 137) {1'bx}}}: begin exp_tmp[7:0] = 8'd137; out_frac_tmp[22:0] = in_frac_temp[(255 - (137 + 1)): (255 - (137 + 1) - 22) ] ; end
		{{138{1'b0}}, 1'b1 , { (255 - 138) {1'bx}}}: begin exp_tmp[7:0] = 8'd138; out_frac_tmp[22:0] = in_frac_temp[(255 - (138 + 1)): (255 - (138 + 1) - 22) ] ; end
		{{139{1'b0}}, 1'b1 , { (255 - 139) {1'bx}}}: begin exp_tmp[7:0] = 8'd139; out_frac_tmp[22:0] = in_frac_temp[(255 - (139 + 1)): (255 - (139 + 1) - 22) ] ; end
		{{140{1'b0}}, 1'b1 , { (255 - 140) {1'bx}}}: begin exp_tmp[7:0] = 8'd140; out_frac_tmp[22:0] = in_frac_temp[(255 - (140 + 1)): (255 - (140 + 1) - 22) ] ; end//
		{{141{1'b0}}, 1'b1 , { (255 - 141) {1'bx}}}: begin exp_tmp[7:0] = 8'd141; out_frac_tmp[22:0] = in_frac_temp[(255 - (141 + 1)): (255 - (141 + 1) - 22) ] ; end
		{{142{1'b0}}, 1'b1 , { (255 - 142) {1'bx}}}: begin exp_tmp[7:0] = 8'd142; out_frac_tmp[22:0] = in_frac_temp[(255 - (142 + 1)): (255 - (142 + 1) - 22) ] ; end
		{{143{1'b0}}, 1'b1 , { (255 - 143) {1'bx}}}: begin exp_tmp[7:0] = 8'd143; out_frac_tmp[22:0] = in_frac_temp[(255 - (143 + 1)): (255 - (143 + 1) - 22) ] ; end
		{{144{1'b0}}, 1'b1 , { (255 - 144) {1'bx}}}: begin exp_tmp[7:0] = 8'd144; out_frac_tmp[22:0] = in_frac_temp[(255 - (144 + 1)): (255 - (144 + 1) - 22) ] ; end
		{{145{1'b0}}, 1'b1 , { (255 - 145) {1'bx}}}: begin exp_tmp[7:0] = 8'd145; out_frac_tmp[22:0] = in_frac_temp[(255 - (145 + 1)): (255 - (145 + 1) - 22) ] ; end
		{{146{1'b0}}, 1'b1 , { (255 - 146) {1'bx}}}: begin exp_tmp[7:0] = 8'd146; out_frac_tmp[22:0] = in_frac_temp[(255 - (146 + 1)): (255 - (146 + 1) - 22) ] ; end
		{{147{1'b0}}, 1'b1 , { (255 - 147) {1'bx}}}: begin exp_tmp[7:0] = 8'd147; out_frac_tmp[22:0] = in_frac_temp[(255 - (147 + 1)): (255 - (147 + 1) - 22) ] ; end
		{{148{1'b0}}, 1'b1 , { (255 - 148) {1'bx}}}: begin exp_tmp[7:0] = 8'd148; out_frac_tmp[22:0] = in_frac_temp[(255 - (148 + 1)): (255 - (148 + 1) - 22) ] ; end
		{{149{1'b0}}, 1'b1 , { (255 - 149) {1'bx}}}: begin exp_tmp[7:0] = 8'd149; out_frac_tmp[22:0] = in_frac_temp[(255 - (149 + 1)): (255 - (149 + 1) - 22) ] ; end
		{{150{1'b0}}, 1'b1 , { (255 - 150) {1'bx}}}: begin exp_tmp[7:0] = 8'd150; out_frac_tmp[22:0] = in_frac_temp[(255 - (150 + 1)): (255 - (150 + 1) - 22) ] ; end//
		{{151{1'b0}}, 1'b1 , { (255 - 151) {1'bx}}}: begin exp_tmp[7:0] = 8'd151; out_frac_tmp[22:0] = in_frac_temp[(255 - (151 + 1)): (255 - (151 + 1) - 22) ] ; end
		{{152{1'b0}}, 1'b1 , { (255 - 152) {1'bx}}}: begin exp_tmp[7:0] = 8'd152; out_frac_tmp[22:0] = in_frac_temp[(255 - (152 + 1)): (255 - (152 + 1) - 22) ] ; end
		{{153{1'b0}}, 1'b1 , { (255 - 153) {1'bx}}}: begin exp_tmp[7:0] = 8'd153; out_frac_tmp[22:0] = in_frac_temp[(255 - (153 + 1)): (255 - (153 + 1) - 22) ] ; end
		{{154{1'b0}}, 1'b1 , { (255 - 154) {1'bx}}}: begin exp_tmp[7:0] = 8'd154; out_frac_tmp[22:0] = in_frac_temp[(255 - (154 + 1)): (255 - (154 + 1) - 22) ] ; end
		{{155{1'b0}}, 1'b1 , { (255 - 155) {1'bx}}}: begin exp_tmp[7:0] = 8'd155; out_frac_tmp[22:0] = in_frac_temp[(255 - (155 + 1)): (255 - (155 + 1) - 22) ] ; end
		{{156{1'b0}}, 1'b1 , { (255 - 156) {1'bx}}}: begin exp_tmp[7:0] = 8'd156; out_frac_tmp[22:0] = in_frac_temp[(255 - (156 + 1)): (255 - (156 + 1) - 22) ] ; end
		{{157{1'b0}}, 1'b1 , { (255 - 157) {1'bx}}}: begin exp_tmp[7:0] = 8'd157; out_frac_tmp[22:0] = in_frac_temp[(255 - (157 + 1)): (255 - (157 + 1) - 22) ] ; end
		{{158{1'b0}}, 1'b1 , { (255 - 158) {1'bx}}}: begin exp_tmp[7:0] = 8'd158; out_frac_tmp[22:0] = in_frac_temp[(255 - (158 + 1)): (255 - (158 + 1) - 22) ] ; end
		{{159{1'b0}}, 1'b1 , { (255 - 159) {1'bx}}}: begin exp_tmp[7:0] = 8'd159; out_frac_tmp[22:0] = in_frac_temp[(255 - (159 + 1)): (255 - (159 + 1) - 22) ] ; end
		{{160{1'b0}}, 1'b1 , { (255 - 160) {1'bx}}}: begin exp_tmp[7:0] = 8'd160; out_frac_tmp[22:0] = in_frac_temp[(255 - (160 + 1)): (255 - (160 + 1) - 22) ] ; end//
		{{161{1'b0}}, 1'b1 , { (255 - 161) {1'bx}}}: begin exp_tmp[7:0] = 8'd161; out_frac_tmp[22:0] = in_frac_temp[(255 - (161 + 1)): (255 - (161 + 1) - 22) ] ; end
		{{162{1'b0}}, 1'b1 , { (255 - 162) {1'bx}}}: begin exp_tmp[7:0] = 8'd162; out_frac_tmp[22:0] = in_frac_temp[(255 - (162 + 1)): (255 - (162 + 1) - 22) ] ; end
		{{163{1'b0}}, 1'b1 , { (255 - 163) {1'bx}}}: begin exp_tmp[7:0] = 8'd163; out_frac_tmp[22:0] = in_frac_temp[(255 - (163 + 1)): (255 - (163 + 1) - 22) ] ; end
		{{164{1'b0}}, 1'b1 , { (255 - 164) {1'bx}}}: begin exp_tmp[7:0] = 8'd164; out_frac_tmp[22:0] = in_frac_temp[(255 - (164 + 1)): (255 - (164 + 1) - 22) ] ; end
		{{165{1'b0}}, 1'b1 , { (255 - 165) {1'bx}}}: begin exp_tmp[7:0] = 8'd165; out_frac_tmp[22:0] = in_frac_temp[(255 - (165 + 1)): (255 - (165 + 1) - 22) ] ; end
		{{166{1'b0}}, 1'b1 , { (255 - 166) {1'bx}}}: begin exp_tmp[7:0] = 8'd166; out_frac_tmp[22:0] = in_frac_temp[(255 - (166 + 1)): (255 - (166 + 1) - 22) ] ; end
		{{167{1'b0}}, 1'b1 , { (255 - 167) {1'bx}}}: begin exp_tmp[7:0] = 8'd167; out_frac_tmp[22:0] = in_frac_temp[(255 - (167 + 1)): (255 - (167 + 1) - 22) ] ; end
		{{168{1'b0}}, 1'b1 , { (255 - 168) {1'bx}}}: begin exp_tmp[7:0] = 8'd168; out_frac_tmp[22:0] = in_frac_temp[(255 - (168 + 1)): (255 - (168 + 1) - 22) ] ; end
		{{169{1'b0}}, 1'b1 , { (255 - 169) {1'bx}}}: begin exp_tmp[7:0] = 8'd169; out_frac_tmp[22:0] = in_frac_temp[(255 - (169 + 1)): (255 - (169 + 1) - 22) ] ; end
		{{170{1'b0}}, 1'b1 , { (255 - 170) {1'bx}}}: begin exp_tmp[7:0] = 8'd170; out_frac_tmp[22:0] = in_frac_temp[(255 - (170 + 1)): (255 - (170 + 1) - 22) ] ; end//
		{{171{1'b0}}, 1'b1 , { (255 - 171) {1'bx}}}: begin exp_tmp[7:0] = 8'd171; out_frac_tmp[22:0] = in_frac_temp[(255 - (171 + 1)): (255 - (171 + 1) - 22) ] ; end
		{{172{1'b0}}, 1'b1 , { (255 - 172) {1'bx}}}: begin exp_tmp[7:0] = 8'd172; out_frac_tmp[22:0] = in_frac_temp[(255 - (172 + 1)): (255 - (172 + 1) - 22) ] ; end
		{{173{1'b0}}, 1'b1 , { (255 - 173) {1'bx}}}: begin exp_tmp[7:0] = 8'd173; out_frac_tmp[22:0] = in_frac_temp[(255 - (173 + 1)): (255 - (173 + 1) - 22) ] ; end
		{{174{1'b0}}, 1'b1 , { (255 - 174) {1'bx}}}: begin exp_tmp[7:0] = 8'd174; out_frac_tmp[22:0] = in_frac_temp[(255 - (174 + 1)): (255 - (174 + 1) - 22) ] ; end
		{{175{1'b0}}, 1'b1 , { (255 - 175) {1'bx}}}: begin exp_tmp[7:0] = 8'd175; out_frac_tmp[22:0] = in_frac_temp[(255 - (175 + 1)): (255 - (175 + 1) - 22) ] ; end
		{{176{1'b0}}, 1'b1 , { (255 - 176) {1'bx}}}: begin exp_tmp[7:0] = 8'd176; out_frac_tmp[22:0] = in_frac_temp[(255 - (176 + 1)): (255 - (176 + 1) - 22) ] ; end
		{{177{1'b0}}, 1'b1 , { (255 - 177) {1'bx}}}: begin exp_tmp[7:0] = 8'd177; out_frac_tmp[22:0] = in_frac_temp[(255 - (177 + 1)): (255 - (177 + 1) - 22) ] ; end
		{{178{1'b0}}, 1'b1 , { (255 - 178) {1'bx}}}: begin exp_tmp[7:0] = 8'd178; out_frac_tmp[22:0] = in_frac_temp[(255 - (178 + 1)): (255 - (178 + 1) - 22) ] ; end
		{{179{1'b0}}, 1'b1 , { (255 - 179) {1'bx}}}: begin exp_tmp[7:0] = 8'd179; out_frac_tmp[22:0] = in_frac_temp[(255 - (179 + 1)): (255 - (179 + 1) - 22) ] ; end
		{{180{1'b0}}, 1'b1 , { (255 - 180) {1'bx}}}: begin exp_tmp[7:0] = 8'd180; out_frac_tmp[22:0] = in_frac_temp[(255 - (180 + 1)): (255 - (180 + 1) - 22) ] ; end//
		{{181{1'b0}}, 1'b1 , { (255 - 181) {1'bx}}}: begin exp_tmp[7:0] = 8'd181; out_frac_tmp[22:0] = in_frac_temp[(255 - (181 + 1)): (255 - (181 + 1) - 22) ] ; end
		{{182{1'b0}}, 1'b1 , { (255 - 182) {1'bx}}}: begin exp_tmp[7:0] = 8'd182; out_frac_tmp[22:0] = in_frac_temp[(255 - (182 + 1)): (255 - (182 + 1) - 22) ] ; end
		{{183{1'b0}}, 1'b1 , { (255 - 183) {1'bx}}}: begin exp_tmp[7:0] = 8'd183; out_frac_tmp[22:0] = in_frac_temp[(255 - (183 + 1)): (255 - (183 + 1) - 22) ] ; end
		{{184{1'b0}}, 1'b1 , { (255 - 184) {1'bx}}}: begin exp_tmp[7:0] = 8'd184; out_frac_tmp[22:0] = in_frac_temp[(255 - (184 + 1)): (255 - (184 + 1) - 22) ] ; end
		{{185{1'b0}}, 1'b1 , { (255 - 185) {1'bx}}}: begin exp_tmp[7:0] = 8'd185; out_frac_tmp[22:0] = in_frac_temp[(255 - (185 + 1)): (255 - (185 + 1) - 22) ] ; end
		{{186{1'b0}}, 1'b1 , { (255 - 186) {1'bx}}}: begin exp_tmp[7:0] = 8'd186; out_frac_tmp[22:0] = in_frac_temp[(255 - (186 + 1)): (255 - (186 + 1) - 22) ] ; end
		{{187{1'b0}}, 1'b1 , { (255 - 187) {1'bx}}}: begin exp_tmp[7:0] = 8'd187; out_frac_tmp[22:0] = in_frac_temp[(255 - (187 + 1)): (255 - (187 + 1) - 22) ] ; end
		{{188{1'b0}}, 1'b1 , { (255 - 188) {1'bx}}}: begin exp_tmp[7:0] = 8'd188; out_frac_tmp[22:0] = in_frac_temp[(255 - (188 + 1)): (255 - (188 + 1) - 22) ] ; end
		{{189{1'b0}}, 1'b1 , { (255 - 189) {1'bx}}}: begin exp_tmp[7:0] = 8'd189; out_frac_tmp[22:0] = in_frac_temp[(255 - (189 + 1)): (255 - (189 + 1) - 22) ] ; end
		{{190{1'b0}}, 1'b1 , { (255 - 190) {1'bx}}}: begin exp_tmp[7:0] = 8'd190; out_frac_tmp[22:0] = in_frac_temp[(255 - (190 + 1)): (255 - (190 + 1) - 22) ] ; end//
		{{191{1'b0}}, 1'b1 , { (255 - 191) {1'bx}}}: begin exp_tmp[7:0] = 8'd191; out_frac_tmp[22:0] = in_frac_temp[(255 - (191 + 1)): (255 - (191 + 1) - 22) ] ; end
		{{192{1'b0}}, 1'b1 , { (255 - 192) {1'bx}}}: begin exp_tmp[7:0] = 8'd192; out_frac_tmp[22:0] = in_frac_temp[(255 - (192 + 1)): (255 - (192 + 1) - 22) ] ; end
		{{193{1'b0}}, 1'b1 , { (255 - 193) {1'bx}}}: begin exp_tmp[7:0] = 8'd193; out_frac_tmp[22:0] = in_frac_temp[(255 - (193 + 1)): (255 - (193 + 1) - 22) ] ; end
		{{194{1'b0}}, 1'b1 , { (255 - 194) {1'bx}}}: begin exp_tmp[7:0] = 8'd194; out_frac_tmp[22:0] = in_frac_temp[(255 - (194 + 1)): (255 - (194 + 1) - 22) ] ; end
		{{195{1'b0}}, 1'b1 , { (255 - 195) {1'bx}}}: begin exp_tmp[7:0] = 8'd195; out_frac_tmp[22:0] = in_frac_temp[(255 - (195 + 1)): (255 - (195 + 1) - 22) ] ; end
		{{196{1'b0}}, 1'b1 , { (255 - 196) {1'bx}}}: begin exp_tmp[7:0] = 8'd196; out_frac_tmp[22:0] = in_frac_temp[(255 - (196 + 1)): (255 - (196 + 1) - 22) ] ; end
		{{197{1'b0}}, 1'b1 , { (255 - 197) {1'bx}}}: begin exp_tmp[7:0] = 8'd197; out_frac_tmp[22:0] = in_frac_temp[(255 - (197 + 1)): (255 - (197 + 1) - 22) ] ; end
		{{198{1'b0}}, 1'b1 , { (255 - 198) {1'bx}}}: begin exp_tmp[7:0] = 8'd198; out_frac_tmp[22:0] = in_frac_temp[(255 - (198 + 1)): (255 - (198 + 1) - 22) ] ; end
		{{199{1'b0}}, 1'b1 , { (255 - 199) {1'bx}}}: begin exp_tmp[7:0] = 8'd199; out_frac_tmp[22:0] = in_frac_temp[(255 - (199 + 1)): (255 - (199 + 1) - 22) ] ; end
		{{200{1'b0}}, 1'b1 , { (255 - 200) {1'bx}}}: begin exp_tmp[7:0] = 8'd200; out_frac_tmp[22:0] = in_frac_temp[(255 - (200 + 1)): (255 - (200 + 1) - 22) ] ; end////////
		{{201{1'b0}}, 1'b1 , { (255 - 201) {1'bx}}}: begin exp_tmp[7:0] = 8'd201; out_frac_tmp[22:0] = in_frac_temp[(255 - (201 + 1)): (255 - (201 + 1) - 22) ] ; end
		{{202{1'b0}}, 1'b1 , { (255 - 202) {1'bx}}}: begin exp_tmp[7:0] = 8'd202; out_frac_tmp[22:0] = in_frac_temp[(255 - (202 + 1)): (255 - (202 + 1) - 22) ] ; end
		{{203{1'b0}}, 1'b1 , { (255 - 203) {1'bx}}}: begin exp_tmp[7:0] = 8'd203; out_frac_tmp[22:0] = in_frac_temp[(255 - (203 + 1)): (255 - (203 + 1) - 22) ] ; end
		{{204{1'b0}}, 1'b1 , { (255 - 204) {1'bx}}}: begin exp_tmp[7:0] = 8'd204; out_frac_tmp[22:0] = in_frac_temp[(255 - (204 + 1)): (255 - (204 + 1) - 22) ] ; end
		{{205{1'b0}}, 1'b1 , { (255 - 205) {1'bx}}}: begin exp_tmp[7:0] = 8'd205; out_frac_tmp[22:0] = in_frac_temp[(255 - (205 + 1)): (255 - (205 + 1) - 22) ] ; end
		{{206{1'b0}}, 1'b1 , { (255 - 206) {1'bx}}}: begin exp_tmp[7:0] = 8'd206; out_frac_tmp[22:0] = in_frac_temp[(255 - (206 + 1)): (255 - (206 + 1) - 22) ] ; end
		{{207{1'b0}}, 1'b1 , { (255 - 207) {1'bx}}}: begin exp_tmp[7:0] = 8'd207; out_frac_tmp[22:0] = in_frac_temp[(255 - (207 + 1)): (255 - (207 + 1) - 22) ] ; end
		{{208{1'b0}}, 1'b1 , { (255 - 208) {1'bx}}}: begin exp_tmp[7:0] = 8'd208; out_frac_tmp[22:0] = in_frac_temp[(255 - (208 + 1)): (255 - (208 + 1) - 22) ] ; end
		{{209{1'b0}}, 1'b1 , { (255 - 209) {1'bx}}}: begin exp_tmp[7:0] = 8'd209; out_frac_tmp[22:0] = in_frac_temp[(255 - (209 + 1)): (255 - (209 + 1) - 22) ] ; end
		{{210{1'b0}}, 1'b1 , { (255 - 210) {1'bx}}}: begin exp_tmp[7:0] = 8'd210; out_frac_tmp[22:0] = in_frac_temp[(255 - (210 + 1)): (255 - (210 + 1) - 22) ] ; end//
		{{211{1'b0}}, 1'b1 , { (255 - 211) {1'bx}}}: begin exp_tmp[7:0] = 8'd211; out_frac_tmp[22:0] = in_frac_temp[(255 - (211 + 1)): (255 - (211 + 1) - 22) ] ; end
		{{212{1'b0}}, 1'b1 , { (255 - 212) {1'bx}}}: begin exp_tmp[7:0] = 8'd212; out_frac_tmp[22:0] = in_frac_temp[(255 - (212 + 1)): (255 - (212 + 1) - 22) ] ; end
		{{213{1'b0}}, 1'b1 , { (255 - 213) {1'bx}}}: begin exp_tmp[7:0] = 8'd213; out_frac_tmp[22:0] = in_frac_temp[(255 - (213 + 1)): (255 - (213 + 1) - 22) ] ; end
		{{214{1'b0}}, 1'b1 , { (255 - 214) {1'bx}}}: begin exp_tmp[7:0] = 8'd214; out_frac_tmp[22:0] = in_frac_temp[(255 - (214 + 1)): (255 - (214 + 1) - 22) ] ; end
		{{215{1'b0}}, 1'b1 , { (255 - 215) {1'bx}}}: begin exp_tmp[7:0] = 8'd215; out_frac_tmp[22:0] = in_frac_temp[(255 - (215 + 1)): (255 - (215 + 1) - 22) ] ; end
		{{216{1'b0}}, 1'b1 , { (255 - 216) {1'bx}}}: begin exp_tmp[7:0] = 8'd216; out_frac_tmp[22:0] = in_frac_temp[(255 - (216 + 1)): (255 - (216 + 1) - 22) ] ; end
		{{217{1'b0}}, 1'b1 , { (255 - 217) {1'bx}}}: begin exp_tmp[7:0] = 8'd217; out_frac_tmp[22:0] = in_frac_temp[(255 - (217 + 1)): (255 - (217 + 1) - 22) ] ; end
		{{218{1'b0}}, 1'b1 , { (255 - 218) {1'bx}}}: begin exp_tmp[7:0] = 8'd218; out_frac_tmp[22:0] = in_frac_temp[(255 - (218 + 1)): (255 - (218 + 1) - 22) ] ; end
		{{219{1'b0}}, 1'b1 , { (255 - 219) {1'bx}}}: begin exp_tmp[7:0] = 8'd219; out_frac_tmp[22:0] = in_frac_temp[(255 - (219 + 1)): (255 - (219 + 1) - 22) ] ; end
		{{220{1'b0}}, 1'b1 , { (255 - 220) {1'bx}}}: begin exp_tmp[7:0] = 8'd220; out_frac_tmp[22:0] = in_frac_temp[(255 - (220 + 1)): (255 - (220 + 1) - 22) ] ; end//
		{{221{1'b0}}, 1'b1 , { (255 - 221) {1'bx}}}: begin exp_tmp[7:0] = 8'd221; out_frac_tmp[22:0] = in_frac_temp[(255 - (221 + 1)): (255 - (221 + 1) - 22) ] ; end
		{{222{1'b0}}, 1'b1 , { (255 - 222) {1'bx}}}: begin exp_tmp[7:0] = 8'd222; out_frac_tmp[22:0] = in_frac_temp[(255 - (222 + 1)): (255 - (222 + 1) - 22) ] ; end
		{{223{1'b0}}, 1'b1 , { (255 - 223) {1'bx}}}: begin exp_tmp[7:0] = 8'd223; out_frac_tmp[22:0] = in_frac_temp[(255 - (223 + 1)): (255 - (223 + 1) - 22) ] ; end
		{{224{1'b0}}, 1'b1 , { (255 - 224) {1'bx}}}: begin exp_tmp[7:0] = 8'd224; out_frac_tmp[22:0] = in_frac_temp[(255 - (224 + 1)): (255 - (224 + 1) - 22) ] ; end
		{{225{1'b0}}, 1'b1 , { (255 - 225) {1'bx}}}: begin exp_tmp[7:0] = 8'd225; out_frac_tmp[22:0] = in_frac_temp[(255 - (225 + 1)): (255 - (225 + 1) - 22) ] ; end
		{{226{1'b0}}, 1'b1 , { (255 - 226) {1'bx}}}: begin exp_tmp[7:0] = 8'd226; out_frac_tmp[22:0] = in_frac_temp[(255 - (226 + 1)): (255 - (226 + 1) - 22) ] ; end
		{{227{1'b0}}, 1'b1 , { (255 - 227) {1'bx}}}: begin exp_tmp[7:0] = 8'd227; out_frac_tmp[22:0] = in_frac_temp[(255 - (227 + 1)): (255 - (227 + 1) - 22) ] ; end
		{{228{1'b0}}, 1'b1 , { (255 - 228) {1'bx}}}: begin exp_tmp[7:0] = 8'd228; out_frac_tmp[22:0] = in_frac_temp[(255 - (228 + 1)): (255 - (228 + 1) - 22) ] ; end
		{{229{1'b0}}, 1'b1 , { (255 - 229) {1'bx}}}: begin exp_tmp[7:0] = 8'd229; out_frac_tmp[22:0] = in_frac_temp[(255 - (229 + 1)): (255 - (229 + 1) - 22) ] ; end
		{{230{1'b0}}, 1'b1 , { (255 - 230) {1'bx}}}: begin exp_tmp[7:0] = 8'd230; out_frac_tmp[22:0] = in_frac_temp[(255 - (230 + 1)): (255 - (230 + 1) - 22) ] ; end//
		{{231{1'b0}}, 1'b1 , { (255 - 231) {1'bx}}}: begin exp_tmp[7:0] = 8'd231; out_frac_tmp[22:0] = in_frac_temp[(255 - (231 + 1)): (255 - (231 + 1) - 22) ] ; end
		{{232{1'b0}}, 1'b1 , { (255 - 232) {1'bx}}}: begin exp_tmp[7:0] = 8'd232; out_frac_tmp[22:0] = {in_frac_temp[(255 - (232 + 1)): 0 ]  , {(  0){1'b0}} } ;    end
		{{233{1'b0}}, 1'b1 , { (255 - 233) {1'bx}}}: begin exp_tmp[7:0] = 8'd233; out_frac_tmp[22:0] = {in_frac_temp[(255 - (233 + 1)): 0 ]  , {(  1){1'b0}} } ;    end
		{{234{1'b0}}, 1'b1 , { (255 - 234) {1'bx}}}: begin exp_tmp[7:0] = 8'd234; out_frac_tmp[22:0] = {in_frac_temp[(255 - (234 + 1)): 0 ]  , {(  2){1'b0}} } ;    end
		{{235{1'b0}}, 1'b1 , { (255 - 235) {1'bx}}}: begin exp_tmp[7:0] = 8'd235; out_frac_tmp[22:0] = {in_frac_temp[(255 - (235 + 1)): 0 ]  , {(  3){1'b0}} } ;    end
		{{236{1'b0}}, 1'b1 , { (255 - 236) {1'bx}}}: begin exp_tmp[7:0] = 8'd236; out_frac_tmp[22:0] = {in_frac_temp[(255 - (236 + 1)): 0 ]  , {(  4){1'b0}} } ;    end
		{{237{1'b0}}, 1'b1 , { (255 - 237) {1'bx}}}: begin exp_tmp[7:0] = 8'd237; out_frac_tmp[22:0] = {in_frac_temp[(255 - (237 + 1)): 0 ]  , {(  5){1'b0}} } ;    end
		{{238{1'b0}}, 1'b1 , { (255 - 238) {1'bx}}}: begin exp_tmp[7:0] = 8'd238; out_frac_tmp[22:0] = {in_frac_temp[(255 - (238 + 1)): 0 ]  , {(  6){1'b0}} } ;    end
		{{239{1'b0}}, 1'b1 , { (255 - 239) {1'bx}}}: begin exp_tmp[7:0] = 8'd239; out_frac_tmp[22:0] = {in_frac_temp[(255 - (239 + 1)): 0 ]  , {(  7){1'b0}} } ;    end
		{{240{1'b0}}, 1'b1 , { (255 - 240) {1'bx}}}: begin exp_tmp[7:0] = 8'd240; out_frac_tmp[22:0] = {in_frac_temp[(255 - (240 + 1)): 0 ]  , {(  8){1'b0}} } ;    end//
		{{241{1'b0}}, 1'b1 , { (255 - 241) {1'bx}}}: begin exp_tmp[7:0] = 8'd241; out_frac_tmp[22:0] = {in_frac_temp[(255 - (241 + 1)): 0 ]  , {(  9){1'b0}} } ;    end
		{{242{1'b0}}, 1'b1 , { (255 - 242) {1'bx}}}: begin exp_tmp[7:0] = 8'd242; out_frac_tmp[22:0] = {in_frac_temp[(255 - (242 + 1)): 0 ]  , {( 10){1'b0}} } ;    end
		{{243{1'b0}}, 1'b1 , { (255 - 243) {1'bx}}}: begin exp_tmp[7:0] = 8'd243; out_frac_tmp[22:0] = {in_frac_temp[(255 - (243 + 1)): 0 ]  , {( 11){1'b0}} } ;    end
		{{244{1'b0}}, 1'b1 , { (255 - 244) {1'bx}}}: begin exp_tmp[7:0] = 8'd244; out_frac_tmp[22:0] = {in_frac_temp[(255 - (244 + 1)): 0 ]  , {( 12){1'b0}} } ;    end
		{{245{1'b0}}, 1'b1 , { (255 - 245) {1'bx}}}: begin exp_tmp[7:0] = 8'd245; out_frac_tmp[22:0] = {in_frac_temp[(255 - (245 + 1)): 0 ]  , {( 13){1'b0}} } ;    end
		{{246{1'b0}}, 1'b1 , { (255 - 246) {1'bx}}}: begin exp_tmp[7:0] = 8'd246; out_frac_tmp[22:0] = {in_frac_temp[(255 - (246 + 1)): 0 ]  , {( 14){1'b0}} } ;    end
		{{247{1'b0}}, 1'b1 , { (255 - 247) {1'bx}}}: begin exp_tmp[7:0] = 8'd247; out_frac_tmp[22:0] = {in_frac_temp[(255 - (247 + 1)): 0 ]  , {( 15){1'b0}} } ;    end
		{{248{1'b0}}, 1'b1 , { (255 - 248) {1'bx}}}: begin exp_tmp[7:0] = 8'd248; out_frac_tmp[22:0] = {in_frac_temp[(255 - (248 + 1)): 0 ]  , {( 16){1'b0}} } ;    end
		{{249{1'b0}}, 1'b1 , { (255 - 249) {1'bx}}}: begin exp_tmp[7:0] = 8'd249; out_frac_tmp[22:0] = {in_frac_temp[(255 - (249 + 1)): 0 ]  , {( 17){1'b0}} } ;    end
		{{250{1'b0}}, 1'b1 , { (255 - 250) {1'bx}}}: begin exp_tmp[7:0] = 8'd250; out_frac_tmp[22:0] = {in_frac_temp[(255 - (250 + 1)): 0 ]  , {( 18){1'b0}} } ;    end//
		{{251{1'b0}}, 1'b1 , { (255 - 251) {1'bx}}}: begin exp_tmp[7:0] = 8'd251; out_frac_tmp[22:0] = {in_frac_temp[(255 - (251 + 1)): 0 ]  , {( 19){1'b0}} } ;    end
		{{252{1'b0}}, 1'b1 , { (255 - 252) {1'bx}}}: begin exp_tmp[7:0] = 8'd252; out_frac_tmp[22:0] = {in_frac_temp[(255 - (252 + 1)): 0 ]  , {( 20){1'b0}} } ;    end
		{{253{1'b0}}, 1'b1 , { (255 - 253) {1'bx}}}: begin exp_tmp[7:0] = 8'd253; out_frac_tmp[22:0] = {in_frac_temp[(255 - (253 + 1)): 0 ]  , {( 21){1'b0}} } ;    end
		{{254{1'b0}}, 1'b1 , { (255 - 254) {1'bx}}}: begin exp_tmp[7:0] = 8'd254; out_frac_tmp[22:0] = {in_frac_temp[(255 - (254 + 1)): 0 ]  , {( 22){1'b0}} } ;    end
		{{255{1'b0}}, 1'b1 , { (255 - 255) {1'bx}}}: begin exp_tmp[7:0] = 8'd255; out_frac_tmp[22:0] =                                    {( 23){1'b0}}   ;    end
		{256{1'b0}}: begin exp_tmp[7:0] = 8'b1111_1110; out_frac_tmp[22:0] = 23'b0; end
	endcase
end
endmodule
