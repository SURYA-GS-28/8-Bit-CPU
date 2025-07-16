module instruction_memory (
    input  [7:0] addr,
    output reg [15:0] instr
);

    reg [15:0] memory [0:255];

    initial begin
        // Example: ADD R1, R2, R3
        memory[0] = 16'b0000000100100011;
        memory[1] = 16'b0001010001010110; // SUB R4, R5, R6
        memory[2] = 16'b0111010100001001; // LI R5, 9
        memory[3] = 16'b0101001100010100; // LOAD R3, R1, 4
        memory[4] = 16'b0110001100101000; // STORE R3, R2, 8
        memory[5] = 16'b1111000000000000; // NOP
    end

    always @(*) begin
        instr = memory[addr];
    end
endmodule
