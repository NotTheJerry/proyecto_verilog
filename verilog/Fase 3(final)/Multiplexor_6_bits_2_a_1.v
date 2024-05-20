module Multiplexor_6_bits_2_a_1 ( input [5:0] a, input [5:0] b, input selector,
                                  output reg [5:0] salida );

always @(*) begin
    case(selector)
        1'b0: salida = a;
        1'b1: salida = b;
    endcase
end

endmodule
