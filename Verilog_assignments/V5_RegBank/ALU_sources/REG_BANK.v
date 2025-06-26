module reg_bank (clk, rst, read_reg1, read_reg2 ,write_reg, write_data, write_en, read_data1, read_data2);
    
    input clk, rst, write_en;
    input [2:0] read_reg1, read_reg2, write_reg;
    input [31:0] write_data;
    
    output reg [31:0] read_data1, read_data2;

    reg [31:0] regs [0:7];
    initial
        begin
            regs[0] = 0;
        end

    integer i;
    always @(posedge clk or posedge rst) begin
        $monitor ("regs[0] = %d, regs[1]= %d, regs[2]= %d, regs[3]= %d, regs[4]= %d, regs[5]= %d, regs[6]= %d, regs[7]= %d", regs[0], regs[1], regs[2], regs[3], regs[4], regs[5], regs[6], regs[7]);
        $monitor ("regs[0] = %b, regs[1]= %b, regs[2]= %b, regs[3]= %b, regs[4]= %b, regs[5]= %b, regs[6]= %b, regs[7]= %b", regs[0], regs[1], regs[2], regs[3], regs[4], regs[5], regs[6], regs[7]);
        if (rst)
        for (i = 1; i < 8; i = i + 1)
            regs[i] <= i;
        else
        if (write_en)
            regs[write_reg] <= write_data;
    end 

    always @(negedge clk) begin
        read_data1 <= regs[read_reg1];
        read_data2 <= regs[read_reg2];
    end

    
endmodule