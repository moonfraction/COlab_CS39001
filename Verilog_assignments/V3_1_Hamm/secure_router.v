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


module secure_router(d_out, d_in);
   output [27:0] d_out;
   input [5:0] d_in;
   
   wire [3:0] case_select;
   wire p1, p2, p4;
   assign case_select[0] = (~d_in[0] & ~d_in[1]);
   assign case_select[1] = (d_in[0] & ~d_in[1]);
   assign case_select[2] = (~d_in[0] & d_in[1]);
   assign case_select[3] = (d_in[0] & d_in[1]);

   assign p1 = d_in[2]^d_in[3]^d_in[5];
   assign p2 = d_in[2]^d_in[4]^d_in[5];
   assign p4 = d_in[3]^d_in[4]^d_in[5];
   
   assign d_out[0] = case_select[0] & p1;
   assign d_out[1] = case_select[0] & p2;
   assign d_out[2] = case_select[0] & d_in[2];
   assign d_out[3] = case_select[0] & p4;
   assign d_out[4] = case_select[0] & d_in[3];
   assign d_out[5] = case_select[0] & d_in[4];
   assign d_out[6] = case_select[0] & d_in[5];

   assign d_out[7] = case_select[1] & p1;
   assign d_out[8] = case_select[1] & p2;
   assign d_out[9] = case_select[1] & d_in[2];
   assign d_out[10] = case_select[1] & p4;
   assign d_out[11] = case_select[1] & d_in[3];
   assign d_out[12] = case_select[1] & d_in[4];
   assign d_out[13] = case_select[1] & d_in[5];
    
   assign d_out[14] = case_select[2] & p1;
   assign d_out[15] = case_select[2] & p2;
   assign d_out[16] = case_select[2] & d_in[2];
   assign d_out[17] = case_select[2] & p4;
   assign d_out[18] = case_select[2] & d_in[3];
   assign d_out[19] = case_select[2] & d_in[4];
   assign d_out[20] = case_select[2] & d_in[5];
    
   assign d_out[21] = case_select[3] & p1;
   assign d_out[22] = case_select[3] & p2;
   assign d_out[23] = case_select[3] & d_in[2];
   assign d_out[24] = case_select[3] & p4;
   assign d_out[25] = case_select[3] & d_in[3];
   assign d_out[26] = case_select[3] & d_in[4];
   assign d_out[27] = case_select[3] & d_in[5];
endmodule
