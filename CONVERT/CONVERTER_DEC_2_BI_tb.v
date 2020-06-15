
module CONVERTER_DEC_2_BI_tb();

reg sign;
reg [127:0]in_floor;
reg [127:0]in_frac;
wire [31:0]out;

CONVERTER_DEC_2_BI CONVERT(.sign(sign), .in_floor(in_floor), .in_frac(in_frac), .out(out));
initial 
begin
	sign = 1;
	in_floor = 128'd4;
	in_frac  = 128'd6463148610_3216516984_1236974122_12687300;
	#10;
	sign = 0;
	in_floor = 128'd12;
	in_frac  = 128'd0163646440_3216516984_1236974122_12687300;
	#10;
	sign = 0;
	in_floor = 128'd128;
	in_frac  = 128'd9789126515_3216516984_1236974122_12687300;
	#10;
	sign = 1;
	in_floor = 128'd0;
	in_frac  = 128'd0000005160_3216516984_1236974122_12687300;
	#10;
	sign = 0;
	in_floor = 128'd0;
	in_frac  = 128'd0000000000_0216516984_1236974122_12687300;
	#10;
	sign = 1;
	in_floor = 128'd6;
	in_frac  = 128'd9566700000_3216516984_1236974122_12687300;
	#10;
	sign = 1;
	in_floor = 128'd0;
	in_frac  = 128'd0;
end

endmodule 
