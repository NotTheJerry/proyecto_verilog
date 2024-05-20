module Shift_left (
    input [25:0] in,
    output [31:0] out
);

    assign out[27:0] = in << 2;

endmodule

