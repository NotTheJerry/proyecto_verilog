module PC ( input [31:0] entrada_PC, input CLK, output reg [31:0] salida_PC );

always @(*) begin
    salida_PC = entrada_PC;
end

endmodule
