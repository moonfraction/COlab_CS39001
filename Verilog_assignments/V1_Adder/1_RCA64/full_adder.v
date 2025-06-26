`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:23 08/14/2024 
// Design Name: 
// Module Name:    full_adder 
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
module fullAdderStr(c, s, a, b, cin
    );
	input a, b, cin;
	output s, c;
	
	wire s1, c1, c2;
	
	halfAdderStr HA1(.s(s1), .c(c1), .a(a), .b(b));
	halfAdderStr HA2(.s(s), .c(c2), .a(s1), .b(cin));
	
	or O1(c, c1, c2);

endmodule
