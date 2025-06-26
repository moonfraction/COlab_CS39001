module mux41(a, sel, b);
input [3:0] a;
input [1:0] sel;
output b;

wire [1:0] t;;

mux21 m1 (.a(a[1:0]), .sel(sel[0]), .b(t[0]));
mux21 m2 (.a(a[3:2]), .sel(sel[0]), .b(t[1]));
mux21 m3 (.a(t[1:0]), .sel(sel[1]), .b(b));

endmodule