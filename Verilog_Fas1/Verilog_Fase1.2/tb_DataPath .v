`timescale 1ns/1ns
module tb_DataPath ();

reg [31:0] instruccion_TR;

wire [31:0] tr_salida_final;

wire tb_zf;

DataPath_TipoR dataPath_TipoR ( .Instruccion_TR( instruccion_TR ), 
.tr_salida_final ( tr_salida_final ),
.tr_zf( tb_zf ) );

initial begin

    instruccion_TR = 32'b000000_01001_10001_00111_00000_100000;  //Guardar en todo
                      /* 000000 01001 10001 00111 00000 100000   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /*  dir 9 + dir 17  ->  dir 7 SUMA*/    // 26          //Banco de registros
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                      /* Memoria dir 26 valor 17  */
                      /* Banco dir 7 valor ?  */


    #200;

    //26 se guarda en la posicion 9 del banco

	instruccion_TR = 32'b000000_01001_10101_01001_00000_100000;  //Guardar en todo
                    /* Opcode   Rs    Rt    Rd    Shamt Funct   */
                    /*     dir 9 + dir21  -> dir 9     SUMA*/
                    /*    26 + 21  ->  dir 9          SUMA*/    //47       
                    /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                    /* Memoria dir 47 valor 21  */
                    /* Banco dir 9 valor 26  */

    #200;

    //21 se guarda en la posicion 47

    instruccion_TR = 32'b000000_01010_10100_01000_00000_100000;  //Guardar en todo
                    /* Opcode   Rs    Rt    Rd    Shamt Funct   */
                    /*    dir 10 + dir 20  -> dir 8     SUMA*/
                    /*    10 + 20  ->  dir 8          SUMA*/    //30       
                    /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                    /* Memoria dir 30 valor 20  */  //Resultado -> Rt
                    /* Banco dir 8 valor 47     */  //Resultado anterior
    #200;

    //30 se guarda en la posicion 0

    instruccion_TR = 32'b000000_10100_10000_00000_00000_100010;  //Guardar en todo
                    /* Opcode Rs    Rt    Rd    Shamt Funct   */
                    /*    dir 20 - dir 16  -> dir 0     RESTA*/
                    /*    20 - 16  ->  dir 0          RESTA*/    //4       
                    /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                    /* Memoria dir 4 valor 16  */  //Resultado -> Rt
                    /* Banco dir 0 valor 30     */  //Resultado anterior
    #200;


    //4 se guarda en la posicion 1

    instruccion_TR = 32'b000000_11100_10001_00001_00000_100010;  //Guardar en todo
                    /* Opcode   Rs    Rt    Rd    Shamt Funct   */
                    /*    dir 28 - dir 17  -> dir 1     RESTA*/
                    /*    28 - 17  ->  dir 1          RESTA*/    //11       
                    /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                    /* Memoria dir 11 valor 17  */  //Resultado -> Rt
                    /* Banco dir 1 valor 4     */  //Rd -> Resultado anterior
    #200;


    //11 se guarda en la posicion 6

    instruccion_TR = 32'b000000_10110_10111_00110_00000_101010;  //Guardar en todo
                    /* Opcode   Rs    Rt    Rd    Shamt Funct   */
                    /*    dir 22 /, dir 23  -> dir 6     STL*/
                    /*    22 < 23  ->  dir 6          STL*/    //1       
                    /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                    /* Memoria dir 1 valor 23  */  //Resultado -> Rt
                    /* Banco dir 6 valor 11     */  //Rd -> Resultado anterior
    #200;

    
    //1 se guarda en la posicion 4

    instruccion_TR = 32'b000000_10111_10110_00100_00000_101010;  //Guardar en todo
                    /* Opcode   Rs    Rt    Rd    Shamt Funct   */
                    /*    dir 23 < dir 22  -> dir 4     STL*/
                    /*    23 < 22  ->  dir 4          STL*/    //0       
                    /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                    /* Memoria dir 0 valor 22  */  //Resultado -> Rt
                    /* Banco dir 4 valor 1     */  //Rd -> Resultado anterior
    #200;


    //0 se guarda en la posicion 10

    instruccion_TR = 32'b000000_10001_10010_01010_00000_100100;  //Guardar en todo
                    /* Opcode   Rs    Rt    Rd    Shamt Funct   */
                    /*    dir 17 & dir 18  -> dir 10     AND*/
                    /*    23 & 22  ->  dir 10          AND*/    //16       
                    /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                    /* Memoria dir 16 valor 18  */  //Resultado -> Rt
                    /* Banco dir 10 valor 0     */  //Rd -> Resultado anterior
    #200;


    //0 se guarda en la posicion 10

    instruccion_TR = 32'b000000_01101_10101_01011_00000_100100;  //Guardar en todo
                    /* Opcode   Rs    Rt    Rd    Shamt Funct   */
                    /*    dir 13 & dir 21  -> dir 11     AND*/
                    /*    13 & 21  ->  dir 11          AND*/    //5     
                    /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
                    /* Memoria dir 5 valor 21  */  //Resultado -> Rt
                    /* Banco dir 11 valor 16     */  //Rd -> Resultado anterior
    #200;



end


endmodule