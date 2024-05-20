module Sumador ( input [31:0] entrada1, input [31:0] entrada2, output reg [31:0] salida ); 
    assign salida = entrada1 + entrada2;
endmodule