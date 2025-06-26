module mux161(a, sel, b);
   input [15:0] a;
   input [3:0] sel;
   output b;

    wire [1:0] t;
   mux81 m1 (.a(a[7:0]), .sel(sel[2:0]), .b(t[0]));
   mux81 m2 (.a(a[15:8]), .sel(sel[2:0]), .b(t[1]));
   mux21 m3 (.a(t[1:0]), .sel(sel[3]), .b(b));

endmodule
