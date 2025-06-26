`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 15:08:31
// Design Name: 
// Module Name: hamm_tb
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


module hamm_tb(out, in);
    input [5:0] in;
    output [15:0] out;

    top_lvl UUT(.out(out), .in(in));

    assign in = 6'b101000;

endmodule
