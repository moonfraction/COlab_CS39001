`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:08:58
// Design Name: 
// Module Name: secure_router
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


module secure_router(d_out, d_in, clk, strobe);
   output reg [3:0] d_out;
   input [5:0] d_in;
   input clk, strobe;
   reg[3:0] cnt = 1;
   reg [3:0] case_select;
   reg p1, p2, p4;
   always @ (posedge clk)
    begin
        case_select[0] <= (~d_in[0] & ~d_in[1]);
        case_select[1] <= (d_in[0] & ~d_in[1]);
        case_select[2] <= (~d_in[0] & d_in[1]);
        case_select[3] <= (d_in[0] & d_in[1]);
        p1 <= d_in[2]^d_in[3]^d_in[5];
        p2 <= d_in[2]^d_in[4]^d_in[5];
        p4 <= d_in[3]^d_in[4]^d_in[5];
    end
   
   always @ (posedge clk) begin
   if (strobe == 1)begin
    case (cnt)
        1: begin
            d_out[0] <= case_select[0] & p1;
            d_out[1] <= case_select[1] & p1;
            d_out[2] <= case_select[2] & p1;
            d_out[3] <= case_select[3] & p1;
            end
        2: begin
            d_out[0] <= case_select[0] & p2;
            d_out[1] <= case_select[1] & p2;
            d_out[2] <= case_select[2] & p2;
            d_out[3] <= case_select[3] & p2;
            end

        3: begin
            d_out[0] <= case_select[0] & d_in[2];
            d_out[1] <= case_select[1] & d_in[2];
            d_out[2] <= case_select[2] & d_in[2];
            d_out[3] <= case_select[3] & d_in[2];
            end

        4: begin
            d_out[0] <= case_select[0] & p4;
            d_out[1] <= case_select[1] & p4;
            d_out[2] <= case_select[2] & p4;
            d_out[3] <= case_select[3] & p4;
            end

        5: begin
            d_out[0] <= case_select[0] & d_in[3];
            d_out[1] <= case_select[1] & d_in[3];
            d_out[2] <= case_select[2] & d_in[3];
            d_out[3] <= case_select[3] & d_in[3];
            end
        
        6: begin
            d_out[0] <= case_select[0] & d_in[4];
            d_out[1] <= case_select[1] & d_in[4];
            d_out[2] <= case_select[2] & d_in[4];
            d_out[3] <= case_select[3] & d_in[4];
            end

        7: begin
            d_out[0] <= case_select[0] & d_in[5];
            d_out[1] <= case_select[1] & d_in[5];
            d_out[2] <= case_select[2] & d_in[5];
            d_out[3] <= case_select[3] & d_in[5];
            cnt <= 1;
            end

        default : begin
            cnt <= 1;
        end
        endcase
        cnt <= cnt + 1;
     end
    end

endmodule
