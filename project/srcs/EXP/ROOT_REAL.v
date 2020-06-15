`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2020 11:11:42 PM
// Design Name: 
// Module Name: ROOT_REAL
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


module ROOT_REAL(
    base,
    root,
    out
    );
input [31:0] base;
input [31:0] root;
output [31:0] out;

wire [31:0] base_root;
wire [31:0] one_on_root;
// Calculate 1/ root
DIV ONE_ON_ROOT(.in1(32'b00111111100000000000000000000000), .in2(root), .out(one_on_root));
// Calculate base ^ (1/root)
EXP_REAL ROOT_REAL(.base(base), .exp(one_on_root), .out(out));

endmodule
