`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2020 09:09:44 PM
// Design Name: 
// Module Name: pp6
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


module pp6(
    part_0,
part_1,
part_2,
out_0,
out_1
);

input [36:0] part_0, part_1, part_2;
output[37:0] out_0, out_1;

assign out_1[0] = 1'b0;

FA FA00(.x(part_0[00]), .y(part_1[00]), .cin(part_2[00]), .s(out_0[00]), .cout(out_1[01]));
FA FA01(.x(part_0[01]), .y(part_1[01]), .cin(part_2[01]), .s(out_0[01]), .cout(out_1[02]));
FA FA02(.x(part_0[02]), .y(part_1[02]), .cin(part_2[02]), .s(out_0[02]), .cout(out_1[03]));
FA FA03(.x(part_0[03]), .y(part_1[03]), .cin(part_2[03]), .s(out_0[03]), .cout(out_1[04]));
FA FA04(.x(part_0[04]), .y(part_1[04]), .cin(part_2[04]), .s(out_0[04]), .cout(out_1[05]));
FA FA05(.x(part_0[05]), .y(part_1[05]), .cin(part_2[05]), .s(out_0[05]), .cout(out_1[06]));
FA FA06(.x(part_0[06]), .y(part_1[06]), .cin(part_2[06]), .s(out_0[06]), .cout(out_1[07]));
FA FA07(.x(part_0[07]), .y(part_1[07]), .cin(part_2[07]), .s(out_0[07]), .cout(out_1[08]));
FA FA08(.x(part_0[08]), .y(part_1[08]), .cin(part_2[08]), .s(out_0[08]), .cout(out_1[09]));
FA FA09(.x(part_0[09]), .y(part_1[09]), .cin(part_2[09]), .s(out_0[09]), .cout(out_1[10]));
FA FA10(.x(part_0[10]), .y(part_1[10]), .cin(part_2[10]), .s(out_0[10]), .cout(out_1[11]));
FA FA11(.x(part_0[11]), .y(part_1[11]), .cin(part_2[11]), .s(out_0[11]), .cout(out_1[12]));
FA FA12(.x(part_0[12]), .y(part_1[12]), .cin(part_2[12]), .s(out_0[12]), .cout(out_1[13]));
FA FA13(.x(part_0[13]), .y(part_1[13]), .cin(part_2[13]), .s(out_0[13]), .cout(out_1[14]));
FA FA14(.x(part_0[14]), .y(part_1[14]), .cin(part_2[14]), .s(out_0[14]), .cout(out_1[15]));
FA FA15(.x(part_0[15]), .y(part_1[15]), .cin(part_2[15]), .s(out_0[15]), .cout(out_1[16]));
FA FA16(.x(part_0[16]), .y(part_1[16]), .cin(part_2[16]), .s(out_0[16]), .cout(out_1[17]));
FA FA17(.x(part_0[17]), .y(part_1[17]), .cin(part_2[17]), .s(out_0[17]), .cout(out_1[18]));
FA FA18(.x(part_0[18]), .y(part_1[18]), .cin(part_2[18]), .s(out_0[18]), .cout(out_1[19]));
FA FA19(.x(part_0[19]), .y(part_1[19]), .cin(part_2[19]), .s(out_0[19]), .cout(out_1[20]));
FA FA20(.x(part_0[20]), .y(part_1[20]), .cin(part_2[20]), .s(out_0[20]), .cout(out_1[21]));
FA FA21(.x(part_0[21]), .y(part_1[21]), .cin(part_2[21]), .s(out_0[21]), .cout(out_1[22]));
FA FA22(.x(part_0[22]), .y(part_1[22]), .cin(part_2[22]), .s(out_0[22]), .cout(out_1[23]));
FA FA23(.x(part_0[23]), .y(part_1[23]), .cin(part_2[23]), .s(out_0[23]), .cout(out_1[24]));
FA FA24(.x(part_0[24]), .y(part_1[24]), .cin(part_2[24]), .s(out_0[24]), .cout(out_1[25]));
FA FA25(.x(part_0[25]), .y(part_1[25]), .cin(part_2[25]), .s(out_0[25]), .cout(out_1[26]));
FA FA26(.x(part_0[26]), .y(part_1[26]), .cin(part_2[26]), .s(out_0[26]), .cout(out_1[27]));
FA FA27(.x(part_0[27]), .y(part_1[27]), .cin(part_2[27]), .s(out_0[27]), .cout(out_1[28]));
FA FA28(.x(part_0[28]), .y(part_1[28]), .cin(part_2[28]), .s(out_0[28]), .cout(out_1[29]));
FA FA29(.x(part_0[29]), .y(part_1[29]), .cin(part_2[29]), .s(out_0[29]), .cout(out_1[30]));
FA FA30(.x(part_0[30]), .y(part_1[30]), .cin(part_2[30]), .s(out_0[30]), .cout(out_1[31]));
FA FA31(.x(part_0[31]), .y(part_1[31]), .cin(part_2[31]), .s(out_0[31]), .cout(out_1[32]));
FA FA32(.x(part_0[32]), .y(part_1[32]), .cin(part_2[32]), .s(out_0[32]), .cout(out_1[33]));
FA FA33(.x(part_0[33]), .y(part_1[33]), .cin(part_2[33]), .s(out_0[33]), .cout(out_1[34]));
FA FA34(.x(part_0[34]), .y(part_1[34]), .cin(part_2[34]), .s(out_0[34]), .cout(out_1[35]));
FA FA35(.x(part_0[35]), .y(part_1[35]), .cin(part_2[35]), .s(out_0[35]), .cout(out_1[36]));
FA FA36(.x(part_0[36]), .y(part_1[36]), .cin(part_2[36]), .s(out_0[36]), .cout(out_1[37]));

assign out_0[37] = 1'b0;
endmodule
