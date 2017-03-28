`timescale 1ns / 1ps

module hazard_unit(
	input reset,[4:0] Rs,Rt,E_RW,M_RW,
	input clk,M_RegWrite,E_RegWrite,read_Rs,read_Rt,branch,E_j,E_jr,E_lw,
	output E_Rs,M_Rs,E_Rt,M_Rt,BRANCH,LOADUSE
	);

	wire E_Rs_equal,M_Rs_equal,E_Rt_equal,M_Rt_equal,zero_Rs_equal,zero_Rt_equal,loaduse0,branch0;

	assign zero_Rs_equal = (Rs==0)?1:0;
	assign zero_Rt_equal = (Rt==0)?1:0;
	assign E_Rs_equal = (Rs==E_RW)?1:0;
	assign M_Rs_equal = (Rs==M_RW)?1:0;
	assign E_Rt_equal = (Rt==E_RW)?1:0;
	assign M_Rt_equal = (Rt==M_RW)?1:0;
	assign E_Rs = E_RegWrite & read_Rs & (~zero_Rs_equal) & E_Rs_equal;
	assign M_Rs = M_RegWrite & read_Rs & (~zero_Rs_equal) & M_Rs_equal;
	assign E_Rt = E_RegWrite & read_Rt & (~zero_Rt_equal) & E_Rt_equal;
	assign M_Rt = M_RegWrite & read_Rt & (~zero_Rt_equal) & M_Rt_equal;
	assign loaduse0 = E_lw & (E_Rs | E_Rt);
	assign branch0 = E_j | branch | E_jr;
	reg_neg #(1) r_loaduse(clk,reset,0,1,loaduse0,LOADUSE);
	reg_neg #(1) r_branch(clk,reset,0,1,branch0,BRANCH);
//    assign LOADUSE = loaduse0;
//	assign BRANCH = branch0;

endmodule
