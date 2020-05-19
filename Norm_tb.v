module Norm_tb();

reg   [7: 0]    exp_max;
reg   [24: 0]   fraction_25;

wire  [7: 0]   exp_out;
wire  [22: 0]  fraction_out;

Norm    Norm_tb_1(  .exp_max(exp_max),      .fraction_25(fraction_25),  
                    .exp_out(exp_out),      .fraction_out(fraction_out));



initial 
begin
  exp_max = 25;
  fraction_25 = 25'b1110111110010110111110010 ;
  #10;
  exp_max = 25;
  fraction_25 = 25'b0010111110010110111110010 ;
  #10;
  exp_max = 25;
  fraction_25 = 25'b0110111110010110111110010 ;
  #10;
  exp_max = 125;
  fraction_25 = 25'b0000111110010110111110010 ;
  #10;
end

endmodule