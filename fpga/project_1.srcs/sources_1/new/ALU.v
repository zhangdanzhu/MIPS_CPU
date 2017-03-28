`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/22 10:09:10
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] X,Y,
    input [3:0] S,
    output reg [31:0] Result,Result2,
    output reg OF,UOF,
    output Equal
    );
    
    reg sf;
    assign Equal = (X==Y);
    always@(X or Y or S)
    begin
        case (S)
            0: Result = X << Y[4:0];
            1: Result = $signed(X) >>> Y[4:0];
            2: Result = X >> Y[4:0];
            3: {Result2,Result} = X * Y;
            4: 
            begin 
                Result = {{32{1'b0}},X} / Y; 
                Result2 = {{32{1'b0}},X} % Y;
            end 
            5: 
            begin 
                {sf,Result} = X + Y;
                OF <= (Result[31] ^ X[31]) & (~(X[31] ^ Y[31]));
                UOF <= sf;
            end
            6: 
            begin
                {sf,Result} = X - Y;
                OF <= (Result[31] ^ X[31]) & ( X[31] ^ Y[31]);
                UOF <= ~sf;
            end
            7: Result = X & Y;
            8: Result = X | Y;
            9: Result = X ^ Y;
            10: Result = ~(X | Y);
            11: Result = ($signed(X) < $signed(Y))?1:0;
            12: Result = (X < Y)?1:0;
        endcase
    end 

endmodule
