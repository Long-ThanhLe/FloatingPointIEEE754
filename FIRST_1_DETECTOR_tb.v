
module FIRST_1_DETECTOR_tb();

reg [31:0]in;
wire [4:0]out;

FIRST_1_DETECTOR FIRST_1_DETECTOR_0(.in(in), .out(out));
integer i;

initial begin
	for (i = 0; i < 32; i = i + 1)
	begin
		#10;
		in = 1 << i;
		#10;
		in = 1 << i + 123;
	end

end
endmodule
