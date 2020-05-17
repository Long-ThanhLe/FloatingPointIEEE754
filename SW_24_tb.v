module SW_24_tb();


parameter DATA_WIDTH = 24;

reg [DATA_WIDTH - 1: 0]in_0;
reg [DATA_WIDTH - 1: 0]in_1; 
reg sel;
wire [DATA_WIDTH - 1: 0]out;

SW_24 SW_24_1(.in_0(in_0), .in_1(in_1), .sel(sel), .out(out));

initial 
begin
  in_0 = 35;
  in_1 = 27;
  sel = 0;
  #10
  in_0 = 24'b000000000000000000000000;
  in_1 = 24'b111111111111111111111111;
  sel = 1;
  #10;
  in_0 = 24'b000000000000111100010000;
  in_1 = 24'b111111111111111111111111;
  sel = 1;
  #10;
end

endmodule