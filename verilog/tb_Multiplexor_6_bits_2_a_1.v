module tb_Multiplexor_6_bits_2_a_1();

reg [5:0] a;
reg [5:0] b;
reg selector;
wire [5:0] salida;


Multiplexor_6_bits_2_a_1 mux ( .a( a ), .b( b ), .selector( selector ), .salida( salida ) );


initial begin
    a=5'd4;
    b=5'd8;
    selector=1'b1;
    #100;

    a=5'd4;
    b=5'd8;
    selector=1'b0;
    #100;
end


endmodule