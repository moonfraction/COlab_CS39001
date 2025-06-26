module ALU_tb;

  // Inputs to the ALU
  reg [31:0] a, b;
  reg [3:0] op;

  // Output from the ALU
  wire [31:0] r;

  // Instantiate the ALU module
  ALU uut (
    .a(a),
    .b(b),
    .op(op),
    .r(r)
  );

  initial begin
    // Initialize inputs
    a = 32'h00000000; // 0 in hexadecimal
    b = 32'h00000000; // 0 in hexadecimal
    op = 4'b0000; // Set op to 0 for the first operation

    // Monitor changes
    $monitor("Time: %0d, a: %b, b: %b, op: %d, result: %b", $time, a, b, op, r);

    // Apply test casd
    #10 a = 32'h00000010; b = 32'h00000005; op = 4'b0000; // Test addition
    #10 a = 32'h00000010; b = 32'h00000005; op = 4'b0001; // Test subtraction
    #10 a = 32'h00000010; b = 32'h00000005; op = 4'b0010; // Test multiplication
    #10 a = 32'h00000020; b = 32'h00000005; op = 4'b0011; // Test division
    #10 a = 32'h000000F0; b = 32'h0000000F; op = 4'b0100; // Test AND
    #10 a = 32'h000000F0; b = 32'h0000000F; op = 4'b0101; // Test OR
    #10 a = 32'h000000F0; b = 32'h0000000F; op = 4'b0110; // Test XOR
    #10 a = 32'hFFFFFFFF; b = 32'h00000000; op = 4'b0111; // Test complement
    #10 a = 32'h00000001; b = 32'h00000005; op = 4'b1000; // Test left shift
    #10 a = 32'h00000020; b = 32'h00000002; op = 4'b1001; // Test right shift
    #10 a = 32'hFFFFFFF0; b = 32'h00000001; op = 4'b1010; // Test arithmetic shift
    #10 a = 32'h0000000A; op = 4'b1011;                  // Test increment
    #10 a = 32'h0000000A; op = 4'b1100;                  // Test decrement
    #10 a = 32'h000000FF; op = 4'b1101;                  // Test hamming weight

    // End simulation after all tests
    #10 $stop;
  end
endmodule
