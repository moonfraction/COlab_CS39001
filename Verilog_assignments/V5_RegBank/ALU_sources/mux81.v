module mux81(a, sel, b);
   input [7:0] a;
   input [2:0] sel;
   output b;

    wire [1:0] t;
   mux41 m1 (.a(a[3:0]), .sel(sel[1:0]), .b(t[0]));
   mux41 m2 (.a(a[7:4]), .sel(sel[1:0]), .b(t[1]));
   mux21 m3 (.a(t[1:0]), .sel(sel[2]), .b(b));

endmodule   