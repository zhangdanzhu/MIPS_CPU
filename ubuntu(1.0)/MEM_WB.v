`timescale 1ns / 1ps

module MEM_WB(
	input clk,
	input [31:0] M_D,M_pc_4,
	input [4:0] M_RW,
	input M_jal,M_RegWrite,M_syscall,M_mfc0,
	output [31:0] W_D,W_pc_4,
	output [4:0] W_RW,
	output W_jal,W_RegWrite,syscall,W_mfc0
	);
	
	reg_pos D(clk,0,1,M_D,W_D);
	reg_pos pc_4(clk,0,1,M_pc_4,W_pc_4);
	reg_pos #(5) RW(clk,0,1,M_RW,W_RW);
	reg_pos #(1) jal(clk,0,1,M_jal,W_jal);
	reg_pos #(1) RegWrite(clk,0,1,M_RegWrite,W_RegWrite);
	reg_pos #(1) syscall0(clk,0,1,M_syscall,syscall);
	reg_pos #(1) mfc0(clk,0,1,M_mfc0,W_mfc0);

endmodule
