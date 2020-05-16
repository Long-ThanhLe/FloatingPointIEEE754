module FS_24(
	a,
	b,
	cin,
	out,
	cout
);
parameter DATA_WIDTH = 24;

input [DATA_WIDTH - 1: 0]a;
input [DATA_WIDTH - 1: 0]b;
input cin;
output [DATA_WIDTH -1 :0]out;
output cout;

wire [1:0] tmp;



FS_8 FS_24_0(.a(a[7:0]), .b (b[7:0]), .cin(cin),       .out(out[7:0]), .cout(tmp[0]));
FS_8 FS_24_1(.a(a[15:8]), .b (b[15:8]), .cin(tmp[0]),    .out(out[15:8]), .cout(tmp[1]));
FS_8 FS_24_2(.a(a[23:16]), .b (b[23:16]), .cin(tmp[1]),    .out(out[23:16]), .cout(cout));

endmodule