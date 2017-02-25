`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 16:27:36
// Design Name: 
// Module Name: reg32_pos
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


module reg_pos(clk,clr,en,Din,Dout);
    
    parameter WIDTH = 32;
    input clk,clr,en;
    input [WIDTH-1:0] Din;
    output reg [WIDTH-1:0] Dout;
    
    initial
    begin
        Dout <= 0;
    end
    
    always@(posedge clk) 
    begin 
        if (clr == 1) 
            Dout <= 0; 
        else if (en)
            Dout <= Din; 
    end  
endmodule
