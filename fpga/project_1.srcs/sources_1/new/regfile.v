`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/23 15:39:57
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,WE,
    input [4:0] R1_,R2_,RW,
    input [31:0] Din,
    output [31:0] R1,R2,v0,a0
    );
    
    reg [31:0] regs[31:0];
    integer k;
    assign R1 = regs[R1_];
    assign R2 = regs[R2_];
	assign v0 = regs[2];
	assign a0 = regs[4];

    initial
    begin
        for (k = 0; k < 32; k=k+1)
        begin
            regs[k] = 0;
        end    
    end
    always@(negedge clk)
    begin
        if (WE == 1)
            regs[RW] <= Din;
    end
    
endmodule
