module SepcialNum(
    in,
    out
);

parameter   Zero = 3'b000;
parameter   NaN = 3'b110;
parameter   Inf = 3'b100;
parameter   Normal = 3'b011;

input   [31: 0] in;
output  [2: 0]  out;
reg     [2: 0]  out;

always @(in)
begin
    if ((in[30:23] == 8'd0) && (in[22:0] == 23'd0))
        assign  out = Zero;
    else if ((in[30:23] == 8'd0) && (in[22:0] > 23'd0))
        assign  out = NaN;
    else if ((in[30:23] == 8'd255) && (in[22:0] == 23'd0))
        assign out = Inf;
    else if ((in[30:23] == 8'd255))
        assign out = NaN;
    else
        assign out = Normal;
end

endmodule