module SUB_CLA_4_tb();

reg   [3:0]   iA, iB;
reg           iC;

wire  [3:0]   oS;
wire          oG, oP, oC;

SUB_CLA_4       SUB_CLA_4_(.iA(iA), .iB(iB), .iC(iC), .oS(oS), .oG(oG), .oP(oP), .oC(oC));

initial 
begin
  #0;
  iA = 4'd5;
  iB = 4'd3;
  iC = 1'b0;
  #10;
  iA = 4'd8;
  iB = 4'd15;
  iC = 1'b0;
  #10;
  iA = 4'd13;
  iB = 4'd9;
  iC = 1;
end

endmodule