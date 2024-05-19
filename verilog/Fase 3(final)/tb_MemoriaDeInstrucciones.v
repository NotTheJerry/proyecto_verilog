`timescale 1ns/1ns

module tb_MemoriaDeInstrucciones ();        
    reg [31:0] entrada;    
    wire [31:0] salida;

    MemoriaDeInstrucciones m1 ( .dir( entrada ), .salidaMemoriaDeInstrucciones( salida ));
    initial begin        
        //entrada = 32'b00000001_01001010_00011000_00100000;        
        //entrada = 32'b000000_01010_01010_00011_00000_100000; 
        entrada = 32'd0;        
        #100;   
    end
endmodule
