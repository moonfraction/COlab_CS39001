`timescale 1ns / 1ps

module main_tb;

    // Inputs
    reg clk;
    reg rst;
    reg [2:0] opcode;

    // Instantiate the Unit Under Test (UUT)
    main_top uut (
        .clk(clk),
        .rst(rst),
        .opcode(opcode)
    );

    // Clock generation (50 MHz)
    always #10 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        opcode = 3'b000;

        // Reset the design
        #20 rst = 0;

        // Test opcode 000
        #20 opcode = 3'b000;
        #20 opcode = 3'b001;
        #20 opcode = 3'b010;
        #20 opcode = 3'b011;
        #20 opcode = 3'b100;
        #20 opcode = 3'b101;
        #20 opcode = 3'b110;
        #20 opcode = 3'b111;

        // Finish simulation
        #50 $finish;
    end

    // initial begin
    //     $dumpfile("main_top.vcd"); // For waveform viewing
    //     $dumpvars(0, tb_main_top);  // Dump everything
    // end

endmodule
