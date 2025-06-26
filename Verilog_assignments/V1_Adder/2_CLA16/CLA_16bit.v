`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:39 08/14/2024 
// Design Name: 
// Module Name:    CLA_16bit 
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
module CLA_16bit(sum, cout, a, b, cin);
	input [15:0] a, b;
	input cin;
	output [15:0] sum;
	output cout;
	wire [3:0]trash, p0, g0,p1, g1, p2, g2, p3, g3, p, g, c;
	CLA_4bit C1(sum[3:0], trash[0], p0[3:0], g0[3:0], a[3:0], b[3:0], cin);
	assign p[0] = p0[0]&p0[1]&p0[2]&p0[3];
	assign g[0] = g0[3]|(p0[3]&g0[2])|(p0[3]&p0[2]&g0[1])|(p0[3]&p0[2]&p0[1]&g0[0]);
	assign c[0] = g|(p&cin);
	CLA_4bit C2(sum[7:4], trash[1], p1[3:0], g1[3:0], a[7:4], b[7:4], c[0]);
	assign p[1] = p1[0]&p1[1]&p1[2]&p1[3];
	assign g[1] = g1[3]|(p1[3]&g1[2])|(p1[3]&p1[2]&g1[1])|(p1[3]&p1[2]&p1[1]&g1[0]);
	assign c[1] = g|(p&c[0]);
	CLA_4bit C3(sum[11:8], trash[2], p2[3:0], g2[3:0], a[11:8], b[11:8], c[1]);
	assign p[2] = p2[0]&p2[1]&p2[2]&p2[3];
	assign g[2] = g2[3]|(p2[3]&g2[2])|(p2[3]&p2[2]&g2[1])|(p2[3]&p2[2]&p2[1]&g2[0]);
	assign c[2] = g|(p&c[1]);
	CLA_4bit C4(sum[15:12], cout, p3[3:0], g3[3:0], a[15:12], b[15:12], c[2]);

endmodule
