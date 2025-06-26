`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:53 08/14/2024 
// Design Name: 
// Module Name:    RCA_32bit 
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
module RCA_32bit(sum, cout, a, b, cin);
	 input [31:0] a, b;
	 input cin;
	 output cout;
	 output [31:0] sum;
	 wire prev;
	 
	 RCA_16bit R1(.sum(sum[15:0]), .cout(prev), .a(a[15:0]), .b(b[15:0]), .cin(cin));
	 RCA_16bit R2(.sum(sum[31:16]), .cout(cout), .a(a[31:16]), .b(b[31:16]), .cin(prev));

endmodule
