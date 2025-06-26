module complement(a, b);


  input [31:0] a;
  output [31:0] b;

  generate
      genvar i;
      for (i = 0; i < 32; i = i + 1) begin: noter
          not n0(b[i], a[i]);
      end
  endgenerate
  

endmodule