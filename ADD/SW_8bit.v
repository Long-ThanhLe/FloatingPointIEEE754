module SW_8bit (
	in_0,
	in_1,
	se,
	out
);

parameter DATA_WIDTH = 8;

input [DATA_WIDTH - 1: 0]in_0;
input [DATA_WIDTH - 1: 0]in_1; 
input se;
output [DATA_WIDTH - 1: 0]out;

wire [DATA_WIDTH - 1: 0]in_0;
wire [DATA_WIDTH - 1: 0]in_1;
wire se;
reg [DATA_WIDTH - 1: 0]out;

initial 
begin
	assign out = (se & in_1) | ((~se) & in_0 );
end
endmodule
