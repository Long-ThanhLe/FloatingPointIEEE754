module SepcialNum(
    in,
    out,
    check_out
);

parameter   Zero = 3'b000;
parameter   Normal = 3'b001;
parameter   Inf_pos = 3'b010;
parameter   Inf_neg = 3'b011;
parameter   NaN = 3'b100;


input   [31: 0] in;

output  [2: 0]  out;
output          check_out;

reg     [2: 0]  out;
reg             check_out;

always @(in)
begin
    if ((in[30:23] == 8'd0) && (in[22:0] == 23'd0))
        begin   assign  out = Zero;
                assign  check_out = 1'b1;
        end
    else if ((in[30:23] == 8'd255) && (in[22:0] == 23'd0) && (in[31] == 1'b0))
        begin
            assign out = Inf_pos;
            assign  check_out = 1'b1;
        end
    else if ((in[30:23] == 8'd255) && (in[22:0] == 23'd0) && (in[31] == 1'b1))
        begin
            assign out = Inf_neg;
            assign check_out = 1'b1;
        end
    else if ((in[30:23] == 8'd255)  && (in[22:0] > 23'd0))
        begin
            assign out = NaN;
            assign check_out = 1'b1;
        end
    else
        begin
            assign out = Normal;
            assign check_out = 1'b0;
        end
end

endmodule