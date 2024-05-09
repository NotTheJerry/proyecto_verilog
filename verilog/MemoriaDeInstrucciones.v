module MemoriaDeInstrucciones ( input [31:0] dir, output reg [31:0] salidaMemoriaDeInstrucciones );
    //ancho y alto
    //8 bits de ancho y 256 de alto
    reg [7:0] mem [0:255];

    always @(*) begin    
        mem [0] = 8'b00000001;    
        mem [1] = 8'b01001010;    
        mem [2] = 8'b00011000;    
        mem [3] = 8'b00100000;
        
        salidaMemoriaDeInstrucciones =  { mem[dir], mem[dir + 1], mem[dir + 2], mem[dir + 3] };

    end

endmodule