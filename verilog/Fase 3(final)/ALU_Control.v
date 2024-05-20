module ALU_Control( input [5:0] entradaFunct, input [1:0] ALUOp, output reg [3:0] salida );

always @(*) begin

    case(ALUOp)

        2'b10: begin  //Instruccion tipo R
            case (entradaFunct)
                6'b100000: salida = 4'b0010; //Suma
                6'b100010: salida = 4'b0110; //Resta
                6'b100100: salida = 4'b0000; //AND
                6'b100101: salida = 4'b0001; //OR
                6'b101010: salida = 4'b0111; //Set les than
            endcase
		/*2'b00: begin //Instrucciones tipo I
			case
		
			endcase
		2'b01: begin //Instrucciones tipo J
			
			
			end*/
			
        end

    endcase

end

endmodule
