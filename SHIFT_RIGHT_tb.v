
module SHIFT_RIGHT_tb();

reg [31:0] in;
wire [31:0] out;
reg [4:0] select;

SHIFT_RIGHT abc(.in(in), .out(out), .shift_num(select));

integer i;

initial begin

	in = 13564;

	for (i = 0; i < 32; i = i + 1)
	begin
		#10;
		select = i;

	end

end


endmodule
