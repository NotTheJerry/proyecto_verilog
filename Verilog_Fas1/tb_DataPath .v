
`timescale 1ns/1ns
module tb_DataPath ();
 
reg [31:0] instruccion_TR;

wire [31:0] tr_salida_final;

wire tb_zf;

DataPath_TipoR dataPath_TipoR ( .Instruccion_TR( instruccion_TR ), 
.tr_salida_final ( tr_salida_final ),
.tr_zf( tb_zf ) );

initial begin

    instruccion_TR = 32'b00000001001100010001000000100000;  //Guardar en todo
                      /* 000000 01001 10001 00111 00000 100000   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 9     17    7     Shamt SUMA*/
                      /*  9 + 17  ->  7 SUMA*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;


    instruccion_TR = 32'b00000101001100010001000000100000;   //Leer en todo
                      /* 000001 01001 10001 00111 00000 100000   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 9     17    7     Shamt SUMA*/
                      /*  9 + 17  ->  7 SUMA*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	instruccion_TR = 32'b00000001101000100001000000100000;  //Guardar en todo
                      /* 000000 01101 00010 00010 00000 100000   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 13    2     2     Shamt SUMA*/
                      /*  13 + 2  ->  2 SUMA*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	instruccion_TR = 32'b00000101101000100001000000100000;  //Leer en todo
                      /* 000000 01101 00010 00010 00000 100000   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 13    2     2     Shamt SUMA*/
                      /*  13 + 2  ->  2 SUMA*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	instruccion_TR = 32'b00000000111000100001100000100010;  //Guardar en todo
                      /* 000000 00111 00010 00011 00000 100010   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 7     2     3     Shamt RESTA*/
                      /*  7 - 2  ->  3 RESTA*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	instruccion_TR = 32'b00000100111000100001100000100010;  //Leer en todo
                      /* 000001 00111 00010 00011 00000 100010   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 7     2     3     Shamt RESTA*/
                      /*  7 - 2  ->  3 RESTA*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	instruccion_TR = 32'b00000001010001010010000000100010;  //Guardar en todo
                      /* 000000 01010 00101 00100 00000 100010   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 10     5     4     Shamt RESTA*/
                      /*  10 - 5  ->  4 RESTA*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	instruccion_TR = 32'b00000101010001010010000000100010;  //Leer en todo
                      /* 000001 01010 00101 00100 00000 100010   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 10     5     4     Shamt RESTA*/
                      /*  10 - 5  ->  4 RESTA*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	instruccion_TR = 32'b00000001010001010010000000101010;  //Guardar en todo
                      /* 000000 01010 00101 00100 00000 101010   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 10     5     4     Shamt SLT*/
                      /*  10 < 5  ->  4 SLT*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	instruccion_TR = 32'b00000101010001010010000000101010;  //Leer en todo
                      /* 000001 01010 00101 00100 00000 101010   */
                      /* Opcode Rs    Rt    Rd    Shamt Funct   */
                      /* Opcode 10     5     4     Shamt SLT*/
                      /*  10 < 5  ->  4 SLT*/
                      /* Rs -> Op1    Rt-> Op2    Rd -> Direccion de guardado  */
    #10;
	
	

end


endmodule

