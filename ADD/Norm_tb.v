module Norm_tb();

reg   [7: 0]    exp_max;
reg   [24: 0]   fraction_25;

wire  [7: 0]   exp_out, exp_out_cla;
wire  [22: 0]  fraction_out, fraction_out_cla;

Norm        Norm_tb_1(  .exp_max(exp_max),      .fraction_25(fraction_25),  
                    .exp_out(exp_out),      .fraction_out(fraction_out));

Norm_CLA    Norm_tb_2(  .exp_max(exp_max),      .fraction_25(fraction_25),  
                    .exp_out(exp_out_cla),      .fraction_out(fraction_out_cla));



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
  exp_max = 125;
  fraction_25 = 25'b1001101001100110011001101 ;
  #10;
  
end

endmodule