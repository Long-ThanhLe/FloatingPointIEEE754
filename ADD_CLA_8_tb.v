module ADD_CLA_8_tb();

reg   [7:0]   iA, iB;
reg           iC;

wire  [7:0]   oS;
wire          oG, oP, oC;

ADD_CLA_8       ADD_CLA_8_(.iA(iA), .iB(iB), .iC(iC), .oS(oS), .oG(oG), .oP(oP), .oC(oC));

initial 
begin
  #0;
  iA = 8'd125;
  iB = 8'd11;
  iC = 1'b0;
  #10;
  iA = 8'd127;
  iB = 8'd105;
  iC = 1'b1;
  #10;
  iA = 8'b11111111;
  iB = 8'b11111111;
  iC = 1'b1;
end

endmodule