`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:51:11
// Design Name: 
// Module Name: error_correct
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


module error_correct(d_disp, d_hamm);
    output [3:0] d_disp;
    input [6:0] d_hamm;
    
    wire p1, p2, p4;
    assign p1 = d_hamm[0] ^ d_hamm[2] ^ d_hamm[4] ^ d_hamm[6];
    assign p2 = d_hamm[1] ^ d_hamm[2] ^ d_hamm[5] ^ d_hamm[6];
    assign p4 = d_hamm[3] ^ d_hamm[4] ^ d_hamm[5] ^ d_hamm[6];

    assign d_disp[0] = d_hamm[2]^(~p4&p2&p1);
    assign d_disp[1] = d_hamm[4]^(p4&~p2&p1);
    assign d_disp[2] = d_hamm[5]^(p4&p2&~p1);
    assign d_disp[3] = d_hamm[6]^(p4&p2&p1);
endmodule
