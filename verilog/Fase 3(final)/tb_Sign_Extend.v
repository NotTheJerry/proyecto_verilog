module tb_Sign_extend ();

    reg [15:0] a;
    wire [31:0] salida;

    Sign_extend sign_extend ( .a( a ), .salida( salida ));

    initial begin
        a=16'd3;
        #100;
    end

endmodule
