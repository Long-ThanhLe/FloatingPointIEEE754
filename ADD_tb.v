module ADD__tb();

parameter DATA_WIDTH = 32;
  
reg   [DATA_WIDTH - 1:  0]  a, b;
reg   symbol;
wire  [DATA_WIDTH - 1: 0] out, out_cla;

ADD               ADD_TB(.a(a),   .b(b),  .symbol(symbol), .out(out));

ADD_CLA_FINAL     ADD_CLA_TB(.a(a),   .b(b),  .symbol(symbol), .out(out_cla));


initial
begin
  a = 32'b01000000101000000000000000000000; // 5
  b = 32'b01000000111000000000000000000000; // 7
  symbol = 0;
  #10;
  a = 32'b01000000101000000000000000000000; // 5
  b = 32'b01000000111000000000000000000000; // 7
  symbol = 1;
  #10;
  a = 32'b11000001011110011001100110011010; //-15.6
  b = 32'b01000000011011001100110011001101; // 3.7
  symbol = 0;
  #10;
  a = 32'b11000001011110011001100110011010; //-15.6
  b = 32'b01000000011011001100110011001101; // 3.7
  symbol = 1;
  #10;
  a = 32'b11000001011110011001100110011010; // 15.6
  b = 32'b11000000011011001100110011001101; // 3.7
  symbol = 0;
  #10;
  a = 32'b11000000111100001111010111000011; // -7.53
  b = 32'b01000011010101111001010001111011; // 215.58
  symbol = 0;
  #10;
  a = 32'b11000000111100001111010111000011; // -7.53
  b = 32'b01000011010101111001010001111011; // 215.58
  symbol = 1;
  #10;
  a = 32'b00111100101101011101110011000110; //0.0222 
  b = 32'b00111111011010001111010111000011; //0.91
  symbol = 0;
  #10
  b = 32'b00111100101101011101110011000110; //0.0222 
  a = 32'b00111111011010001111010111000011; //0.91
  symbol = 1;
  #10
  a = 32'b01111111100000000000000000000000; // Inf
  b = 32'b01000000011011001100110011001101; // 3.7
  symbol = 1;
  #10
  a = 32'b01111111100000000000000000000000; // Inf
  b = 32'b01111111100000000000000000000000; // Inf
  symbol = 1;
  #10;
  a = 32'b11111111100000000000000000000000; // -Inf
  b = 32'b11111111100000000000000000000000; // -Inf
  symbol = 1;
  #10;
  a = 32'b01111111100000000000000000000000; // +Inf
  b = 32'b11111111100000000000000000000000; // -Inf
  symbol = 1;
  #10;
  a = 32'b11111111100000000000000000000000; // -Inf
  b = 32'b01111111100000000000000000000000; // +Inf
  symbol = 1;
  #10;
  a = 32'b11111111100000000000000000000000; // -Inf
  b = 32'b01111111100000000000000000000000; // +Inf
  symbol = 1;
  
   #10
  a = 32'b01111111100000000000000000000000; // Inf
  b = 32'b01111111100000000000000000000000; // Inf
  symbol = 0;
  #10;
  a = 32'b11111111100000000000000000000000; // -Inf
  b = 32'b11111111100000000000000000000000; // -Inf
  symbol = 0;
  #10;
  a = 32'b01111111100000000000000000000000; // +Inf
  b = 32'b11111111100000000000000000000000; // -Inf
  symbol = 0;
  #10;
  a = 32'b11111111100000000000000000000000; // -Inf
  b = 32'b01111111100000000000000000000000; // +Inf
  symbol = 0;
  #10;
  a = 32'b11111111100000000000000000000000; // -Inf
  b = 32'b01111111100000000000000000000000; // +Inf
  symbol = 0;
  
  #10;
  a = 32'b01111111100000000000000000000000; // Inf
  b = 32'b11111111100000000000000000000001; // NaN
  symbol = 1;
  #10;
  a = 32'b10111111011010100000011010001111; //-0.9141625863
  b = 32'b00111011000100011010001010110100; //0.00222222222
  symbol = 1;
  #10;
  a = 32'b00000000000000000000000000000000; // 0
  b = 32'b01000000011011001100110011001101; // 3.7
  symbol = 0;
  #10;
  a = 32'b01000000011011001100110011001101; // 3.7
  b = 32'b01000000011011001100110011001101; // 3.7
  symbol = 1;
  #10;
  a = 32'b00000000000000000000000000000000; // 3.7
  b = 32'b01000000011011001100110011001101; // 3.7
  symbol = 1;
  #10;
  a = 32'b01111111100000000000000000000000; // Inf
  b = 32'b01000000011011001100110011001101; // 3.7
  #10;
  a = 32'b11111111100000000000000000000001; // NaN
  b = 32'b01000000011011001100110011001101; // 3.7
  symbol = 1;
  #10;
  a = 32'b01111111100000000000000000000000; // Inf
  b = 32'b11111111100000000000000000000001; // NaN
  symbol = 1;
  #10;
  a = 32'b00111111100000100000100000010111; // 
  b = 32'b00110101001011101011100111101101; // 
  symbol = 0;
  #10;
  a = 32'b00111111011111111110011011100111; // 
  b = 32'b10101101001001001110011011110010; //
  #10;
  a = 32'b00111111011111111110100010001101; //
  b = 32'b10101101000001100111001000101101; //
  #10;
  a = 32'b00111111011111111101011011010001; // 
  b = 32'b10101110001101100010010001010001; //
end
endmodule