`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/26 18:30:45
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input reset,
    input en,
    output reg [31:0] n
    );
    
    initial
    begin
        n = 0;
    end
    
    always@(posedge clk)
    begin
        if(reset)
            n = 0;
        else if(en)
            n=n+1;
    end
    
    
endmodule
