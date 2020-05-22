
module DIV_tb();


reg [31:0]in1,in2;
wire [31:0] out;

DIV DIV_0 (.in1(in1),.in2(in2),.out(out));

initial begin
	#10
	#10;
	in1 = 32'b00000000010000000000000000000000;

	in2 = 32'b00000000010000000000000000000000;
	#10;
	in1 = 32'b00000000010000000000000000000000;

	in2 = 32'b00000000001000000000000000000000;
	#10;
	in1 = 32'b00111111110000000000000000000000; // 1.5

	in2 = 32'b01000000001100000000000000000000; //2.75
	#10;
	in1 = 32'b11000000011000000000000000000000; // -3.5

	in2 = 32'b10111111101000000000000000000000; // -1.25
	#10;
	in1 = 32'b11000100111111000111010011001101; // -2019.65

	in2 = 32'b01000001001010001010001111010111; // 10.54
	#10;
end
endmodule 