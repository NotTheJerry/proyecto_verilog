`timescale 1ns/1ns
module tb_DataPath ();

reg CLK;

wire [31:0] tr_salida_final;

DataPath_TipoR d ( .CLK( CLK ), .tr_salida_final( tr_salida_final ) );

initial begin
    CLK=1'b0;
    #200;

    CLK=1'b1;
    #200;
    
    CLK=1'b0;
    #200;

    CLK=1'b1;
    #200;

end

endmodule
