module main_top(clk, rst, opcode);
    input clk, rst;
    input [2:0] opcode;
    wire write_en;
    wire [2:0] read_reg1, read_reg2, write_reg;
    wire [31:0] write_data;
    wire [3:0] alu_op;
    wire [31:0] read_data1, read_data2;
    wire [31:0] a, b, z;

    reg[3:0] tr1, tr2, tw, top, twn;

    reg_bank reg_bank_inst(.clk(clk), .rst(rst), .read_reg1(read_reg1), .read_reg2(read_reg2), .write_reg(write_reg), .write_data(write_data), .write_en(write_en), .read_data1(read_data1), .read_data2(read_data2));
    ALU ALU_inst(.a(read_data1), .b(read_data2), .op(alu_op), .r(write_data));

    always @(posedge clk or posedge rst) begin
           case(opcode)
                3'b000: begin 
                    tr1<=3'b010;
                    tr2<=3'b011;
                    tw<=3'b001;
                    top<=4'b0000;
                    twn<=1;
                end
                3'b001: begin 
                    tr1<=3'b001;
                    tr2<=3'b101;
                    tw<=3'b100;
                    top<=4'b0001;
                    twn<=1;
                end
                3'b010: begin 
                    tr1<=3'b001;
                    tr2<=3'b010;
                    tw<=3'b010;
                    top<=4'b1010;
                    twn<=1;
                end
    
                3'b011: begin 
                    tr1<=3'b001;
                    tr2<=3'b010;
                    tw<=3'b111;
                    top<=4'b1011;
                    twn<=1;
                end
    
                3'b100: begin 
                    tr1<=3'b001;
                    tr2<=3'b010;
                    tw<=3'b110;
                    top<=4'b0010;
                    twn<=1;
                end
    
                3'b101: begin 
                    tr1<=3'b001;
                    tr2<=3'b010;
                    tw<=3'b001;
                    top<=4'b0100;
                    twn<=1;
                end
    
                3'b110: begin 
                    tr1<=3'b010;
                    tr2<=3'b010;
                    tw<=3'b011;
                    top<=4'b1000;
                    twn<=1;
                end
    
                3'b111: begin 
                    tr1<=3'b000;
                    tr2<=3'b000;
                    tw<=3'b110;
                    top<=4'b1000;
                    twn<=1;
                end
    
        endcase
    end

    assign read_reg1 = tr1;
    assign read_reg2 = tr2;
    assign write_reg = tw;
    assign alu_op = top;
    assign write_en = twn; 


endmodule