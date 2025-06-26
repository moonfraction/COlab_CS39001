module mux321(a, sel, b);
   input [31:0] a;
   input [4:0] sel;
   output b;

    wire [1:0] t;
   mux161 m1 (.a(a[15:0]), .sel(sel[3:0]), .b(t[0]));
   mux161 m2 (.a(a[31:16]), .sel(sel[3:0]), .b(t[1]));
   mux21 m3 (.a(t[1:0]), .sel(sel[4]), .b(b));

endmodule