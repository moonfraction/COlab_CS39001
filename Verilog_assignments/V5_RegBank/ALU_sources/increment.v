module increment(
  input [31:0] a,
  output [31:0] b
);
    wire x;
    CLA32bit c1 (.s(b), .a(a), .b(32'd4), .cin(1'b0), .cout(x));

endmodule