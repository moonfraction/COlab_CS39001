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


module hamm_tb();
    reg [5:0] in;
    wire [15:0] out;
    reg clk;

    initial begin
    in = 6'b101000;
    clk = 0;
    end
    top_lvl UUT(.out(out), .in(in), .clk(clk));
    
    always begin 
        #100 clk = 1;
        #100 clk = 0;
        #100 clk = 1;
        #100 clk = 0;
        end
endmodule
