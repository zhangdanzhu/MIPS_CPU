`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/23 16:24:25
// Design Name: 
// Module Name: number_to_7seg
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

module number_to_7seg(
    input [3:0] number_in,
	output reg [0:7] number_out 
    );
    always@(number_in) begin
        case(number_in)
            0: begin
                number_out = 8'b00000011;
            end
            1: begin
                number_out = 8'b10011111;
            end 
            2: begin
                number_out = 8'b00100101;
            end
            3: begin
                number_out = 8'b00001101;
            end   
            4: begin
                number_out = 8'b10011001;
            end
            5: begin
                number_out = 8'b01001001;
            end 
            6: begin
                number_out = 8'b01000001;
            end
            7: begin
                number_out = 8'b00011111;
            end
            8: begin
                number_out = 8'b00000001;
            end
            9: begin
                number_out = 8'b00001001;
            end
            10: begin
                number_out = 8'b00010001;
            end
			11: begin
                number_out = 8'b11000001;
            end
			12: begin
                number_out = 8'b01100011;
            end
			13: begin
                number_out = 8'b10000101;
            end
			14: begin
                number_out = 8'b01100001;
            end
			15: begin
                number_out = 8'b01110001;
            end
            default: begin
                number_out = 8'b11111111;
            end    
        endcase
    end
endmodule
