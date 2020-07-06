module merge(
    a,
    b,
    sel,
    out
);

input [31:0] a, b;
input [2:0] sel;
output [31:0] out;
reg [31:0] out;
wire [31:0] add, add_cla, sub, sub_cla, mul_v1, mul_v2, div, exp;

ADD ADD_(.a(a),   .b(b),  .symbol(1'b0), .out(add));
ADD_CLA_FINAL ADD_CLA(.a(a),   .b(b),  .symbol(1'b0), .out(add_cla));
ADD SUB_(.a(a),   .b(b),  .symbol(1'b1), .out(sub));
ADD_CLA_FINAL SUB_CLA(.a(a),   .b(b),  .symbol(1'b1), .out(sub_cla));

MUL MUL_1(.in1(a),.in2(b),.out(mul_v1));
MUL_v2 MUL_2(.in1(a),.in2(b),.out(mul_v2));
DIV DIV_0(.in1(a),.in2(b),.out(div));

ROOT_REAL ROOT_REAL(.base(a),.root(b), .out(exp));

always @(*)
begin
    case (sel)

    3'd0:  out = add;
    3'd1:  out = add_cla;
    3'd2:  out = sub;
    3'd3:  out = sub_cla;
    3'd4:  out = mul_v1;
    3'd5:  out = mul_v2;
    3'd5:  out = div;
    3'd6:  out = exp;

    endcase
end

endmodule



