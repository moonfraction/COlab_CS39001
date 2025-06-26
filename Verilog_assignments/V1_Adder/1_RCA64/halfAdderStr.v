`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:18 08/14/2024 
// Design Name: 
// Module Name:    halfAdderStr 
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
module halfAdderStr(s, c, a, b
    );
	input a, b;
	output s, c;
	and A1(c, a, b);
	xor X1(s, a, b);
endmodule
