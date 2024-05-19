module ID_EX(
    input clk, reset,
    input [31:0] pc_in, reg1_in, reg2_in, sign_ext_in,
    input [4:0] rs_in, rt_in, rd_in,
    input [1:0] alu_op_in,
    input reg_dst_in, alu_src_in, mem_to_reg_in, reg_write_in, mem_read_in, mem_write_in, branch_in,
    output reg [31:0] pc_out, reg1_out, reg2_out, sign_ext_out,
    output reg [4:0] rs_out, rt_out, rd_out,
    output reg [1:0] alu_op_out,
    output reg reg_dst_out, alu_src_out, mem_to_reg_out, reg_write_out, mem_read_out, mem_write_out, branch_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc_out <= 32'b0;
            reg1_out <= 32'b0;
            reg2_out <= 32'b0;
            sign_ext_out <= 32'b0;
            rs_out <= 5'b0;
            rt_out <= 5'b0;
            rd_out <= 5'b0;
            alu_op_out <= 2'b0;
            reg_dst_out <= 0;
            alu_src_out <= 0;
            mem_to_reg_out <= 0;
            reg_write_out <= 0;
            mem_read_out <= 0;
            mem_write_out <= 0;
            branch_out <= 0;
        end else begin
            pc_out <= pc_in;
            reg1_out <= reg1_in;
            reg2_out <= reg2_in;
            sign_ext_out <= sign_ext_in;
            rs_out <= rs_in;
            rt_out <= rt_in;
            rd_out <= rd_in;
            alu_op_out <= alu_op_in;
            reg_dst_out <= reg_dst_in;
            alu_src_out <= alu_src_in;
            mem_to_reg_out <= mem_to_reg_in;
            reg_write_out <= reg_write_in;
            mem_read_out <= mem_read_in;
            mem_write_out <= mem_write_in;
            branch_out <= branch_in;
        end
    end
endmodule

