module ADD_CLA_FINAL(
    a,
    b,
    symbol,
    out
);

parameter DATA_WIDTH = 32;

input   [DATA_WIDTH - 1:  0]  a, b;
input   symbol;
output  [DATA_WIDTH - 1: 0] out;

endmodule