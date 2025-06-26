`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:50 10/29/2024 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath(dout_R, dout_Q, upd, din_N, din_D, ld, rst, clk, ld2, cng);
	output [7:0] dout_R, dout_Q;
	input [7:0] din_N, din_D;
	input ld, rst, clk, ld2, cng;
	output upd;
	
	wire [7:0] WD, WR, WQ;
	reg [7:0] zero = 8'd0;
	
	D_Divisor D(.dout(WD), .din(din_D), .ld(ld), .rst(rst), .clk(clk));
	R_Remainder R(.dout(WR), .din(din_N), .D(WD), .ld(ld), .rst(rst), .clk(clk), .upd(cng));
	Q_Quotient Q(.dout(WQ), .din(zero), .ld(ld), .rst(rst), .clk(clk), .upd(cng));
	comp C(.upd(upd), .din_D(WD), .din_R(WR), .ld2(ld2), .clk(clk));
	
endmodule
