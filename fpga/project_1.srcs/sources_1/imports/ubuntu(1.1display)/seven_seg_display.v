`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/22 20:45:14
// Design Name: 
// Module Name: seven_seg_display
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

module seven_seg_display(
    input clk,
    input [31:0] number,
    output reg [0:7] choose,seg
    );
    initial begin 
        choose <= 8'b11111111;       //0选，1不选
        seg <= 8'b11111111;          // 1暗，0亮
    end
    parameter interval = 5000;     // 降频间隔
    integer k = 0;                   // 计数变量

	wire [0:7] one,two,three,four,five,six,seven,eight;

	number_to_7seg u_trans1(number[3:0],one);
	number_to_7seg u_trans2(number[7:4],two);
	number_to_7seg u_trans3(number[11:8],three);
	number_to_7seg u_trans4(number[15:12],four);
	number_to_7seg u_trans5(number[19:16],five);
	number_to_7seg u_trans6(number[23:20],six);
	number_to_7seg u_trans7(number[27:24],seven);
	number_to_7seg u_trans8(number[31:28],eight);

    always@(posedge clk) begin
        k=k+1;
        case (k)
            1: begin      // 低四位
                choose = 8'b01111111;
                seg = one;
            end
            interval: begin    
                choose = 8'b10111111;
                seg = two; 
            end
            2*interval: begin   
                choose = 8'b11011111;
                seg = three; 
            end
            3*interval: begin    
                choose = 8'b11101111;
                seg = four;    
            end
            4*interval: begin   
                choose = 8'b11110111;
                seg = five; 
            end
            5*interval: begin    
                choose = 8'b11111011;
                seg = six;  
            end
            6*interval: begin    
                choose = 8'b11111101;
                seg = seven;   
            end
            7*interval: begin    // 高四位
                choose = 8'b11111110;
                seg = eight;                        
            end
            8*interval: begin
                k=0;                         
            end
        endcase
    end
endmodule
