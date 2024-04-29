module Memoria( input [31:0]dato, input [31:0]direccion, input sel, //Ewr
                output reg [31:0] salida );

reg [31:0] array [63:0];

initial begin
    $readmemb ("data.txt", array);
end

always @(*) begin

    if(sel) begin  //Escribir 1
        array[direccion]=dato;
        salida = 32'd0;
    end
    else begin //Leer 0
        salida=array[direccion];
    end

end
endmodule
