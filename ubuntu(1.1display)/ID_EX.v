`timescale 1ns / 1ps

module ID_EX(
	input clk,clr,
	input [31:0] D_R1,D_R2,D_shamt,D_imm,D_pc_4,D_offset,
	input [3:0] D_ALUCTR,
	input [4:0] D_RW,
	input D_j,D_jal,D_MemtoReg,D_MemWrite,D_beq,D_bne,D_bgtz,D_sh,D_RegWrite,D_syscall,D_shift,D_ALUSrc,D_mfc0,D_sel1,D_sel2,D_ERs,D_MRs,D_ERt,D_MRt,D_jr,D_lw,
	output [31:0] E_R1,E_R2,E_shamt,E_imm,E_pc_4,E_offset,
	output [3:0] E_ALUCTR,
	output [4:0] E_RW,
	output E_j,E_jal,E_MemtoReg,E_MemWrite,E_beq,E_bne,E_bgtz,E_sh,E_RegWrite,E_syscall,E_shift,E_ALUSrc,E_mfc0,E_sel1,E_sel2,E_ERs,E_MRs,E_ERt,E_MRt,E_jr,E_lw 
	);
	
	reg_pos R1(clk,clr,1'b1,D_R1,E_R1);
	reg_pos R2(clk,clr,1'b1,D_R2,E_R2);
	reg_pos shamt(clk,clr,1'b1,D_shamt,E_shamt);
	reg_pos imm(clk,clr,1'b1,D_imm,E_imm);
	reg_pos pc_4(clk,clr,1'b1,D_pc_4,E_pc_4);
	reg_pos offset(clk,clr,1'b1,D_offset,E_offset);
	reg_pos #(4) ALUCTR(clk,clr,1'b1,D_ALUCTR,E_ALUCTR);
	reg_pos #(5) RW(clk,clr,1'b1,D_RW,E_RW);
	reg_pos #(1) j(clk,clr,1'b1,D_j,E_j);
	reg_pos #(1) jal(clk,clr,1'b1,D_jal,E_jal);
	reg_pos #(1) MemtoReg(clk,clr,1'b1,D_MemtoReg,E_MemtoReg);
	reg_pos #(1) MemWrite(clk,clr,1'b1,D_MemWrite,E_MemWrite);
	reg_pos #(1) beq(clk,clr,1'b1,D_beq,E_beq);
	reg_pos #(1) bne(clk,clr,1'b1,D_bne,E_bne);
	reg_pos #(1) bgtz(clk,clr,1'b1,D_bgtz,E_bgtz);
	reg_pos #(1) sh(clk,clr,1'b1,D_sh,E_sh);
	reg_pos #(1) RegWrite(clk,clr,1'b1,D_RegWrite,E_RegWrite);
	reg_pos #(1) syscall(clk,clr,1'b1,D_syscall,E_syscall);
	reg_pos #(1) shift(clk,clr,1'b1,D_shift,E_shift);
	reg_pos #(1) ALUSrc(clk,clr,1'b1,D_ALUSrc,E_ALUSrc);
	reg_pos #(1) mfc0(clk,clr,1'b1,D_mfc0,E_mfc0);
	reg_pos #(1) sel1(clk,clr,1'b1,D_sel1,E_sel1);
	reg_pos #(1) sel2(clk,clr,1'b1,D_sel2,E_sel2);
	reg_pos #(1) ERs(clk,clr,1'b1,D_ERs,E_ERs);
	reg_pos #(1) ERt(clk,clr,1'b1,D_ERt,E_ERt);
	reg_pos #(1) MRs(clk,clr,1'b1,D_MRs,E_MRs);
	reg_pos #(1) MRt(clk,clr,1'b1,D_MRt,E_MRt);
	reg_pos #(1) jr(clk,clr,1'b1,D_jr,E_jr);
	reg_pos #(1) lw(clk,clr,1'b1,D_lw,E_lw);

endmodule
