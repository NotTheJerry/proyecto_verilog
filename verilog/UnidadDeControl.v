module UnidadDeControl( input [5:0] op,
output reg RegDst, output reg Branch, output reg MemToRead,
output reg MemToReg, output reg MemToWrite, output reg ALUSrc, 
output reg RegWrite, output reg [1:0] AluOp );

always @(op) begin

    case(op)

    6'b000000: begin  //Instrucciones tipo R
        RegDst = 1'b0;  //Nuevo 
        Branch = 1'b0;  //Nuevo
        MemToRead = 1'b0; //Nuevo
        MemToReg = 1'b0;
        MemToWrite = 1'b1;
        ALUSrc = 1'b0; //Nuevo
        RegWrite = 1'b1;
        AluOp = 2'b10;
    end


    endcase

end

endmodule