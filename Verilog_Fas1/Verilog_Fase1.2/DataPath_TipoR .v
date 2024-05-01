module DataPath_TipoR ( input [31:0] Instruccion_TR ,
output [31:0] tr_salida_final,
output tr_zf );

 wire [5:0] funct;
 wire [4:0] shamt;
 wire [4:0] rd;
 wire [4:0] rt;
 wire [4:0] rs;
 wire [5:0] op;

wire MemToReg;
wire MemToWrite;
wire RegWrite;
wire [1:0] AluOpUnidad;


wire [31:0] c2;
wire [31:0] c1;

wire [3:0] c4;

wire [31:0] c3;

wire [31:0] c5;

wire [31:0] salida_multiplexor;



TipoR tipoR ( .TR( Instruccion_TR ),
 .funct( funct ), .shamt( shamt ), .rd( rd ), .rt( rt ),  .rs( rs ), .op( op ) );

UnidadDeControl unidadDeControl ( .op( op ), 
.MemToReg( MemToReg ), .MemToWrite( MemToWrite ), .RegWrite( RegWrite ), .AluOp( AluOpUnidad ) );


BancoRegistros bancoRegistros ( .ra1( rs ), .ra2( rt ), .di( salida_multiplexor ), .dir( rd ), .ena( RegWrite ),
                       .dr1( c2 ), .dr2( c1 ) );


ALU_Control aluControl ( .entradaFunct( funct ), .ALUOp( AluOpUnidad ), .salida( c4 ) ); 

ALU alu ( .op1( c2 ), .op2( c1 ), .sel( c4 ), .res( c3 ), .zf( tr_zf ) );

Memoria memoria ( .dato( c1 ), .direccion( c3 ), .sel( MemToWrite ), .salida( c5 ) );

Multiplexor multiplexor ( .a( c5 ), .b( c3 ), .selector( MemToReg ), .salida( salida_multiplexor ) );

assign tr_salida_final = c2;


endmodule