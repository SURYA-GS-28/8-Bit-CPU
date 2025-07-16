module control_unit (
    input [3:0] opcode,
    output reg [2:0] alu_op,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg alu_src,
    output reg pc_write
);

    always @(*) begin
        // default values
        alu_op = 3'b000;
        reg_write = 0;
        mem_read = 0;
        mem_write = 0;
        alu_src = 0;
        pc_write = 0;

        case (opcode)
            4'b0000: begin 
                alu_op = 3'b000; 
                reg_write = 1; 
                end // ADD
            4'b0001: begin 
                alu_op = 3'b001;
                reg_write = 1;
                end // SUB
            4'b0010: begin 
                alu_op = 3'b010; 
                reg_write = 1; 
                end // AND
            4'b0011: begin alu_op = 3'b011; reg_write = 1; end // OR
            4'b0100: begin alu_op = 3'b000; reg_write = 1; end // MOV
            4'b0101: begin mem_read = 1; reg_write = 1; alu_src = 1; end // LOAD
            4'b0110: begin mem_write = 1; alu_src = 1; end // STORE
            4'b0111: begin reg_write = 1; alu_src = 1; end // LI
            4'b1000: begin pc_write = 1; end // JMP
            4'b1001: begin alu_op = 3'b001; pc_write = 1; end // BEQ
            default: begin end
        endcase
    end
endmodule
