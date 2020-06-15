`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2020 11:25:37 PM
// Design Name: 
// Module Name: ROOT_REAL_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ROOT_REAL_tb();

reg [31:0] base;
reg [31:0] exp;

wire [31:0] out;


ROOT_REAL ROOT_REAL (.base(base),.root(exp), .out(out));

initial begin
	
	#10
	base = 32'b01000100011110100000000000000000; // 1000
	exp  = 32'b01000000101000000000000000000000; // 5
	 #10
	 base = 32'b01000000110000000000000000000000; // 6
	 exp  = 32'b01000001000100000000000000000000; // 9
	 #10
	 base = 32'b00111110110000000000000000000000; // 0.375
	 exp  = 32'b00111110110011001100110011001101; // 0.4
	 #10
	 base = 32'b00111110110011001100110011001101; // 0.4
	 exp  = 32'b00111110110011001100110011001101; // 0.4
	 #10
	 base = 32'b00111110010011001100110011001101; // 0.2
	 exp  = 32'b00111110110011001100110011001101; // 0.4
	
end

endmodule 
