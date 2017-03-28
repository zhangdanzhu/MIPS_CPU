`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/24 15:26:19
// Design Name: 
// Module Name: hazard_tb
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


module hazard_tb(

    );
    
     reg [4:0] Rs,Rt,E_RW,M_RW;
           reg clk,M_RegWrite,E_RegWrite,read_Rs,read_Rt,branch,E_j,E_jr,E_lw;
           wire E_Rs,M_Rs,E_Rt,M_Rt,BRANCH,LOADUSE;
    
    hazard_unit DUT(Rs,Rt,E_RW,M_RW,clk,M_RegWrite,E_RegWrite,read_Rs,read_Rt,branch,E_j,E_jr,E_lw,E_Rs,M_Rs,E_Rt,M_Rt,BRANCH,LOADUSE);
    
    initial 
    begin
        clk<=0;M_RegWrite<=0;E_RegWrite<=0;read_Rs<=0;read_Rt<=0;branch<=0;E_j<=0;E_jr<=0;E_lw<=0;
        Rs<=0;Rt<=0;E_RW<=0;M_RW<=0;
        #5
        clk = 1;
        #5
        clk = 0;
        #5
        clk = 1;
        #5
        clk = 0;
    end
endmodule
