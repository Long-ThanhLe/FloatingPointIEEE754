module ADD_CLA_4(
    iA,
    iB,
    iC,
    oS,
    oG,
    oP,
    oC
);

input   [3:0]   iA, iB;
input           iC;

output  [3:0]   oS;
output          oG, oP, oC;

wire    [3:0]   G, P, C;

assign  G = iA & iB;
assign  P = iA | iB;

CLA_4   ADD_CLA_4_(.iG(G), .iP(P), .iC(iC), .oG(oG), .oP(oP), .oC({oC, C}));

assign  oS = iA ^ iB ^ C;

endmodule