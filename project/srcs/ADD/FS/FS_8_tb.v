
module FS_8_tb();

reg [7:0]a;
reg [7:0]b;
wire [7:0]c;
reg cin;
wire cout;

FS_8 FS_8_0(.a(a), .b(b), .out(c), .cin(cin), .cout(cout));

initial 
begin

	a = 0;
	b = 0;
	cin = 0;
	#50;
	a = 10;
	b = 20;
	cin = 0;
	#50;
	a = 10;
	b = 20;
	cin = 1;
	#50;
	a = 20;
	b = 10;
	cin = 1;
	#50;
	a = 20;
	b = 10;
	cin = 0;
	#50;
end
endmodule
