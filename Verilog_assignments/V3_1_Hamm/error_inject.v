`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:40:55
// Design Name: 
// Module Name: error_inject
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
module error_inject(d_e, d_o, idx);
    input [6:0] d_o;
    output [6:0] d_e;
    input [2:0] idx;
    
    assign d_e[0] = d_o[0] ^ ( ~idx[0] & ~idx[1] );
    assign d_e[1] = d_o[1] ^ ( idx[0] & ~idx[1] );
    assign d_e[2] = d_o[2] ^ ( ~idx[0] & idx[1] );
    assign d_e[3] = d_o[3] ^ ( idx[0] & idx[1] );
    assign d_e[6:4] = d_o[6:4];
    
endmodule

