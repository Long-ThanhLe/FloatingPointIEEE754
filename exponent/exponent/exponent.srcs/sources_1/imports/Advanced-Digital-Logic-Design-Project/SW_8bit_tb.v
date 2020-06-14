module SW_8bit_tb();


parameter DATA_WIDTH = 8;

reg [DATA_WIDTH - 1: 0]in_0;
reg [DATA_WIDTH - 1: 0]in_1; 
reg se;
wire [DATA_WIDTH - 1: 0]out;

SW_8bit SW_8bit_1(.in_0(in_0), .in_1(in_1), .se(se), .out(out));

initial 
begin
  in_0 = 8'b11111111;
  in_1 = 8'b00001111;
  se = 1'b0;
  #10
  in_0 = 8'b00110011;
  in_1 = 8'b11111010;
  se = 1'b1;
  #10;
end

endmodule