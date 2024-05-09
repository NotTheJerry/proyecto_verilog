module Multiplexor_5_bits_2_a_1 ( input [4:0] a, input [4:0] b, input selector,
                                  output reg [4:0] salida );

always @(*) begin
    case(selector)
        1'b0: salida = a;
        1'b1: salida = b;
    endcase
end

endmodule
