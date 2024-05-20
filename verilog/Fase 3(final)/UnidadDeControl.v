module UnidadDeControl( input [5:0] op,
output reg RegDst, output reg Branch, output reg MemToRead,
output reg MemToReg, output reg MemToWrite, output reg ALUSrc, 
output reg RegWrite, output reg Jump, output reg [1:0] AluOp );

always @(op) begin

    case(op)

    6'b000000: begin  //Instrucciones tipo R
        RegDst = 1'b0;  
        Branch = 1'b0;  
        MemToRead = 1'b0;
        MemToReg = 1'b0;
        MemToWrite = 1'b1;
        ALUSrc = 1'b0; 
        RegWrite = 1'b1;
        AluOp = 2'b10;
	end
		
	6'b100011: begin  //Instrucciones tipo I
		Jump = 1'b0;  //lw
		RegDst = 1'b0;  
        Branch = 1'b0;  
        MemToRead = 1'b1;
        MemToReg = 1'b1;
        MemToRead = 1'b1;
        MemToWrite = 1'b0;
        ALUSrc = 1'b1; 
        RegWrite = 1'b1;
        AluOp = 2'b00;
	end
	6'b100011: begin  //Instrucciones tipo I
						//sw
		RegDst = 1'b0;  
        Branch = 1'b0;  
        MemToRead = 1'b1;
        MemToReg = 1'b1;
        MemToRead = 1'b1;
		
        ALUSrc = 1'b1; 
        RegWrite = 1'b0;
        AluOp = 2'b00;
	end
	6'b001000: begin
		Jump = 1'b0;	//addi
	end
	6'b001100: begin
		Jump = 1'b0;	//andi
	end
	6'b000100: begin
		Jump = 1'b0;	//beq
    end
	6'b000100: begin
		Jump = 1'b0;	//slti
	
    end
	6'b000100: begin
		Jump = 1'b0;	//ori
	
    end
	
	6'b000010: begin	//Instrucciones tipo J
						// j
	end
	

    endcase

end

endmodule