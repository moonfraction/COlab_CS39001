`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:35 10/29/2024 
// Design Name: 
// Module Name:    R_Remainder 
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
module R_Remainder(dout, din, D, ld, rst, clk, upd);
	output [7:0] dout;
	input [7:0] din, D; // D = divisor
	input ld, rst, clk, upd;
	
	reg [7:0] R, d;
	
	always @(negedge clk)
		begin 
			if(rst || ld) R <= din;
			else if(upd) begin
				d <= D;
				R <= R-d;
			end
		end
	
	assign dout = R;
	


endmodule
