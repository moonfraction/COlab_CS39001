`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 15:01:29
// Design Name: 
// Module Name: top_lvl
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


module top_lvl(out, in);
    input [5:0] in;
    output [15:0] out;
    wire[27:0] l1, l2;
    wire [7:0] err;
    assign err = 8'b11100100;
    secure_router S(.d_out(l1), .d_in(in));
    
    error_inject E0(.d_e(l2[6:0]), .d_o(l1[6:0]), .idx(err[1:0]));
    error_inject E1(.d_e(l2[13:7]), .d_o(l1[13:7]), .idx(err[3:2]));
    error_inject E2(.d_e(l2[20:14]), .d_o(l1[20:14]), .idx(err[5:4]));
    error_inject E3(.d_e(l2[27:21]), .d_o(l1[27:21]), .idx(err[7:6]));

    error_correct C0(.d_disp(out[3:0]), .d_hamm(l2[6:0]));
    error_correct C1(.d_disp(out[7:4]), .d_hamm(l2[13:7]));
    error_correct C2(.d_disp(out[11:8]), .d_hamm(l2[20:14]));
    error_correct C3(.d_disp(out[15:12]), .d_hamm(l2[27:21]));
endmodule
