`timescale 1ns/1ns
module tb_DataPath ();

reg [31:0] instruccion_TR;

reg CLK;

wire [31:0] tr_salida_final;


DataPath_TipoR d ( .Instruccion_TR( instruccion_TR ), .CLK( CLK ), .tr_salida_final( tr_salida_final ) );


initial begin

    
    instruccion_TR = 32'b10;
    CLK=1'b1;
    #100;

    instruccion_TR = 32'b10;
    CLK=1'b0;
    #100;
    // instruccion_TR = 32'b000000_01001_10001_00111_00000_100000;  //Guardar en todo
    //                   /* 000000 01001 10001 00111 00000 100000   */
    //                   /* Opcode Rs    Rt    Rd    Shamt Funct   */
    //                   /*  dir 9 + dir 17  ->  dir 7 SUMA*/    // 26          //Banco de registros
    //                   /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    //                   /* Memoria dir 26 valor 17  */
    //                   /* Banco dir 7 valor ?  */


    // #200;

    // //26 se guarda en la posicion 9 del banco

	// instruccion_TR = 32'b000000_01001_10101_01001_00000_100000;  //Guardar en todo
    //                 /* Opcode   Rs    Rt    Rd    Shamt Funct   */
    //                 /*     dir 9 + dir21  -> dir 9     SUMA*/
    //                 /*    26 + 21  ->  dir 9          SUMA*/    //47       
    //                 /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    //                 /* Memoria dir 47 valor 21  */
    //                 /* Banco dir 9 valor 26  */

    // #200;

    


end


endmodule