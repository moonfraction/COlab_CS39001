`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:34 10/29/2024 
// Design Name: 
// Module Name:    Controlpath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Controlpath(ld, rst, upd, ld2, clk, cng);
	output reg ld, rst, ld2, cng;
	input upd, clk;
	
	reg [1:0] state;
	
	always @(posedge clk)
		begin
			case (state)
				2'd0: begin ld <= 1; rst <= 0; ld2 <= 0; cng <= 0; end // load initial
				2'd1: begin ld <= 0; rst <= 0; ld2 <= 1; cng <= 0; end // load comparator and update
				2'd2: begin ld <= 0; rst <= 0; ld2 <= 0; cng <= 1; end // wait for update
				2'd3: begin ld <= 0; rst <= 0; ld2 <= 0; cng <= 0;end // final state
			endcase
		end
		
	always @(negedge clk) begin
		if(rst == 1) state <= 0; // if rst, goto state0
		// if(upd == 0) state <= 3; // if upd==0 i.e. division complete, goto state3 (final state)
		case(state)
			2'd0: state <= 1;
			2'd1: if(upd==1) state <= 2; else state <= 3;
			2'd2: state <= 1;
		endcase
	end
	
	
	

endmodule
