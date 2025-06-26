module ham_small(a, b);

input [7:0] a;
output [7:0] b;

wire t1, t2, t3;
wire s1, s2;
wire [1:0] s3;
wire cout;

full_adder_1bit fa1 (.s(s1), .cout(t1), .a(a[5]), .b(a[6]), .cin(a[7]));
full_adder_1bit fa2 (.s(s2), .cout(t2), .a(a[3]), .b(a[4]), .cin(a[2]));

full_adder_2bit fa3 (.s(s3), .cout(t3), .a({t2, s2}), .b({t1, s1}), .cin(a[1]));

full_adder_3bit fa4 (.s(b[2:0]), .cout(b[3]), .a({t3, s3}), .b(3'b000), .cin(a[0]));
assign b[7:4] = 4'b0000;

endmodule

module ham(a, b);

input [31:0] a; 
output [31:0] b;

wire [8:0] t1, t2, t3, t4, t5, t6;

ham_small h1 (.a(a[7:0]), .b(t1));
ham_small h2 (.a(a[15:8]), .b(t2));
ham_small h3 (.a(a[23:16]), .b(t3));
ham_small h4 (.a(a[31:24]), .b(t4));

CLA8bit c1 (.s(t5), .a(t1), .b(t2), .cin(1'b0));
CLA8bit c2 (.s(t6), .a(t3), .b(t4), .cin(1'b0));
CLA8bit c3 (.s(b), .a(t5), .b(t6), .cin(1'b0));

assign b[31:8] = 24'b000000000000000000000000;

endmodule

