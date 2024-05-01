module UnidadDeControl( input [5:0] op,
output reg MemToReg, output reg MemToWrite, output reg RegWrite, output reg [1:0] AluOp );

always @(op) begin

    case(op)

    6'b000000: begin  //Instrucciones tipo R
        MemToReg = 1'b0;
        MemToWrite = 1'b1;
        RegWrite = 1'b1;
        AluOp = 2'b10;
    end


    endcase

end

endmodule