module sub(d, a, b);
input [31:0] a, b;
output [31:0] d;
wire [31:0] s;

wire cout;

complement n1 (.b(s), .a(b));
CLA32bit c1 (.s(d), .a(s), .b(a), .cin(1'b1), .cout(cout));


endmodule