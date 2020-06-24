module FAS_24(
	a,
	b,
    option,
	cin,
	out,
	cout
);
parameter DATA_WIDTH = 24;

input [DATA_WIDTH - 1: 0]a;
input [DATA_WIDTH - 1: 0]b;
input option;
input cin;
output [DATA_WIDTH -1 :0]out;
output cout;

wire cout_sum, cout_sub
wire [DATA_WIDTH - 1: 0]out_sum, out_sub;

FA_24 FA_24_0(.a(a), .b(b), .cin(cin), .s(out_sum), .cout(cout_sum));
FS_24 FS_24_0(.a(a), .b(b), .cin(cin), .out(out_sub), .cout(cout_sub));

assign  out = ({24{!option}} & out_sum) |  {24{option}} & out_sub);
assign  cout = (!option & out_sum) |  (option & out_sub);

