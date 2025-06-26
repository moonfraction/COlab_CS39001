module full_adder_1bit(s, cout, a, b, cin);

input a, b, cin;
output s, cout;

wire t1, t2, t3;
xor x1 (s, a, b, cin);
and a1 (t1, a, b);
and a2 (t2, b, cin);
and a3 (t3, a, cin);

or o1 (cout, t1, t2, t3);

endmodule

module full_adder_2bit(s, cout, a, b, cin);

input [1:0] a, b;
input cin;
output [1:0] s;
output cout;

wire c1;
full_adder_1bit fa1 (s[0], c1, a[0], b[0], cin);
full_adder_1bit fa2 (s[1], cout, a[1], b[1], c1);

endmodule


module full_adder_3bit(s, cout, a, b, cin);

input [2:0] a, b;
input cin;
output [2:0] s;
output cout;

wire c1, c2;
full_adder_2bit fa1 (s[1:0], c1, a[1:0], b[1:0], cin);
full_adder_1bit fa2 (s[2], cout, a[2], b[2], c1);

endmodule

module full_adder_4bit(s, cout, a, b, cin);

input [3:0] a, b;
input cin;
output [3:0] s;
output cout;

wire c1;
full_adder_2bit fa1 (s[1:0], c1, a[1:0], b[1:0], cin);
full_adder_2bit fa2 (s[3:2], cout, a[3:2], b[3:2], c1);

endmodule

module full_adder_5bit(s, cout, a, b, cin);

input [4:0] a, b;
input cin;
output [4:0] s;
output cout;

wire c1;
full_adder_2bit fa1 (s[1:0], c1, a[1:0], b[1:0], cin);
full_adder_3bit fa2 (s[4:2], cout, a[4:2], b[4:2], c1);

endmodule


