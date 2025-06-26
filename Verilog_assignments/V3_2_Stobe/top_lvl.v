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


module top_lvl(out, in, clk);
    input clk;
    input [5:0] in;
    output [15:0] out;
   
    wire[3:0] l1, l2, strobe2;
    wire [7:0] err;
    reg strobe = 1;
    reg [3:0] cnt = 1;
    assign err = 8'b11100100;
    secure_router S(.d_out(l1), .d_in(in), .clk(clk), .strobe(strobe));
    
    error_inject E0(.strobe_out(strobe2[0]), .d_er(l2[0]), .d_o(l1[0]), .idx(err[1:0]), .strobe_in(strobe), .clk(clk));
    error_inject E1(.strobe_out(strobe2[1]), .d_er(l2[1]), .d_o(l1[1]), .idx(err[3:2]), .strobe_in(strobe), .clk(clk));
    error_inject E2(.strobe_out(strobe2[2]), .d_er(l2[2]), .d_o(l1[2]), .idx(err[5:4]), .strobe_in(strobe), .clk(clk));
    error_inject E3(.strobe_out(strobe2[3]), .d_er(l2[3]), .d_o(l1[3]), .idx(err[7:6]), .strobe_in(strobe), .clk(clk));

    error_correct C0(.d_disp(out[3:0]), .d_hamm(l2[0]), .strobe(strobe2[0]), .clk(clk));
    error_correct C1(.d_disp(out[7:4]), .d_hamm(l2[1]), .strobe(strobe2[1]), .clk(clk));
    error_correct C2(.d_disp(out[11:8]), .d_hamm(l2[2]), .strobe(strobe2[2]), .clk(clk));
    error_correct C3(.d_disp(out[15:12]), .d_hamm(l2[3]), .strobe(strobe2[3]), .clk(clk));
    
    always @ (posedge clk) begin
        case (cnt)
        1: cnt = cnt + 1;
        2: cnt = cnt + 1;
        3: cnt = cnt + 1;
        4: cnt = cnt + 1;
        5: cnt = cnt + 1;
        6: cnt = cnt + 1;
        7: strobe = 0;
        default: cnt = 7;
        endcase 
     end  
endmodule
