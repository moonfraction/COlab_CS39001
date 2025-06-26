`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:49 10/29/2024 
// Design Name: 
// Module Name:    Q_Quotient 
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
module Q_Quotient(dout, din, ld, rst, clk, upd);
	output [7:0] dout;
	input [7:0] din;
	input ld, rst, clk, upd;
	
	reg[7:0] Q;
	
	always @(negedge clk)
		begin 
			if(rst || ld) Q <= din;
			else if(upd) Q = Q + 8'd1;
		end
	
	assign dout = Q;

endmodule
