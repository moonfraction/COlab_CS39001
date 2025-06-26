`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:30 08/14/2024 
// Design Name: 
// Module Name:    RCA_64bit 
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
module RCA_64bit(sum, cout, a, b, cin);
	 input [63:0] a, b;
	 input cin;
	 output cout;
	 output [63:0] sum;
	 wire prev;
	 
	 RCA_32bit R1(.sum(sum[31:0]), .cout(prev), .a(a[31:0]), .b(b[31:0]), .cin(cin));
	 RCA_32bit R2(.sum(sum[63:32]), .cout(cout), .a(a[63:32]), .b(b[63:32]), .cin(prev));


endmodule
