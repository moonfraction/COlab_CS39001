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
module error_inject(strobe_out, d_er, d_o, idx, strobe_in, clk);
    input strobe_in, clk;
    input d_o;
    output reg d_er, strobe_out = 0;
    input [1:0] idx;
    reg [6:0] d_e;
    reg [2:0] cnt = 1;
    always @ (posedge clk)
    begin
        if(strobe_in == 1) begin
            case (cnt)
            1: d_e[0] = d_o ^ (~idx[0] & ~idx[1]);
            2: d_e[1] = d_o ^ (idx[0] & ~idx[1]);
            3: d_e[2] = d_o ^ (~idx[0] & idx[1]);
            4: d_e[3] = d_o ^ (idx[0] & idx[1]);
            5: d_e[4] = d_o;
            6: d_e[5] = d_o;
            7: begin
                d_e[6] = d_o;
                strobe_out = 1;
               end
            default: cnt = 0;
            endcase
            cnt = cnt + 1;
        end
        if(strobe_out == 1)begin
            case (cnt)
            8: d_er = d_e[0];
            7: d_er = d_e[1];
            6: d_er = d_e[2];
            5: d_er = d_e[3];
            4: d_er = d_e[4];
            3: d_er = d_e[5];
            2: begin
                d_er = d_e[6];
                strobe_out = 0;
               end
            default: cnt = 0;
            endcase 
            cnt = cnt - 1;
        end      
    end
    
endmodule

