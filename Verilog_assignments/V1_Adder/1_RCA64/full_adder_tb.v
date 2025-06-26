`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:25:24 08/14/2024
// Design Name:   full_adder
// Module Name:   D:/FPGA/A1/full_adder_tb.v
// Project Name:  A1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire c;
	wire s;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.c(c), 
		.s(s), 
		.a(a), 
		.b(b), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 1;
		b = 0;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

