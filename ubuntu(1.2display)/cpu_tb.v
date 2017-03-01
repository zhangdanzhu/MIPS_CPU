`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 10:00:04
// Design Name: 
// Module Name: cpu_tb
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


module cpu_tb();

    reg clk;
    wire [31:0] a0;
	
	integer k;    

    pipeline_mips_cpu DUT(clk,a0);
    
    initial
    begin
        clk = 0;
		for(k=0; k<5000; k=k+1)
		begin
			#5 clk = ~clk;
		end		 
		$stop;   
    end
	initial
	begin
		$dumpfile("mycpu.vcd");
		$dumpvars(0,cpu_tb); 
	end
    
endmodule
