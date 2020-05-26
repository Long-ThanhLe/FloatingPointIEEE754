module SUB_CLA_24_tb();

reg   [23:0]   iA, iB;
reg            iC;

wire  [23:0]   oS;
wire           oG, oP, oC;

SUB_CLA_24       SUB_CLA_24_(.iA(iA), .iB(iB), .iC(iC), .oS(oS), .oG(oG), .oP(oP), .oC(oC));

initial 
begin
  #0;
  iA = 24'd125;
  iB = 24'd11;
  iC = 1'b0;
  #10;
  iA = 24'd127;
  iB = 24'd105;
  iC = 1'b1;
  #10;
  iA = 24'd125;
  iB = 24'd483;
  iC = 1'b1;
end

endmodule