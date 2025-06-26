`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:11 10/29/2024 
// Design Name: 
// Module Name:    top_lvl 
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
module top_lvl(dout_R, dout_Q, din_N, din_D);
	output [7:0] dout_R, dout_Q;
	input [7:0] din_N, din_D;
	
	wire ld, rst, upd, ld2, clk, cng;
	
	Datapath dp(.dout_R(dout_R), .dout_Q(dout_Q), .upd(upd), .din_N(din_N), .din_D(din_D), .ld(ld), .rst(rst), .clk(clk), .ld2(ld2), .cng(cng));
	Controlpath cp(.ld(ld), .rst(rst), .upd(upd), .ld2(ld2), .clk(clk), .cng(cng));
endmodule
