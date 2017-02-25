`timescale 1ns / 1ps

module IF_ID(
	input clk,en,clr,
	input [31:0] F_I,F_pc_4,
	output [31:0] D_I,D_pc_4 
	);
	
	reg_pos I(clk,clr,~en,F_I,D_I);
	reg_pos pc_4(clk,clr,~en,F_pc_4,D_pc_4);

endmodule

