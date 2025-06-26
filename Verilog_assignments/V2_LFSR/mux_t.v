`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:51 08/21/2024 
// Design Name: 
// Module Name:    mux_t 
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
module mux_t(in1, in0, s, f);
    input in1, in0, s;
    output reg f;
    always @(*)
        if (s)
            f = in1;
        else
            f = in0;
endmodule
