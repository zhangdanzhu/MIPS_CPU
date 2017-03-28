`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 09:00:07
// Design Name: 
// Module Name: RAM
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


module RAM(clk,we,din,addr,ram_choose,ram_display,dout);

    parameter   DWIDTH = 32; //数据宽度
    parameter   AWIDTH = 10; //地址宽度

    input clk,we;
    input [DWIDTH-1:0] din;
    input [AWIDTH-1:0] addr;
    input [3:0] ram_choose;
    output [DWIDTH-1:0] ram_display; 
    output [DWIDTH-1:0] dout; 

    reg [DWIDTH-1:0] RAM_[0:2**AWIDTH-1];
    integer k;
    
    initial
    begin
        for (k = 0; k < 2**AWIDTH; k=k+1)
        begin
            RAM_[k] = 0;
        end
    end

    always @ (posedge clk)
    begin
        if(we) 
            RAM_[addr] <= din;
    end
    assign ram_display = RAM_[ram_choose]; 
    assign dout = RAM_[addr];
endmodule
