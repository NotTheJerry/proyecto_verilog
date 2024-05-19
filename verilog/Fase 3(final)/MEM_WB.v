module MEM_WB(
    input clk, reset,
    input [31:0] mem_read_data_in, alu_result_in,
    input [4:0] rd_in,
    input reg_write_in, mem_to_reg_in,
    output reg [31:0] mem_read_data_out, alu_result_out,
    output reg [4:0] rd_out,
    output reg reg_write_out, mem_to_reg_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            mem_read_data_out <= 32'b0;
            alu_result_out <= 32'b0;
            rd_out <= 5'b0;
            reg_write_out <= 0;
            mem_to_reg_out <= 0;
        end else begin
            mem_read_data_out <= mem_read_data_in;
            alu_result_out <= alu_result_in;
            rd_out <= rd_in;
            reg_write_out <= reg_write_in;
            mem_to_reg_out <= mem_to_reg_in;
        end
    end
endmodule

