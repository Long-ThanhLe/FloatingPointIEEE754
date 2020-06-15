module BigAlu_tb();

parameter DATA_WITDH = 24;

reg [DATA_WITDH - 1: 0] a;
reg [DATA_WITDH - 1: 0] b;
reg sign_a;
reg sign_b;
reg symbol;

wire [DATA_WITDH: 0] out, out_cla;
wire sign_out, sign_out_cla;

BigAlu BigALU_1(.a(a), .b(b), .sign_a(sign_a), .sign_b(sign_b), .symbol(symbol),
                    .out(out), .sign_out(sign_out));

BigAlu_CLA   BigALU_2(.a(a), .b(b), .sign_a(sign_a), .sign_b(sign_b), .symbol(symbol),
                      .out(out_cla), .sign_out(sign_out_cla));


initial
begin
  // A + B
  a = 100;
  b = 215;
  sign_a = 0;
  symbol = 0;
  sign_b = 0;
  #10;
  a = 16777210;
  b = 20;
  sign_a = 0;
  symbol = 0;
  sign_b = 0;
  #10;

  // 001 => A - B
  a = 215;
  b = 100;
  sign_a = 0; // A > B
  symbol = 0;
  sign_b = 1;
  #10;
  a = 85;
  b = 215;
  sign_a = 0;  // A < B
  symbol = 0;
  sign_b = 1;
  #10;

  // 010 => A - B
  a = 215;
  b = 100;
  sign_a = 0; // A > B
  symbol = 1;
  sign_b = 0;
  #10;
  a = 126;
  b = 215;
  sign_a = 0;  // A < B
  symbol = 1;
  sign_b = 0;
  #10;

  // 011 => A - (-B) = A + B
  a = 215;
  b = 100;
  sign_a = 0; // A > B
  symbol = 1;
  sign_b = 1;
  #10;
  a = 100;
  b = 16777210;
  sign_a = 0;  // over
  symbol = 1;
  sign_b = 1;
  #10;

  //100 => -A + B = - (A - B)
  a = 215;
  b = 100;
  sign_a = 1; // A > B
  symbol = 0;
  sign_b = 0;
  #10;
  a = 126;
  b = 215;
  sign_a = 1;  // A < B
  symbol = 0;
  sign_b = 0;
  #10;

  //101 => -A + -B = -(A+B)
  a = 215;
  b = 100;
  sign_a = 1; // A > B
  symbol = 0;
  sign_b = 1;
  #10;
  a = 100;
  b = 16777210;
  sign_a = 1;  // over
  symbol = 0;
  sign_b = 1;
  #10;

  //110 => -A - B = -(A+B)
  a = 215;
  b = 100;
  sign_a = 1; // A > B
  symbol = 0;
  sign_b = 1;
  #10;
  a = 100;
  b = 16777210;
  sign_a = 1;  // over
  symbol = 1;
  sign_b = 0;
  #10;

  //111 => -A-(-B) = - (A-B)
  a = 215;
  b = 100;
  sign_a = 1; // A > B
  symbol = 1;
  sign_b = 1;
  #10;
  a = 126;
  b = 215;
  sign_a = 1;  // A < B
  symbol = 1;
  sign_b = 1;
  #10;
end

endmodule