module smallALU_tb();

reg [7:0] in_0;
reg [7:0] in_1;

wire [7: 0] out;
wire sign_out;

smallALU smallALU_tb(.in_0(in_0), .in_1(in_1), .out(out), .sign_out(sign_out));

initial begin
  #0;
  in_0 = 35;
  in_1 = 27;
  #10;
  in_0 = 15;
  in_1 = 126;
  #10;
end

endmodule