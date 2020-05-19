module exponent_max_tb();

reg     [7: 0]  exp_0, exp_1;

wire    [7: 0]  exp_max;

exponent_max    EXP_max(.exp_0(exp_0), .exp_1(exp_1), .exp_max(exp_max));

initial 
begin
  exp_0 = 15;
  exp_1 = 49;
  #10;
  exp_0 = 120;
  exp_1 = 115;
  #100;
end

endmodule