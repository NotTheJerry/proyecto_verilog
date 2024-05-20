`timescale 1ns/1ns

module tb_MemoriaDeInstrucciones ();        
    reg [31:0] entrada;    
    wire [31:0] salida;

    MemoriaDeInstrucciones m1 ( .dir( entrada ), .salidaMemoriaDeInstrucciones( salida ));
    initial begin
        entrada = 32'd0;        
        #100;   
    end
endmodule
