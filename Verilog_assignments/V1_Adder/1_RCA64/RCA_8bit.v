`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:16 08/14/2024 
// Design Name: 
// Module Name:    RCA_8bit 
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
module RCA_8bit(sum, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output [7:0] sum;
    output cout;
	 wire [7:0] carry;
	 fullAdderStr fa1(.s(sum[0]), .c(carry[0]), .a(a[0]), .b(b[0]), .cin(cin));
    fullAdderStr fa2(.s(sum[1]), .c(carry[1]), .a(a[1]), .b(b[1]), .cin(carry[0]));
    fullAdderStr fa3(.s(sum[2]), .c(carry[2]), .a(a[2]), .b(b[2]), .cin(carry[1]));
    fullAdderStr fa4(.s(sum[3]), .c(carry[3]), .a(a[3]), .b(b[3]), .cin(carry[2]));
    fullAdderStr fa5(.s(sum[4]), .c(carry[4]), .a(a[4]), .b(b[4]), .cin(carry[3]));
    fullAdderStr fa6(.s(sum[5]), .c(carry[5]), .a(a[5]), .b(b[5]), .cin(carry[4]));
    fullAdderStr fa7(.s(sum[6]), .c(carry[6]), .a(a[6]), .b(b[6]), .cin(carry[5]));
    fullAdderStr fa8(.s(sum[7]), .c(cout), .a(a[7]), .b(b[7]), .cin(carry[6]));
endmodule
