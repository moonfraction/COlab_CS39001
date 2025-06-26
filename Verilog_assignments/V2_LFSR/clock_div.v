`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:23 08/21/2024 
// Design Name: 
// Module Name:    clock_div 
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

module clock_div(div_clk, clk);
    input clk;
    output reg div_clk;
    reg [26:0] count;
    always @(posedge clk) begin
        if(count == 27'd100000000) begin
            count <= 27'd0;
            div_clk <= ~div_clk;
        end
        else begin
            count <= count + 27'd1;
        end
    end 
endmodule
