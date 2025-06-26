module xor_32bit(x, a, b);

    input [31:0] a;
    input [31:0] b;
    output [31:0] x;

    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin: xori
            xor xx (x[i], a[i], b[i]);
        end
    endgenerate
    
endmodule