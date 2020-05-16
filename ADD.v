module ADD(
    a,
    b,
    symbol,
    s,
    cout
);

parameter DATA_WITDH = 32;

input [DATA_WITDH - 1: 0] a, b;
input symbol;
output [DATA_WITDH -1: 0] s;
output cout;

wire Sa, Sb;
initial
begin
    Sa = a[31];
    Sb = b[31];

    case({Sa,Sb,symbol})
        3'b000: 
end



endmodule