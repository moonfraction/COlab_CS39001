`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:08 10/29/2024 
// Design Name: 
// Module Name:    D_Divisor 
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
module D_Divisor(dout, din, ld, rst, clk);
	output [7:0] dout;
	input [7:0] din;
	input rst, ld, clk;
	
	reg[7:0] D;
	
	always @(negedge clk)
		begin 
			if(rst || ld) D <= din;
		end
	
	assign dout = D;
	

endmodule
