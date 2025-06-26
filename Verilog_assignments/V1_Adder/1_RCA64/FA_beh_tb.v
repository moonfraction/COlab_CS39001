`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:38 08/14/2024
// Design Name:   fullAdderBeh
// Module Name:   D:/FPGA/A1/FA_beh_tb.v
// Project Name:  A1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fullAdderBeh
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA_beh_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	fullAdderBeh uut (
		.s(s), 
		.c(c), 
		.a(a), 
		.b(b), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

