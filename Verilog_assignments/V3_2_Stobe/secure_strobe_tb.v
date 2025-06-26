`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 16:10:15
// Design Name: 
// Module Name: secure_strobe_tb
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

module secure_strobe_tb();
    reg clk;
    reg [5:0] d_in;
    wire [3:0] d_out;
    initial begin
        clk = 0;
        d_in = 6'b001010;
    end

    secure_router uut(.d_out(d_out), .d_in(d_in), .clk(clk));

    always #5 clk = ~clk;
    
endmodule
