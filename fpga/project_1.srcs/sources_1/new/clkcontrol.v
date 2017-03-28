`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/25 09:09:53
// Design Name: 
// Module Name: clkcontrol
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


module clkcontrol(
    input CLK,
    output reg clk
    );
    integer k;
    
    initial
    begin
        clk = 0;
    end
    
    always@(posedge CLK)
    begin
        k=k+1;
        if(k==1000000)
        begin
            clk = ~clk;
            k=0;
        end
    end
    
endmodule
