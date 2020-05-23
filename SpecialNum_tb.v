module SpecialNum_tb();

reg     [31:0]  in;
wire    [2:0]   out;
wire            check_out;

SepcialNum  SP_tb(.in(in), .out(out), .check_out(check_out));

initial 
begin
  #0;
  in = 32'b00000000000000000000000000000000; // Zero
  #10;
  in = 32'b01111111100000000000000000000000; // +Inf
  #10;
  in = 32'b11111111100000000000000000000000; // -Inf
  #10;
  in = 32'b01110000000000000000000000111110; // Normal
  #10;
  in = 32'b00000000000000000000000000111110; // NaN
  #10;
  in = 32'b01111111110000000000000000111110; // NaN
  #10;
end

endmodule