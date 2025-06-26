module decrement(
  input [31:0] a,
  output [31:0] b
);

    sub c1 (.d(b), .a(a), .b(32'd4));

endmodule