
module MUX_32_1_tb();

reg [4:0] select;
reg [31:0] in;
wire out;

MUX_32_1 MUX(.select(select), .in(in), .out(out));
integer i;
initial begin
	in = 1235;

	for (i = 0; i < 32; i = i +1)
begin
	#10;
	
	select = i;
end
end

endmodule
