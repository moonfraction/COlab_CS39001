module ALU(a, b, op, r);

input [31:0] a, b;
input [3:0] op;
output [31:0] r;
wire cout = 1'b0;
reg [1:0] nought = 2'b00;
// wire [7:0] a = {nought, ai};
// wire [7:0] b = {nought, bi}; 

// wire [31:0] t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16;
wire [31:0]t [0:16];

CLA32bit g1 (.s(t[1]), .a(a), .b(b), .cin(1'b0), .cout(cout));
sub g2 (.d(t[2]), .a(a), .b(b));
mul g3 (.m(t[3]), .a(a), .b(b));
div g4 (.q(t[4]), .a(a), .b(b));
AND_32bit g5 (.x(t[5]), .a(a), .b(b));
OR_32bit g6 (.x(t[6]), .a(a), .b(b));
xor_32bit g7 (.x(t[7]), .a(a), .b(b));
complement g8 (.b(t[8]), .a(a));
AND_32bit g9 (.x(t[9]), .a(a), .b(32'b11111111111111111111111111111111));
AND_32bit g10 (.x(t[10]), .a(b), .b(32'b11111111111111111111111111111111));
leftShift g11 (.ans(t[11]), .a(a), .b(b));
rightShift g12 (.ans(t[12]), .a(a), .b(b));
ariShift g13 (.ans(t[13]), .a(a), .b(b));
increment g14 (.a(a), .b(t[14]));
decrement g15 (.a(a), .b(t[15]));
ham g16 (.a(a), .b(t[16]));


wire [15:0]v[0:31];

generate
  genvar i;
  for (i = 0; i < 32; i = i + 1) begin: mux161
    assign v[i] = {t[16][i], t[15][i], t[14][i], t[13][i], t[12][i], t[11][i], t[10][i], t[9][i], t[8][i], t[7][i], t[6][i], t[5][i], t[4][i], t[3][i], t[2][i], t[1][i]};
  end
endgenerate

generate
  genvar j;
  for (j = 0; j < 32; j = j + 1) begin: mux1612
    mux161 m (.a(v[j]), .sel(op), .b(r[j]));
  end
endgenerate

endmodule