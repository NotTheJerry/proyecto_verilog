module ALUControl_tb ();

reg [5:0] entradaFunct;
reg [1:0] ALUOp;
wire [3:0] salida;

ALU_Control aluControl1( .entradaFunct( entradaFunct ), .ALUOp( ALUOp ), .salida( salida ) );

initial begin
    entradaFunct = 6'b100000; //Suma
    ALUOp = 2'b10;
    #100;
    entradaFunct = 6'b100010; //Resta
    ALUOp = 2'b10;
    #100;
    entradaFunct = 6'b100100; //AND
    ALUOp = 2'b10;
    #100;
    entradaFunct = 6'b100101; //OR
    ALUOp = 2'b10;
    #100;
    entradaFunct = 6'b101010; //STL
    ALUOp = 2'b10;
end

endmodule
