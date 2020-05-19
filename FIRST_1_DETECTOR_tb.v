
module FIRST_1_DETECTOR_tb();

reg [31:0]in;
wire [4:0]out;

FIRST_1_DETECTOR FIRST_1_DETECTOR_0(.in(in), .out(out));
integer i;

initial begin
	/*
	for (i = 0; i < 32; i = i + 1)
	begin
		#10;
		in = 1 << i;
		#10;
		in = 1 << i + 123;
	end
	*/
	in = 32'b00000001001101001100110011001101;

end
endmodule
