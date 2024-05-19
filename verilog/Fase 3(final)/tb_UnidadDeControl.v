`timescale 1ns/1ns

module tb_UnidadDeControl ();

reg [5:0] op;
wire MemToReg, MemToWrite, RegWrite;
wire [1:0] AluOp;

UnidadDeControl unidadDeControl1( .op( op ),
.MemToReg( MemToReg ), .MemToWrite( MemToWrite ), .RegWrite( RegWrite ), .AluOp( AluOp ) );


initial begin
    op = 6'b000000;
    #100;
end

endmodule


module tb_Multiplexor ();

reg [31:0] a, b;
reg selector;
wire [31:0] salida;

Multiplexor multiplexor ( .a( a ), .b( b ), .selector( selector ),
            .salida(salida) );

initial begin

    a=32'd10; b=32'd20; selector=1'b1;
    #100;

    a=32'd10; b=32'd20; selector=1'b0;
    #100;

end

endmodule
