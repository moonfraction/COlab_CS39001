module mul(m, a, b);
    input [31:0] a, b;
    output [31:0] m;
    assign m = a * b;
endmodule