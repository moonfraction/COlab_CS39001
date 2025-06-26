module mux21(a, sel, b);
input [1:0] a;
input sel;
output b;

wire nsel;
not n0 (nsel, sel);

wire t0, t1;
and and0 (t0, nsel, a[0]);
and and1 (t1, sel, a[1]);

or or0 (b, t0, t1);

endmodule