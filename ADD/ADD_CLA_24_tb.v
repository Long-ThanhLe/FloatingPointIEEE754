module ADD_CLA_24_tb();

reg   [23:0]   iA, iB;
reg            iC;

wire  [23:0]   oS;
wire           oG, oP, oC;

ADD_CLA_24       ADD_CLA_24_(.iA(iA), .iB(iB), .iC(iC), .oS(oS), .oG(oG), .oP(oP), .oC(oC));

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
  iA = 24'b11111111;
  iB = 24'b11111111;
  iC = 1'b1;
  #10;
  iA = 24'd100;
  iB = 24'd215;
  iC = 1'b0;
  #10;
end

endmodule