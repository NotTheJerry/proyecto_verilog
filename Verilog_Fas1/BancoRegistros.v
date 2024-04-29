module BancoRegistros( input [4:0] ra1, input [4:0] ra2, input [31:0] di, input [4:0] dir, input ena,
						output reg[31:0]dr1, output reg[31:0]dr2 );

reg [31:0] banco [31:0];


initial begin
    $readmemb("memoria.txt",banco);
end

always @(*) begin

    case(ena)
        1'b1: begin
            banco[dir] = di;
            dr1 = banco[ra1];
            dr2 = banco[ra2];
        end
        1'b0: begin
            dr1 = banco[ra1];
            dr2 = banco[ra2];
        end
    endcase

    // if(ena) begin
    // banco[dir] = di;
    // end
    // dr1 = banco[ra1];
    // dr2 = banco[ra2];

end

endmodule