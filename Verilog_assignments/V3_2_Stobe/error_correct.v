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


module error_correct(d_disp, d_hamm, strobe, clk);
    output reg [3:0] d_disp;
    input d_hamm, strobe, clk;
    reg [3:0]cnt = 1;
    reg [6:0] d;
    reg p1 = 0, p2 = 0, p4 = 0;
    
    always @ (posedge clk) begin
        if(strobe == 1)begin
            case (cnt)
                1: d[0] = d_hamm;
                2: d[1] = d_hamm;
                3: d[2] = d_hamm;
                4: d[3] = d_hamm;
                5: d[4] = d_hamm;
                6: d[5] = d_hamm;
                7: d[6] = d_hamm;
                default: cnt = 0;
           endcase
           cnt = cnt + 1;
          end
        else begin
            cnt = 1;
            p1 = d[0] ^ d[2] ^ d[4] ^ d[6];
            p2 = d[1] ^ d[2] ^ d[5] ^ d[6];
            p4 = d[3] ^ d[4] ^ d[5] ^ d[6];
            d_disp[0] = d[2]^(~p4&p2&p1);
            d_disp[1] = d[4]^(p4&~p2&p1);
            d_disp[2] = d[5]^(p4&p2&~p1);
            d_disp[3] = d[6]^(p4&p2&p1);
        end
       end
endmodule
