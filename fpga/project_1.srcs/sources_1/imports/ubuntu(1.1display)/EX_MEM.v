`timescale 1ns / 1ps

module EX_MEM(
	input clk,reset,
	input [31:0] E_R2,E_R,E_pc_4,
	input [4:0] E_RW,
	input E_jal,E_MemtoReg,E_MemWrite,E_sh,E_RegWrite,E_syscall,E_mfc0,
	output [31:0] M_R2,M_R,M_pc_4,
	output [4:0] M_RW,
	output M_jal,M_MemtoReg,M_MemWrite,M_sh,M_RegWrite,M_syscall,M_mfc0
	);
	
	reg_pos R2(clk,reset,0,1,E_R2,M_R2);
	reg_pos R(clk,reset,0,1,E_R,M_R);
	reg_pos pc_4(clk,reset,0,1,E_pc_4,M_pc_4);
	reg_pos #(5) RW(clk,reset,0,1,E_RW,M_RW);
	reg_pos #(1) jal(clk,reset,0,1,E_jal,M_jal);
	reg_pos #(1) MemtoReg(clk,reset,0,1,E_MemtoReg,M_MemtoReg);
	reg_pos #(1) MemWrite(clk,reset,0,1,E_MemWrite,M_MemWrite);
	reg_pos #(1) sh(clk,reset,0,1,E_sh,M_sh);
	reg_pos #(1) RegWrite(clk,reset,0,1,E_RegWrite,M_RegWrite);
	reg_pos #(1) syscall(clk,reset,0,1,E_syscall,M_syscall);
	reg_pos #(1) mfc0(clk,reset,0,1,E_mfc0,M_mfc0);

endmodule
