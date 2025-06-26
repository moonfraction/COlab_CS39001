module div(
  input [31:0] a,
  input [31:0] b,
  output [31:0] q,
  output [31:0] r
);

  wire [31:0] r;
  assign q = a / b;
  assign r = a % b;

endmodule