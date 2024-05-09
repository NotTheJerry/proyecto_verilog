`timescale 1ns/1ns

module tb_Sumador ();        
    reg [31:0] entrada1, entrada2;    
    wire [31:0] salida;

    Sumador sumador ( .entrada1(entrada1), .entrada2(entrada2), .salida( salida ) );
    initial begin        
        entrada1 = 32'd10;        
        entrada2 = 32'd4;        
        #100;    
    end
endmodule