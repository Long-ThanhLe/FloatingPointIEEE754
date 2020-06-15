module SUB_CLA_8(
    iA,
    iB,
    iC,
    oS,
    oG,
    oP,
    oC
);

input   [7:0]   iA, iB;
input           iC;

output  [7:0]   oS;
output          oG, oP, oC;

wire    [1:0]   G, P, C;

SUB_CLA_4      sub0(.iA(iA[3:0]), .iB(iB[3:0]), .iC(C[0]), .oS(oS[3:0]), .oG(G[0]), .oP(P[0]), .oC());
SUB_CLA_4      sub1(.iA(iA[7:4]), .iB(iB[7:4]), .iC(C[1]), .oS(oS[7:4]), .oG(G[1]), .oP(P[1]), .oC());
CLA_2          cla(.iG(G), .iP(P), .iC(iC), .oG(oG), .oP(oP), .oC({oC, C}));


endmodule