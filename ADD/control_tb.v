module control_tb();

reg [23: 0] fraction_a, fraction_b;
reg [7: 0] diff_exp;
reg sign_exp;
reg sign_a, sign_b, symbol;

wire [24: 0] out, out_cla;
wire sign_out, sign_out_cla;

control       Control_0(.diff_exp(diff_exp),      .sign_exp(sign_exp),    .fraction_a(fraction_a),
                       .fraction_b(fraction_b),  .sign_a(sign_a),        .sign_b(sign_b),    .symbol(symbol),
                       .out(out),                .sign_out(sign_out));

control_CLA   Control_1(.diff_exp(diff_exp),      .sign_exp(sign_exp),    .fraction_a(fraction_a),
                        .fraction_b(fraction_b),  .sign_a(sign_a),        .sign_b(sign_b),    .symbol(symbol),
                        .out(out_cla),            .sign_out(sign_out_cla));


initial 
begin
  diff_exp = 5;
  sign_exp = 0;
  fraction_a = 1500;
  fraction_b = 37500;
  sign_a = 0;
  sign_b = 0;
  symbol = 0;
  #10;
  diff_exp = 5;
  sign_exp = 0;
  fraction_a = 15000;
  fraction_b = 36500;
  sign_a = 0;
  sign_b = 0;
  symbol = 0;
  #10;
  diff_exp = 5;
  sign_exp = 0;
  fraction_a = 16777211;
  fraction_b = 1500;
  sign_a = 0;
  sign_b = 0;
  symbol = 0;
  #10;
  diff_exp = 5;
  sign_exp = 1;
  fraction_a = 1500;
  fraction_b = 37500;
  sign_a = 0;
  sign_b = 0;
  symbol = 0;
  #10;
  diff_exp = 25;
  sign_exp = 1;
  fraction_a = 15000;
  fraction_b = 36500;
  sign_a = 0;
  sign_b = 0;
  symbol = 0;
  #10;
  diff_exp = 5;
  sign_exp = 1;
  fraction_a = 15000;
  fraction_b = 36500;
  sign_a = 0;
  sign_b = 0;
  symbol = 1;
  #100;
end

endmodule