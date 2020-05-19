module smallALU(
    in_0,
    in_1,
    out, // difference e1 and e2
    sign_out // if e1 > e2 sign = 0 else = 1
);

input [7: 0] in_0;
input [7: 0] in_1;
output [7: 0] out;
output sign_out;


wire [7: 0] out_12, out_21;
wire cout_12, cout_21;

FS_8    FS_EXP_12(.a(in_0), .b(in_1), .cin(1'b0), .out(out_12), .cout(cout_12));
FS_8    FS_EXP_21(.a(in_1), .b(in_0), .cin(1'b0), .out(out_21), .cout(cout_21));

assign out = ({8{!cout_12}} & (out_12)) | ({8{cout_12}} & (out_21)); // differnence e1-e2
assign sign_out = cout_12;

endmodule