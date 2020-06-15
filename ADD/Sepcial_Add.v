module Special_Add(
    a,
    b,
    symbol,
    out,
    check_special
);

parameter Inf_abs = 31'b1111111100000000000000000000000;
parameter NaN_num = 32'b11111111100000000000000000000001;

parameter   Zero = 3'b000;
parameter   Normal = 3'b001;
parameter   Inf_pos = 3'b010;
parameter   Inf_neg = 3'b011;
parameter   NaN = 3'b100;

input           symbol;
input   [31: 0] a, b;
output  [31: 0] out;
output          check_special;

reg     [31: 0] out;
wire             check_special;

wire    [2: 0] out_a, out_b;
wire            check_a, check_b;

SepcialNum  SP_a(.in(a), .out(out_a), .check_out(check_a));
SepcialNum  SP_b(.in(b), .out(out_b), .check_out(check_b));

assign  check_special = check_a | check_b;

always @(out_a, out_b, symbol)
begin
    case (symbol)
    1'b0:   begin
                if  ((out_a == Zero) && (out_b == Normal))                                                 // 0 + B
                    assign out = b;                 
                else if  ((out_a == Zero) && (out_b == Zero))                                              // 0 + 0
                    assign out = a;                 
                else if ((out_a == Normal) && (out_b == Zero))                                             // A + 0
                    assign out = a;                 
                else if ((out_a == Zero) && ((out_b == Inf_pos) || (out_b == Inf_neg)))                   // 0 + (+/-)inf
                    assign out = b;                 
                else if (((out_a == Inf_pos) || (out_a == Inf_neg)) && (out_b == Zero))                    // (+/-)inf + 0;
                    assign out = a;                 
                else if ((out_a == Normal) && ((out_b == Inf_pos) || (out_b == Inf_neg)))                  // A + inf
                    assign out = {b[31], Inf_abs};
                else if (((out_a == Inf_pos) || (out_a == Inf_neg)) && (out_b == Normal))                  // inf + B
                    assign out = {a[31], Inf_abs};
                else if ((out_a == Inf_pos) && (out_b == Inf_pos))                                         // +inf + (+inf)
                    assign out = a;   
                else if ((out_a == Inf_pos) && (out_b == Inf_neg))
                    assign out = NaN_num;                                                                  // (+inf) + (-)inf
                else if ((out_a == Inf_neg) && (out_b == Inf_pos))                                         // (-inf) + (+inf)
                    assign out = NaN_num; 
                else if ((out_a == Inf_neg) && (out_b == Inf_neg))                                         // (-inf) + (-inf)
                    assign out = a; 
                else if ((out_a == NaN) || (out_b == NaN))          // 
                    assign out = NaN_num;    
            end
    1'b1:   begin
                if  ((out_a == Zero) && (out_b == Normal))                                                 // 0 - B
                    assign out = {!b[31],b[30:0]};                 
                else if  ((out_a == Zero) && (out_b == Zero))                                              // 0 - 0
                    assign out = a;                 
                else if ((out_a == Normal) && (out_b == Zero))                                             // A - 0
                    assign out = a;                 
                 else if ((out_a == Zero) && ((out_b == Inf_pos) || (out_b == Inf_neg)))                   // 0 - (+/-)inf
                    assign out = {!b[31],Inf_abs};                   
                else if (((out_a == Inf_pos) || (out_a == Inf_neg)) && (out_b == Zero))                    // (+/-)inf - 0;
                    assign out = a;                 
                else if ((out_a == Normal) && ((out_b == Inf_pos) || (out_b == Inf_neg)))                  // A - (+/-)inf
                    assign out = {!b[31], Inf_abs};
                else if (((out_a == Inf_pos) || (out_a == Inf_neg)) && (out_b == Normal))                  // inf - B
                    assign out = {a[31], Inf_abs};
                else if ((out_a == Inf_pos) && (out_b == Inf_pos))                                         // +inf - (+inf)
                    assign out = NaN_num;   
                else if ((out_a == Inf_pos) && (out_b == Inf_neg))                                         // (+inf) - (-)inf
                    assign out = a;                                                                  
                else if ((out_a == Inf_neg) && (out_b == Inf_pos))                                         // (-inf) - (+inf)
                    assign out = a;
                else if ((out_a == Inf_neg) && (out_b == Inf_neg))                                         // (-inf) - (-inf)
                    assign out = NaN_num; 
                else if ((out_a == NaN) || (out_b == NaN))          // 
                    assign out = NaN_num;
                end
    default:    ;
    endcase
end

endmodule