`timescale 1ns / 1ps

module control_unit(
	input [4:0] rs,
	input [5:0] op,funct,
	output [3:0] ALUControl,
	output readRs,readRt,lw,mtc0,mfc0,eret,sel1,sel2,srav,sh,bgtz,syscall,jal,bne,beq,jr,j,MemtoReg,MemWrite,shift,RegDst,RegWrite,ALUSrc
	);

//	wire mfco,mtc0,srav,xor_,sh,bgtz,eret,add,addi,addiu,addu,and_,andi,sll,sra,srl,sub,or_,ori,nor_,lw,beq,bne,slt,slti,sltu,j_,jal,jr,syscall;
	wire xor_,add,addi,addiu,addu,and_,andi,sll,sra,srl,sub,or_,ori,nor_,slt,slti,sltu,j_;
    
    assign mfc0 = ({op,rs}==11'b01000000000)?1:0; 
	assign mtc0 = ({op,rs}==11'b01000000100)?1:0; 
	assign srav = ({op,funct}==12'b000000000111)?1:0; 
	assign xor_ = ({op,funct}==12'b000000100110)?1:0; 
	assign sh =  (op==6'b101001)?1:0; 
	assign bgtz = (op==6'b000111)?1:0; 
	assign eret = ({op,funct}==12'b010000011000)?1:0; 
	assign add =  ({op,funct}==12'b000000100000)?1:0; 
	assign addi = (op==6'b001000)?1:0; 
	assign addiu = (op==6'b001001)?1:0; 
	assign addu = ({op,funct}==12'b000000100001)?1:0;
	assign and_ = ({op,funct}==12'b000000100100)?1:0; 
	assign andi = (op==6'b001100)?1:0;
	assign sll = ({op,funct}==12'b000000000000)?1:0; 
	assign sra = ({op,funct}==12'b000000000011)?1:0; 
	assign srl = ({op,funct}==12'b000000000010)?1:0; 
	assign sub = ({op,funct}==12'b000000100010)?1:0; 
	assign or_ = ({op,funct}==12'b000000100101)?1:0; 
	assign ori = (op==6'b001101)?1:0;
	assign nor_ = ({op,funct}==12'b000000100111)?1:0;
	assign lw = (op==6'b100011)?1:0;
	assign sw = (op==6'b101011)?1:0;
	assign beq = (op==6'b000100)?1:0;
	assign bne = (op==6'b000101)?1:0;
	assign slt = ({op,funct}==12'b000000101010)?1:0;
	assign slti = (op==6'b001010)?1:0;
	assign sltu = ({op,funct}==12'b000000101011)?1:0;
	assign j_ = (op==6'b000010)?1:0;
	assign jal = (op==6'b000011)?1:0;
	assign jr = ({op,funct}==12'b000000001000)?1:0;
	assign syscall = ({op,funct}==12'b000000001100)?1:0;
	
	assign readRs = add|addi|addiu|addu|and_|andi|sub|or_|ori|nor_|lw|sw|beq|bne|slt|slti|sltu|jr;
	assign readRt = add|addu|and_|sll|sra|srl|sub|or_|nor_|sw|beq|bne|slt|sltu|mtc0|mfc0;
	
	assign shift = sll|sra|srl;
	assign sel1 = srav|shift;
	assign sel2 = srav|bgtz;
	assign j = j_|jal;
	assign MemtoReg = lw;
	assign MemWrite = sh|sw;
	assign RegDst = xor_|add|addu|and_|sll|sra|srl|sub|or_|nor_|slt|sltu|srav;
	assign RegWrite = xor_|add|addi|addiu|addu|and_|andi|sll|sra|srl|mfc0|sub|or_|ori|nor_|lw|slt|slti|sltu|jal|srav;
	assign ALUSrc = addi|addiu|andi|ori|lw|sw|slti|sh;
	
	assign ALUControl[3] = xor_|sltu|nor_|or_|ori|slt|slti|bgtz;
	assign ALUControl[2] = sltu|lw|sw|addu|addiu|addi|add|sh|bne|beq|sub|and_|andi;
	assign ALUControl[1] = and_|andi|srl|nor_|bne|beq|sub|slt|slti|bgtz;
	assign ALUControl[0] = bgtz|xor_|sra|lw|sw|addu|addiu|addi|add|and_|andi|slt|slti|srav|sh;
	
	
//	assign nor_ = 

//	assign mfc0 = (~op[5]) & (op[4]) & (~op[3]) & (~op[2]) & (~op[1]) & (~op[0]) & (~rs[4]) & (~rs[3]) & (~rs[2]) & (~rs[1]) & (~rs[0]);
//	assign mtc0 = (~op[5]) & (op[4]) & (~op[3]) & (~op[2]) & (~op[1]) & (~op[0]) & (~rs[4]) & (~rs[3]) & (rs[2]) & (~rs[1]) & (~rs[0]);
//	assign srav = (~op[5]) & (~op[4]) & (~op[3]) & (~op[2]) & (~op[1]) & (~op[0]) & (~funct[5]) & (~funct[4]) & (~funct[3]) & (funct[2]) & (funct[1]) & (funct[0]);
//	assign xor_ = (~op[5]) & (~op[4]) & (~op[3]) & (~op[2]) & (~op[1]) & (~op[0]) & (funct[5]) & (~funct[4]) & (~funct[3]) & (funct[2]) & (funct[1]) & (~funct[0]);
//	assign sh = (op[5]) & (~op[4]) & (op[3]) & (~op[2]) & (~op[1]) & (op[0]);
//	assign bgtz = (~op[5]) & (~op[4]) & (~op[3]) & (op[2]) & (op[1]) & (op[0]);
//	assign eret = (~op[5]) & (op[4]) & (~op[3]) & (~op[2]) & (~op[1]) & (~op[0]) & (~funct[5]) & (funct[4]) & (funct[3]) & (~funct[2]) & (~funct[1]) & (~funct[0]);
//	assign add = (~op[5]) & (~op[4]) & (~op[3]) & (~op[2]) & (~op[1]) & (~op[0]) & (funct[5]) & (~funct[4]) & (~funct[3]) & (~funct[2]) & (~funct[1]) & (~funct[0]);
//	assign addi = (~op[5]) & (~op[4]) & (op[3]) & (~op[2]) & (~op[1]) & (~op[0]);
//	assign addiu = (~op[5]) & (~op[4]) & (op[3]) & (~op[2]) & (~op[1]) & (op[0]);
//	assign addu = (~op[5]) & (~op[4]) & (~op[3]) & (~op[2]) & (~op[1]) & (~op[0]) & (funct[5]) & (~funct[4]) & (~funct[3]) & (~funct[2]) & (~funct[1]) & (funct[0]);
	
//	assign nor_ = (~op[5]) & (~op[4]) & (~op[3]) & (~op[2]) & (~op[1]) & (~op[0]) & (funct[5]) & (~funct[4]) & (~funct[3]) & (funct[2]) & (funct[1]) & (funct[0]);
    
	

endmodule
