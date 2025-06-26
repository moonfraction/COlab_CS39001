`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:46 08/14/2024 
// Design Name: 
// Module Name:    CLA_4bit 
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
module CLA_4bit(sum, cout,p, g, a, b, cin);
	input [3:0] a, b;
	input cin;
	output [3:0] sum, p, g;
	output cout;
	
	wire [3:0] c;
	and A1(g[0], a[0], b[0]);
	xor X1(p[0], a[0], b[0]);
	
	and A2(g[1], a[1], b[1]);
	xor X2(p[1], a[1], b[1]);
	
	and A3(g[2], a[2], b[2]);
	xor X3(p[2], a[2], b[2]);

	and A4(g[3], a[3], b[3]);
	xor X4(p[3], a[3], b[3]);

	assign c[0] = (p[0]&cin)|g[0];
	assign c[1] = g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
	assign c[2] = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
	assign c[3] = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
	
	assign cout = c[3];
	
	xor X5(sum[0], p[0], cin);
	xor X6(sum[1], p[1], c[0]);
	xor X7(sum[2], p[2], c[1]);
	xor X8(sum[3], p[3], c[2]);

endmodule
