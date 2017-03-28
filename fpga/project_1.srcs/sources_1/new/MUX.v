`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 16:40:39
// Design Name: 
// Module Name: MUX
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


module MUX(in_zero,in_one,s,out);
    parameter WIDTH = 32;
    input [WIDTH-1:0] in_zero,in_one;
    input s;
    output [WIDTH-1:0] out;
    assign out = s?in_one:in_zero;
endmodule
