module SW_24(
	in_0,
	in_1,
	sel,
	out
);

parameter DATA_WIDTH = 24;

input [DATA_WIDTH - 1: 0]in_0;
input [DATA_WIDTH - 1: 0]in_1; 
input sel;
output [DATA_WIDTH - 1: 0]out;

wire [DATA_WIDTH - 1: 0]in_0;
wire [DATA_WIDTH - 1: 0]in_1;

reg [DATA_WIDTH - 1: 0]out;

	always @*
		case (sel)
		0: out = in_0;
		1: out = in_1;
		endcase
endmodule
