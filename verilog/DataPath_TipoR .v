module DataPath_TipoR ( input CLK,
output [31:0] tr_salida_final );

/* PC */   wire [31:0] salida_PC;
/* Cable para conectar PC a la memoria de isntrucciones */ wire [31:0] d1;
/* Sumador +4 */ reg [31:0] reg_mas_4 = 32'd4;
/* Cable para conectar sumador salida del sumador +4 a una de las entradas del mux 2 a 1 mas arriba */ wire [31:0] d2;
/* Cable para la salida de la memoria de instrucciones */ wire [31:0] d3;

/* Cable salida Add_ALU_Result */ wire [31:0] ad1;

/* Cable salida read data 1 del banco */ wire [31:0] d4;
/* Cable salida read data 2 del banco */ wire [31:0] d5;

/* Cable salida mux entre banco y memIsntrucciones */ wire [4:0] d6;

/* Salida de la Unidad de Control */ wire MemToReg;
/* Salida de la Unidad de Control */ wire MemToWrite;
/* Salida de la Unidad de Control */ wire RegWrite;
/* Salida de la Unidad de Control */ wire RegDst;
/* Salida de la Unidad de Control */ wire [1:0] AluOpUnidad;

/* Cable salida del modulo Sign-Extend */ wire [31:0] q1;


/* Cable salida del modulo Shift_left_2 */ wire [31:0] sh1;

wire [31:0] c2;

/* Cable salida de la ALU Natural */ wire [31:0] c3;

/* Cable salida de la ALU Control */ wire [3:0] c4;

/* Cable salida del mux entre banco y ALU natural */ wire [31:0] f1;

/* Cable salida de la memoria final al mux */ wire [31:0] c5;

/* Cable salida puerto ZF de la ALU Natural */ wire salida_zf;

/* Cable salida de la compuerta AND */ wire k1;

/* Cable salida mux mas arriba */ wire [31:0] salida_multiplexor_arriba;

/* Cable salida del multiplexor final mas recargado a la derecha */  wire [31:0] s_mux_final;


Sumador sumador ( .entrada1( d1 ), .entrada2( reg_mas_4 ), .salida( d2 ) ); 

Shift_left_2 shift_left_2 ( .in( q1 ), .out( sh1 ) );

Sumador sumador_ALU_Result ( .entrada1( d2 ), .entrada2( sh1 ), .salida( ad1 ) );

Multiplexor mux1 ( .a( ad1 ), .b( d2 ), .selector( k1 ),  .salida( salida_multiplexor_arriba ) );

PC pc ( .entrada_PC( salida_multiplexor_arriba ), .CLK( CLK ), .salida_PC( d1 ) );

MemoriaDeInstrucciones memInstruc ( .dir( d1 ), .salidaMemoriaDeInstrucciones( d3 ) );



Multiplexor_5_bits_2_a_1 mux_entre_memInstrucciones_y_banco ( .a( d3[20:16] ), .b( d3[15:11] ), .selector( RegDst ),  .salida( d6 ) );

BancoRegistros bancoRegistros ( .ra1( d3[25:21] ), .ra2( d3[20:16] ), .di( d3 ), .dir( d6 ), .ena( RegWrite ),
                                .dr1( d4 ), .dr2( d5 ) );





Sign_Extend s1 ( .a( d3[15:0] ), .salida( q1 ) );

 
Multiplexor mux_entre_banco_y_alu_natural ( .a( q1 ), .b( d5 ), .selector( ALUSrc ), .salida( f1 ) );


ALU_Control aluControl ( .entradaFunct( d3[5:0] ), .ALUOp( AluOpUnidad ), .salida( c4 ) ); 


UnidadDeControl unidadDeControl ( .op( d3[31:26] ), 
.RegDst( RegDst ), .Branch( Branch ), .MemToRead( MemToRead ),  .MemToReg( MemToReg ),
.MemToWrite( MemToWrite ), .ALUSrc( ALUSrc ), .RegWrite( RegWrite ), .AluOp( AluOpUnidad ) );


ALU alu ( .op1( d4 ), .op2( f1 ), .sel( c4 ), .res( c3 ), .zf( salida_zf ) );



Compuerta_AND compuerta_AND ( .a( Branch ), .b( salida_zf ), .salida( k1 ) ); /* 1 bit todo */ 


Memoria memoria ( .dato( d5 ), .direccion( c3 ), .sel( MemToWrite ), .salida( c5 ) );


Multiplexor multiplexor ( .a( c5 ), .b( c3 ), .selector( MemToReg ), .salida( s_mux_final ) );


assign tr_salida_final = s_mux_final;


// mux normal a -- 1    b --- 0

endmodule