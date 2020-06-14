module FS_8(
	a,
	b,
	cin,
	out,
	cout
);

parameter DATA_WIDTH = 8;

input [DATA_WIDTH - 1:0]a;
input [DATA_WIDTH - 1:0]b;
input cin;
output cout;
output [DATA_WIDTH - 1:0]out;

//wire [DATA_WIDTH - 1:0]a;
//wire [DATA_WIDTH - 1:0]b;
//wire cin;

//reg cout;
//reg [DATA_WIDTH - 1:0]out;

wire [DATA_WIDTH - 1:0]tmp;

FS FS_0(.x(a[0]), .y(b[0]), .cin(cin)   , .cout(tmp[0]), .out(out[0]));
FS FS_1(.x(a[1]), .y(b[1]), .cin(tmp[0]), .cout(tmp[1]), .out(out[1]));
FS FS_2(.x(a[2]), .y(b[2]), .cin(tmp[1]), .cout(tmp[2]), .out(out[2]));
FS FS_3(.x(a[3]), .y(b[3]), .cin(tmp[2]), .cout(tmp[3]), .out(out[3]));
FS FS_4(.x(a[4]), .y(b[4]), .cin(tmp[3]), .cout(tmp[4]), .out(out[4]));
FS FS_5(.x(a[5]), .y(b[5]), .cin(tmp[4]), .cout(tmp[5]), .out(out[5]));
FS FS_6(.x(a[6]), .y(b[6]), .cin(tmp[5]), .cout(tmp[6]), .out(out[6]));
FS FS_7(.x(a[7]), .y(b[7]), .cin(tmp[6]), .cout(cout  ), .out(out[7]));

endmodule
