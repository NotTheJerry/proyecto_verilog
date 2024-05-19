`timescale 1ns/1ns
module tb_PC ();

    reg [31:0] entrada_PC;
    reg CLK;
    wire [31:0] salida_PC;

    PC pc ( .entrada_PC( entrada_PC ), .CLK( CLK ), .salida_PC( salida_PC ) );

    initial begin
        entrada_PC = 32'd19;
        CLK = 1;
        #100;

        entrada_PC = 32'd10;
        CLK = 0;
        #100;
    end

endmodule
