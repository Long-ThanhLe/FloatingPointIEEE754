

module TAYLOR_EXP_tb();

reg [31:0] in;
wire [31:0] out;


TAYLOR_EXP TAYLOR_EXP_0 (.in(in),.out(out));

initial begin
	
	
	#10
	in = 32'b00111010100000110001001001101111; // 0.001
	#10
	in = 32'b00111100001000111101011100001010; // 0.01
	#10
	in = 32'b00111101110011001100110011001101; // 0.1
	
end


endmodule 