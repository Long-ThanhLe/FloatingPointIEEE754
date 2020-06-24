module FS_48 (
	a,
	b,
	cin,
	s,
	cout
);
parameter DATA_WIDTH = 48;

input [DATA_WIDTH - 1: 0]a;
input [DATA_WIDTH - 1: 0]b;
input cin;
output [DATA_WIDTH -1 :0]s;
output cout;

wire tmp;

FS_24 FA_0(.a(a[23:0]), .b (b[23:0]), .cin(cin),       .s(s[23:0]), .cout(tmp));
FS_24 FA_1(.a(a[47:24]), .b (b[47:24]), .cin(tmp),    .s(s[47:24]), .cout(cout));


endmodule