`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:32 08/14/2024 
// Design Name: 
// Module Name:    RCA_16bit 
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
module RCA_16bit(sum, cout, a, b, cin);
	 input [15:0] a, b;
	 input cin;
	 output cout;
	 output [15:0] sum;
	 wire prev;
	 
	 RCA_8bit R1(.sum(sum[7:0]), .cout(prev), .a(a[7:0]), .b(b[7:0]), .cin(cin));
	 RCA_8bit R2(.sum(sum[15:8]), .cout(cout), .a(a[15:8]), .b(b[15:8]), .cin(prev));

endmodule
