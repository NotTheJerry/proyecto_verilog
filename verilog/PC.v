`timescale 1ns/1ns

module PC ( input [31:0] entrada_PC, input CLK, output reg [31:0] salida_PC );

reg inversor;

initial begin
    salida_PC = 32'b0;
end

always @(posedge CLK) begin
    salida_PC <= (entrada_PC) ? entrada_PC : 32'b0;
end

endmodule
