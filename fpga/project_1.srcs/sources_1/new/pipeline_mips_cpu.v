`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 08:24:35
// Design Name: 
// Module Name: pipeline_mips_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pipeline_mips_cpu(
    input CLK,
    output [31:0] a0_out
    );
    wire clk;
    //***IF
    wire [31:0] pc_next,pc_4,pc,rom_out;
	wire pc_en,LOADUSE,BRANCH;
	//***ID
	wire [3:0] D_ALUControl;
	wire readRs,readRt,D_lw,D_mtc0,D_mfc0,D_eret,D__sel1,D_sel2,D_srav,D_sh,D_bgtz,D_syscall,D_jal,D_bne,D_beq,D_jr,D_j,D_MemtoReg,D_MemWrite,D_shift,D_RegDst,D_RegWrite,D_ALUSrc;
    wire [4:0] D_RW;
	wire [31:0] D_I,D_pc_4,D_R1,D_R2,v0,a0,D_shamt,D_imm,D_offset;
	wire D_ERs,D_MRs,D_ERt,D_MRt;
	//***EX
	wire [31:0] E_R1,E_R2,E_shamt,E_imm,E_pc_4,E_offset;
	wire [3:0] E_ALUCTR;
	wire [4:0] E_RW;
	wire E_j,E_jal,E_MemtoReg,E_MemWrite,E_beq,E_bne,E_bgtz,E_sh,E_RegWrite,E_syscall,E_shift,E_ALUSrc,E_mfc0,E_sel1,E_sel2,E_ERs,E_MRs,E_ERt,E_MRt,E_jr,E_lw; 
	wire [31:0] right_r1,right_r2i,X,Y,E_R,E_R_2,E_addr;
	wire Equal,branch,OF,UOF;
	//***MEM
	wire [31:0] M_R2,M_R,M_pc_4,ram_din,ram_out,M_D;
	wire [4:0] M_RW;
	wire M_jal,M_MemtoReg,M_MemWrite,M_sh,M_RegWrite,M_syscall,M_mfc0;
	//***WB
	wire [31:0] W_D,W_pc_4,rf_Din;
	wire [4:0] W_RW;
	wire W_jal,W_RegWrite,syscall,W_mfc0;
	wire [31:0] shift_imm_26;
    //***syscall
    wire halt,r_a0_en;
 
//*******************************

    
//*******************************
    assign clk = CLK & halt;
	//***IF
	assign pc_4 = pc+4;
    assign pc_en = halt & (~LOADUSE);
	assign pc_next = E_jr?E_R1:E_addr;
    //***ID
	assign D_RW = D_jal?31:(D_RegDst?D_I[15:11]:D_I[20:16]);
	assign D_shamt = {{27{1'b0}},D_I[10:6]};
	assign D_imm = {{16{D_I[15]}},D_I[15:0]};
	assign shift_imm_26 = ({{2{D_I[25]}},D_I[25:0]})<<2;
	assign D_offset = {D_pc_4[31:28],shift_imm_26[27:0]};
	//***Ex
	assign right_r1 = E_ERs?M_R:(E_MRs?W_D:E_R1);
	assign right_r2 = E_ERt?M_R:(E_MRt?W_D:E_R2);
	assign X = E_bgtz?0:(E_sel1?right_r2:right_r1);
	assign Y = E_sel2?right_r1:(D_shift?E_shamt:(E_ALUSrc?E_imm:right_r2));
	assign branch = (E_beq&Equal)|(E_bne&(~Equal))|(E_bgtz&(E_R[0])); 
	assign E_addr = E_j?E_offset:(branch?((E_pc_4)+(E_imm<<2)):pc_4);
	//***MEM
    assign ram_din = M_sh?(M_R[1]?{M_R2[15:0],ram_out[15:0]}:{ram_out[31:16],M_R2[15:0]}):M_R2;
    assign M_D = M_MemtoReg?ram_out:M_R;
	//***WB
	assign rf_Din = W_jal?W_pc_4:W_D;
	//***syscall
	assign halt = ~(syscall&(v0==10));
	assign r_a0_en = syscall&(v0!=10);
//*******************************


	//***IF
    reg_pos pc_reg(clk,1'b0,pc_en,pc_next,pc);

    ROM u_ROM(pc[11:2],rom_out);

	IF_ID u_IF_ID(clk,LOADUSE,BRANCH,rom_out,pc_4,D_I,D_pc_4);




	//***ID
	control_unit u_controlunit(D_I[25:21],D_I[31:26],D_I[5:0],D_ALUControl,readRs,readRt,D_lw,D_mtc0,D_mfc0,D_eret,D_sel1,D_sel2,D_srav,D_sh,D_bgtz,D_syscall,D_jal,D_bne,D_beq,D_jr,D_j,D_MemtoReg,D_MemWrite,D_shift,D_RegDst,D_RegWrite,D_ALUSrc);

    regfile u_regfile(clk,W_RegWrite,D_I[25:21],D_I[20:16],W_RW,rf_Din,D_R1,D_R2,v0,a0);

	ID_EX u_ID_EX(clk,(LOADUSE|BRANCH),D_R1,D_R2,D_shamt,D_imm,D_pc_4,D_offset,D_ALUControl,D_RW,D_j,D_jal,D_MemtoReg,D_MemWrite,D_beq,D_bne,D_bgtz,D_sh,D_RegWrite,D_syscall,D_shift,D_ALUSrc,D_mfc0,D_sel1,D_sel2,D_ERs,D_MRs,D_ERt,D_MRt,D_jr,D_lw,E_R1,E_R2,E_shamt,E_imm,E_pc_4,E_offset,E_ALUCTR,E_RW,E_j,E_jal,E_MemtoReg,E_MemWrite,E_beq,E_bne,E_bgtz,E_sh,E_RegWrite,E_syscall,E_shift,E_ALUSrc,E_mfc0,E_sel1,E_sel2,E_ERs,E_MRs,E_ERt,E_MRt,E_jr,E_lw );

	//***EX
	ALU u_ALU(X,Y,E_ALUCTR,E_R,E_R_2,OF,UOF,Equal);

	EX_MEM u_EX_MEM(clk,E_R2,E_R,E_pc_4,E_RW,E_jal,E_MemtoReg,E_MemWrite,E_sh,E_RegWrite,E_syscall,E_mfc0,M_R2,M_R,M_pc_4,M_RW,M_jal,M_MemtoReg,M_MemWrite,M_sh,M_RegWrite,M_syscall,M_mfc0);
	
	//***MEM
    RAM u_RAM(clk,M_MemWrite,ram_din,M_R[11:2],ram_out);
    
	//***WB
	MEM_WB u_MEM_WB(clk,M_D,M_pc_4,M_RW,M_jal,M_RegWrite,M_syscall,M_mfc0,W_D,W_pc_4,W_RW,W_jal,W_RegWrite,syscall,W_mfc0);

    //***hazard
	hazard_unit u_hazard(D_I[25:21],D_I[20:16],E_RW,M_RW,clk,M_RegWrite,E_RegWrite,readRs,readRt,branch,E_j,E_jr,E_lw,D_ERs,D_MRs,D_ERt,D_MRt,BRANCH,LOADUSE);

    //***syscall
    reg_pos u_rega0(clk,0,r_a0_en,a0,a0_out);
endmodule
