module Multiplexor( input [31:0]a, input [31:0]b, input selector,
            output reg [31:0] salida );

always @(a or b or selector) begin

    case(selector)

    1'b1: salida = a;
    1'b0: salida = b;

    endcase

end

endmodule
