module CPU_top (
    input clk,
    input rst
);

    // ========== Program Counter ==========
    reg [7:0] pc;

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 0;
        else
            pc <= pc + 1;
    end

    // ========== Instruction Memory ==========
    wire [15:0] instr;

    instruction_memory imem (
        .addr(pc),
        .instr(instr)
    );

    // ========== Instruction Fields ==========
    wire [3:0] opcode = instr[15:12];
    wire [2:0] rd     = instr[11:9];
    wire [2:0] rs1    = instr[8:6];
    wire [2:0] rs2    = instr[5:3];
    wire [2:0] imm    = instr[2:0];  // optional

    // ========== Control Unit ==========
    wire [1:0] alu_op;
    wire reg_write;

    control_unit CU (
        .opcode(opcode),
        .alu_op(alu_op),
        .reg_write(reg_write)
    );

    // ========== Register File ==========
    wire [7:0] rs1_data, rs2_data, write_data;

    RegisterFile rf (
        .clk(clk),
        .write_en(reg_write),
        .wr_addr(rd),
        .wr_data(write_data),
        .rd_addr1(rs1),
        .rd_addr2(rs2),
        .rd_data1(rs1_data),
        .rd_data2(rs2_data)
    );

    // ========== ALU ==========
    wire [7:0] alu_result;
    wire ov, borrow;

    ALU alu_unit (
        .r0(rs1_data),
        .r1(rs2_data),
        .sel(alu_op),
        .r2(alu_result),
        .overflow(ov),
        .borrowflag(borrow)
    );

    assign write_data = alu_result;

endmodule
