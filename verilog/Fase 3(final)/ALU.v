`timescale 1ns/1ns
module ALU( input [31:0]op1, input [31:0]op2, input [3:0]sel, 
            output [31:0]res, output zf );

    assign res = (sel == 4'b0000)? op1 & op2 :
    (sel == 4'b0001)? op1 | op2 :
    (sel == 4'b0010)? op1 + op2 :
    (sel == 4'b0110)? op1 - op2 :
    (sel == 4'b0111)? op1 < op2 ? 1:0:
    (sel == 4'b1100)? !(op1 | op2) :
    0;

    assign zf = (res == 0) ? 1 : 0;
    //dos iguales es una comparacio y uno solo es una asignacion

endmodule
