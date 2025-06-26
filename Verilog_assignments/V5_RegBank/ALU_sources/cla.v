`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:19 08/14/2024 
// Design Name: 
// Module Name:    CLA 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CLA(s ,blockp, blockg, a , b , cin);
  input [3:0]a;
  input [3:0]b; 
  input cin;
  wire cout; 
  output[3:0]s;
  output blockp;
  output blockg;
  wire [3:1]c;
  wire [3:0]p; 
  wire [3:0]g;
  
  xor p0(p[0] , a[0] , b[0]);
  xor p1(p[1] , a[1] , b[1]);
  xor p2(p[2] , a[2] , b[2]);
  xor p3(p[3] , a[3] , b[3]);
  
  and g0(g[0] , a[0] , b[0]);
  and g1(g[1] , a[1] , b[1]);
  and g2(g[2] , a[2] , b[2]);
  and g3(g[3] , a[3] , b[3]);
  
  wire tmp1;
  and c11(tmp1 , p[0] , cin);
  or c12(c[1] , g[0] , tmp1);

  wire tmp2, tmp3;

  and c21(tmp2 , p[1] , g[0]);
  and c22(tmp3 , p[1] , p[0] , cin);
  or c23(c[2] , tmp2 , tmp3 , g[1]);
  
  wire tmp4, tmp5, tmp6;
  
  and c31(tmp4 , p[2] , g[1]);
  and c32(tmp5 , p[2] , p[1] , g[0]);
  and c33(tmp6 , p[2] , p[1] , p[0] , cin);
  or c34(c[3] , tmp4 , tmp5 , tmp6 , g[2]);
  
  wire tmp7, tmp8, tmp9, tmp10;
  
  and c41(tmp7 , p[3] , g[2]);
  and c42(tmp8 , p[3] , p[2] , g[1]);
  and c43(tmp9 , p[3] , p[2] , p[1] , g[0]);
  and c44(tmp10 , p[3] , p[2] , p[1] , p[0] , cin);
  or c45(cout , tmp7 , tmp8 , tmp9 , tmp10 , g[3]);
  
  xor s0(s[0] , p[0] , cin);
  xor s1(s[1] , p[1] , c[1]);
  xor s2(s[2] , p[2] , c[2]);
  xor s3(s[3] , p[3] , c[3]);

  wire tmp11, tmp12;

  and c51(tmp11, p[3], p[2]);
  and c52(tmp12, p[1], tmp11);
  and c53(blockp, p[0], tmp12);

  wire tmp13, tmp14, tmp15, tmp16, tmp17;

  and c61(tmp13, g[0], tmp12);
  and c62(tmp14, g[1], tmp11);
  and c63(tmp15, g[2], p[3]);
  or c64(tmp16, g[3], tmp15);
  or c65(tmp17, tmp14, tmp16);
  or c66(blockg, tmp13, tmp17);

  wire tmp18;

  and c71(tmp18, cin, blockp);
  or c72(cout, blockg, tmp18);
  
endmodule


module CLA16(s, a, b, cin);

  input [15:0]a;
  input [15:0]b; 
  input cin;
  wire cout; 
  output[15:0]s;

  wire c1, c2, c3;
  wire p0, p1, p2, p3;
  wire g0, g1, g2, g3;

  CLA ad1 (.s(s[3:0]), .blockp(p0), .blockg(g0), .a(a[3:0]), .b(b[3:0]), .cin(cin));
  CLA ad2 (.s(s[7:4]),  .blockp(p1), .blockg(g1), .a(a[7:4]), .b(b[7:4]), .cin(c1));
  CLA ad3 (.s(s[11:8]),  .blockp(p2), .blockg(g2), .a(a[11:8]), .b(b[11:8]), .cin(c2));
  CLA ad4 (.s(s[15:12]), .blockp(p3), .blockg(g3), .a(a[15:12]), .b(b[15:12]), .cin(c3));

  wire tmp1, tmp2, tmp3, tmp4;

  and c11 (tmp1, p0, cin);
  or c12 (c1, g0, tmp1);

  and c21 (tmp2, p1, c1);
  or c22 (c2, g1, tmp2);

  and c31 (tmp3, p2, c2);
  or c32 (c3, g2, tmp3);

  and c41 (tmp4, p3, c3);
  or c42 (cout, g3, tmp4);


endmodule


module CLA8bit(s, a, b, cin);

  input [7:0]a;
  input [7:0]b; 
  input cin;
  wire cout; 
  output[7:0]s;

  wire c1, c2;
  wire p0, p1;
  wire g0, g1;

  CLA ad1 (.s(s[3:0]), .blockp(p0), .blockg(g0), .a(a[3:0]), .b(b[3:0]), .cin(cin));
  CLA ad2 (.s(s[7:4]),  .blockp(p1), .blockg(g1), .a(a[7:4]), .b(b[7:4]), .cin(c1));

  wire tmp1, tmp2;

  and c11 (tmp1, p0, cin);
  or c12 (c1, g0, tmp1);

  and c21 (tmp2, p1, c1);
  or c22 (cout, g1, tmp2);

endmodule

module CLA32bit(s, a, b, cin, cout);

  input [31:0]a;
  input [31:0]b; 
  input cin;
  output cout; 
  output[31:0]s;

  wire c1, c2, c3, c4, c5, c6, c7;
  wire p0, p1, p2, p3, p4, p5, p6, p7;
  wire g0, g1, g2, g3, g4, g5, g6, g7;

  CLA ad1 (.s(s[3:0]), .blockp(p0), .blockg(g0), .a(a[3:0]), .b(b[3:0]), .cin(cin));
  CLA ad2 (.s(s[7:4]),  .blockp(p1), .blockg(g1), .a(a[7:4]), .b(b[7:4]), .cin(c1));
  CLA ad3 (.s(s[11:8]),  .blockp(p2), .blockg(g2), .a(a[11:8]), .b(b[11:8]), .cin(c2));
  CLA ad4 (.s(s[15:12]), .blockp(p3), .blockg(g3), .a(a[15:12]), .b(b[15:12]), .cin(c3));
  CLA ad5 (.s(s[19:16]), .blockp(p4), .blockg(g4), .a(a[19:16]), .b(b[19:16]), .cin(c4));
  CLA ad6 (.s(s[23:20]), .blockp(p5), .blockg(g5), .a(a[23:20]), .b(b[23:20]), .cin(c5));
  CLA ad7 (.s(s[27:24]), .blockp(p6), .blockg(g6), .a(a[27:24]), .b(b[27:24]), .cin(c6));
  CLA ad8 (.s(s[31:28]), .blockp(p7), .blockg(g7), .a(a[31:28]), .b(b[31:28]), .cin(c7));

  wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8;

  and c11 (tmp1, p0, cin);
  or c12 (c1, g0, tmp1);

  and c21 (tmp2, p1, c1);
  or c22 (c2, g1, tmp2);

  and c31 (tmp3, p2, c2);
  or c32 (c3, g2, tmp3);

  and c41 (tmp4, p3, c3);
  or c42 (c4, g3, tmp4);

  and c51 (tmp5, p4, c4);
  or c52 (c5, g4, tmp5);

  and c61 (tmp6, p5, c5);
  or c62 (c6, g5, tmp6);

  and c71 (tmp7, p6, c6);
  or c72 (c7, g6, tmp7);

  and c81 (tmp8, p7, c7);
  or c82 (cout, g7, tmp8);

endmodule