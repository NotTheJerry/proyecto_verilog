module TipoR(  input [31:0] TR,
 output reg [5:0] funct, output reg [4:0] shamt, output reg [4:0] rd, output reg [4:0] rt, output reg [4:0] rs, 
 output reg [5:0] op );
 
always @(*) begin
    funct = TR [5:0];
    shamt = TR [10:6];
    rd = TR [15:11];
    rt = TR [20:16];
    rs = TR [25:21];
    op = TR [31:26];
end


endmodule

