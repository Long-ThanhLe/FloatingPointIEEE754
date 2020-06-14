module ALU_small(
	a,
	b,
	out
);

parameter DATA_WIDTH = 8;

input [DATA_WIDTH - 1:0] a;
input [DATA_WIDTH - 1:0] b;
output [DATA_WIDTH:0] out;

wire tmp;

FS_8 FS_8_0(.a(a), .b(b), .out(out[DATA_WIDTH - 1:0]), .cin(1'b0), .cout(out[DATA_WIDTH]));
endmodule