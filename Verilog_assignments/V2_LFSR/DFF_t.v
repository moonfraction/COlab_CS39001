`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:45 08/21/2024 
// Design Name: 
// Module Name:    DFF_t 
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
module DFF_t(D, clock, Q, rst);
    input D, clock, rst;
    output reg Q;
    always @(posedge clock or posedge rst) begin
        if(rst)
            Q<= 1'b0;
        else
            Q<=D;
    end
endmodule