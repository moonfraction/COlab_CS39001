`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:29 10/29/2024 
// Design Name: 
// Module Name:    comp 
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
module comp(upd, din_D, din_R, ld2, clk);
	output upd;
	input [7:0] din_D, din_R;
	input ld2, clk;
	
	reg [7:0] D, R, t;
	
	always @(negedge clk) 
		begin 
			if(ld2)
				begin
					D <= din_D;
					R <= din_R;
				end
		end
	
	assign upd = (R >= D);
	
	
endmodule
