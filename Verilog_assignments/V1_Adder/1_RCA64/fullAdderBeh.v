`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:20 08/14/2024 
// Design Name: 
// Module Name:    fullAdderBeh 
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
module fullAdderBeh(s, c, a, b, cin
    );
	 input a, b, cin;
	 output s, c;
	 
	 assign s = a^b^cin;
	 assign c = (a&b)|(b&cin)|(cin&a);


endmodule
