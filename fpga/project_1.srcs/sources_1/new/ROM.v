`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 09:15:26
// Design Name: 
// Module Name: ROM
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


module ROM(raddr,dout);

    parameter   DWIDTH = 32; //数据宽度
    parameter   AWIDTH = 10; //地址宽度

    input [AWIDTH-1:0] raddr;
    output [DWIDTH-1:0] dout; 

    reg [DWIDTH-1:0] ROM_ [0:2**AWIDTH-1];
        
    initial
    begin
        $readmemh("D:\\MIPS_CPU\\test\\benchmark.hex",ROM_,0,2**AWIDTH-1);
    end    
        
    assign dout = ROM_[raddr];
    
endmodule

