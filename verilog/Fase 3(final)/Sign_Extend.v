module Sign_Extend (
    input [15:0] a,
    output reg [31:0] salida
);

    always @(*) begin
        if (a[15] == 1) begin
            salida = {{16{a[15]}}, a};
        end
        else begin
            salida = {{16{1'b0}}, a};
        end
    end

endmodule