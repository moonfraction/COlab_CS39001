`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:06 08/14/2024 
// Design Name: 
// Module Name:    halfAdderBeh 
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
module halfAdderBeh(s, c, a, b
    );
	 input a, b;
	 output s, c;
	 assign s = a ^ b;
	 assign c = a & b;
endmodule
