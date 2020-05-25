module BigAlu(
    a,
    b,
    sign_a,
    sign_b,
    symbol,
    out,
    sign_out
);

parameter DATA_WITDH = 24;

input [DATA_WITDH - 1: 0] a;
input [DATA_WITDH - 1: 0] b;
input sign_a, symbol, sign_b;

wire [DATA_WITDH - 1: 0] a;
wire [DATA_WITDH - 1: 0] b;
wire sign_a, symbol, sign_b;

output [DATA_WITDH : 0] out;
output sign_out;

reg [DATA_WITDH : 0] out;
reg sign_out;


wire [23: 0] out_plus, out_sub, out_sub_neg, out_sub_pos;
wire c_plus, c_sub, c_out_sub_neg;
wire tmp;

FA_24 FA_24_ALU(.a(a), .b(b), .cin(1'b0), .s(out_plus), .cout(c_plus));  // A + B
FS_24 FS_24_ALU(.a(a), .b(b), .cin(1'b0), .out(out_sub_pos), .cout(c_sub)); // A - B
FS_24 FS_24_NEG(.a(b), .b(a), .cin(1'b0), .out(out_sub_neg), .cout(c_out_sub_neg)); // B - A

SW_24 SW_24_ALU(.in_0(out_sub_pos), .in_1(out_sub_neg), .sel(c_sub), .out(out_sub));

xor (tmp, c_sub, 1'b1);


always @(sign_a, symbol, sign_b)
begin
  case ({sign_a, symbol, sign_b})
    3'b000  : begin  // A + B
                assign out = {c_plus, out_plus};
                assign sign_out = 1'b0;
              end
    3'b001  : begin  // A - B
                assign out = {1'b0, out_sub};
                assign sign_out = c_sub;
              end
    
    3'b010  : begin  // A - B
                assign out = {1'b0, out_sub};
                assign sign_out = c_sub;
              end
    3'b011  : begin // A - (-B) = A + B
                assign  out = {c_plus, out_plus};
                assign  sign_out = 1'b0;
              end
    
    3'b100  : begin // -A + B = -(A - B)
                assign  out = {1'b0, out_sub};
                assign  sign_out = tmp;
              end
    
    3'b101  : begin // - A - B = - (A + B)
                assign  out = {c_plus, out_plus};
                assign  sign_out = 1'b1;
              end
    3'b110  : begin // -A - B  = -(A + B)
                assign  out = {c_plus, out_plus};
                assign  sign_out = 1'b1;
              end
    
    3'b111  : begin // - A - (- B) = - (A - B)
                assign out = {1'b0, out_sub};
                assign  sign_out = tmp;
              end
              
    default : ;


  endcase
end

endmodule

module BigAlu_CLA(
    a,
    b,
    sign_a,
    sign_b,
    symbol,
    out,
    sign_out
);

parameter DATA_WITDH = 24;

input [DATA_WITDH - 1: 0] a;
input [DATA_WITDH - 1: 0] b;
input sign_a, symbol, sign_b;

wire [DATA_WITDH - 1: 0] a;
wire [DATA_WITDH - 1: 0] b;
wire sign_a, symbol, sign_b;

output [DATA_WITDH : 0] out;
output sign_out;

reg [DATA_WITDH : 0] out;
reg sign_out;


wire [23: 0] out_plus, out_sub, out_sub_neg, out_sub_pos;
wire c_plus, c_sub, c_out_sub_neg;
wire tmp;

ADD_CLA_24 ADD_CLA_24_ALU(.a(a), .b(b), .cin(1'b0), .s(out_plus), .cout(c_plus));  // A + B
SUB_CLA_24 SUB_CLA_24_ALU(.a(a), .b(b), .cin(1'b0), .out(out_sub_pos), .cout(c_sub)); // A - B
SUB_CLA_24 SUB_CLA_24_NEG(.a(b), .b(a), .cin(1'b0), .out(out_sub_neg), .cout(c_out_sub_neg)); // B - A

SW_24 SW_24_ALU(.in_0(out_sub_pos), .in_1(out_sub_neg), .sel(c_sub), .out(out_sub));

xor (tmp, c_sub, 1'b1);


always @(sign_a, symbol, sign_b)
begin
  case ({sign_a, symbol, sign_b})
    3'b000  : begin  // A + B
                assign out = {c_plus, out_plus};
                assign sign_out = 1'b0;
              end
    3'b001  : begin  // A - B
                assign out = {1'b0, out_sub};
                assign sign_out = c_sub;
              end
    
    3'b010  : begin  // A - B
                assign out = {1'b0, out_sub};
                assign sign_out = c_sub;
              end
    3'b011  : begin // A - (-B) = A + B
                assign  out = {c_plus, out_plus};
                assign  sign_out = 1'b0;
              end
    
    3'b100  : begin // -A + B = -(A - B)
                assign  out = {1'b0, out_sub};
                assign  sign_out = tmp;
              end
    
    3'b101  : begin // - A - B = - (A + B)
                assign  out = {c_plus, out_plus};
                assign  sign_out = 1'b1;
              end
    3'b110  : begin // -A - B  = -(A + B)
                assign  out = {c_plus, out_plus};
                assign  sign_out = 1'b1;
              end
    
    3'b111  : begin // - A - (- B) = - (A - B)
                assign out = {1'b0, out_sub};
                assign  sign_out = tmp;
              end
              
    default : ;


  endcase
end

endmodule