module SUB_CLA_24(
    iA,
    iB,
    iC,
    oS,
    oG,
    oP,
    oC
);

input   [23:0]   iA, iB;
input            iC;

output  [23:0]   oS;
output           oG, oP, oC;

wire    [2:0]    G, P, C;

SUB_CLA_8      sub0(.iA(iA[7:0]), .iB(iB[7:0]), .iC(C[0]), .oS(oS[7:0]), .oG(G[0]), .oP(P[0]), .oC());
SUB_CLA_8      sub1(.iA(iA[15:8]), .iB(iB[15:8]), .iC(C[1]), .oS(oS[15:8]), .oG(G[1]), .oP(P[1]), .oC());
SUB_CLA_8      sub2(.iA(iA[23:16]), .iB(iB[23:16]), .iC(C[2]), .oS(oS[23:16]), .oG(G[2]), .oP(P[2]), .oC());
CLA_3          cla(.iG(G), .iP(P), .iC(iC), .oG(oG), .oP(oP), .oC({oC, C}));


endmodule