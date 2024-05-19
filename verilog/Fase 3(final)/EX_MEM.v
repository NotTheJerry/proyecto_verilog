module EX_MEM(
    input clk, reset,
    input [31:0] alu_result_in, reg2_in, pc_branch_in,
    input [4:0] rd_in,
    input zero_in, branch_in, mem_read_in, mem_write_in, reg_write_in, mem_to_reg_in,
    output reg [31:0] alu_result_out, reg2_out, pc_branch_out,
    output reg [4:0] rd_out,
    output reg zero_out, branch_out, mem_read_out, mem_write_out, reg_write_out, mem_to_reg_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            alu_result_out <= 32'b0;
            reg2_out <= 32'b0;
            pc_branch_out <= 32'b0;
            rd_out <= 5'b0;
            zero_out <= 0;
            branch_out <= 0;
            mem_read_out <= 0;
            mem_write_out <= 0;
            reg_write_out <= 0;
            mem_to_reg_out <= 0;
        end else begin
            alu_result_out <= alu_result_in;
            reg2_out <= reg2_in;
            pc_branch_out <= pc_branch_in;
            rd_out <= rd_in;
            zero_out <= zero_in;
            branch_out <= branch_in;
            mem_read_out <= mem_read_in;
            mem_write_out <= mem_write_in;
            reg_write_out <= reg_write_in;
            mem_to_reg_out <= mem_to_reg_in;
        end
    end
endmodule

