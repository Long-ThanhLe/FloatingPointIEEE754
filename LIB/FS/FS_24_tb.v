
module FS_24_tb();

reg [23:0]a;
reg [23:0]b;
wire [23:0]out;
reg cin;
wire cout;

FS_24 FS_24_0(.a(a), .b(b), .cin(cin), .out(out), .cout(cout));

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
	a = 200;
	b = 105;
	cin = 1;
	#50;
	a = 50;
	b = 10;
	cin = 0;
	#50;
end
endmodule
