`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 15:35:58
// Design Name: 
// Module Name: LFSR_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LFSR_4bit(w, sel, rst, seed, clk);
    input [3:0] seed;
    input clk, rst, sel;
    output [3:0] w;
    wire [3:0] win;
    wire xo,clkslow; 
    clock_div C(.div_clk(clkslow), .clk(clk));	 
    mux_t M1(.in1(xo), .in0(seed[3]), .s(sel), .f(win[0]));
    mux_t M2(.in1(w[0]), .in0(seed[2]), .s(sel), .f(win[1]));
    mux_t M3(.in1(w[1]), .in0(seed[1]), .s(sel), .f(win[2]));
    mux_t M4(.in1(w[2]), .in0(seed[0]), .s(sel), .f(win[3]));
    
    DFF_t D1(.D(win[0]), .clock(clkslow), .Q(w[0]), .rst(rst));
    DFF_t D2(.D(win[1]), .clock(clkslow), .Q(w[1]), .rst(rst));
    DFF_t D3(.D(win[2]), .clock(clkslow), .Q(w[2]), .rst(rst));
    DFF_t D4(.D(win[3]), .clock(clkslow), .Q(w[3]), .rst(rst));
    xor X1(xo, w[3], w[2]);
     
endmodule
