
module LINE_2_BI(
	in,
	out
);

parameter IN_WIDTH = 32;
parameter OUT_WIDTH = 5;



input [IN_WIDTH - 1:0]in;
output [OUT_WIDTH - 1:0]out;

wire [IN_WIDTH - 1:0]in;
wire [OUT_WIDTH - 1:0]out;


assign out[0] = in[1] | in[3] | in[5] | in[7] | in[9] | in[11] | in[13] | in[15] | in[17] | in[19] | in[21] | in[23] | in[25] | in[27] | in[29] | in[31];
assign out[1] = in[2] | in[3] | in[6] | in[7] | in[10] | in[11] | in[14] | in[15] | in[18] | in[19] | in[22] | in[23] | in[26] | in[27] | in[30] | in[31];
assign out[2] = in[4] | in[6] | in[5] | in[7] | in[12] | in[14] | in[13] | in[15] | in[20] | in[22] | in[21] | in[23] | in[28] | in[30] | in[29] | in[31];
assign out[3] = in[8] | in[9] | in[10] | in[11] | in[12] | in[13] | in[14] | in[15] | in[24] | in[25] | in[26] | in[27] | in[28] | in[29] | in[30] | in[31];
assign out[4] = in[16] | in[17] | in[18] | in[19] | in[20] | in[21] | in[22] | in[23] | in[24] | in[25] | in[26] | in[27] | in[28] | in[29] | in[30] | in[31];

endmodule