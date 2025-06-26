`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:33:59 09/11/2024
// Design Name:   INTERFACE
// Module Name:   /home/vivan/Downloads/K_ALU/tb_Interface.v
// Project Name:  K_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: INTERFACE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_INTERFACE;

    // Testbench signals
    reg [2:0] func;
    reg clk;
    wire [31:0] A, B, Z;
    
    // Instantiate the INTERFACE module
    INTERFACE uut (
        .func(func),
        .clk(clk)
    );

    // Clock generation
    always #10 clk = ~clk;  // 100 MHz clock

    // Monitor the values of registers and outputs
    initial begin
        // Initialize signals
        clk = 1;
        func = 0;

        // Monitor the state of all registers and outputs
        $monitor("Time: %0t | r0 = %d | r1 = %d | r2 = %d | r3 = %d | r4 = %d | r5 = %d | r6 = %d | r7 = %d",
		 $time, uut.Bnk.reg_bank[31:0], uut.Bnk.reg_bank[63:32], uut.Bnk.reg_bank[95:64], uut.Bnk.reg_bank[127:96], uut.Bnk.reg_bank[159:128], uut.Bnk.reg_bank[191:160], uut.Bnk.reg_bank[223:192], uut.Bnk.reg_bank[255:224]);

        // Initialize the Bank module's registers with some values
        // If Bank module registers can be accessed directly:
        // You might need to adapt this according to how your Bank module interface works
        // For example:
        uut.Bnk.reg_bank = 256'h0000000700000006000000050000000400000003000000020000000100000000;  // Example value
        
        // Wait for some time to let the module initialize
        #20;

        // Test all functions
        // Function 0
        func = 3'd0;
        #20;
        // Function 1
        func = 3'd1;
        #20;
        // Function 2
        func = 3'd2;
        #20;
        // Function 3
        func = 3'd3;
        #20;
        // Function 4
        func = 3'd4;
        #20;
        // Function 5
        func = 3'd5;
        #20;
        // Function 6
        func = 3'd6;
        #20;
        // Function 7
        func = 3'd7;
        #20;

        // End the simulation
        $stop;
    end

endmodule

