`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:45 10/29/2024
// Design Name:   top_lvl
// Module Name:   C:/Users/Student/Downloads/oct16/LT3_22CS30017/test_bench.v
// Project Name:  LT3_22CS30017
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_lvl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench;

	// Inputs
	reg [7:0] din_N;
	reg [7:0] din_D;

	// Outputs
	wire [7:0] dout_R;
	wire [7:0] dout_Q;

	// Instantiate the Unit Under Test (UUT)
	top_lvl uut (
		.dout_R(dout_R), 
		.dout_Q(dout_Q), 
		.din_N(din_N), 
		.din_D(din_D)
	);

	initial begin
		// Initialize Inputs
		din_N = 10;
		din_D = 2;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

