module data_memory (
    input clk,
    input mem_write, mem_read,
    input [7:0] addr,
    input [7:0] write_data,
    output reg [7:0] read_data
);

    reg [7:0] memory [255:0];

    always @(posedge clk) begin
        if (mem_write)
            memory[addr] <= write_data;
    end

    always @(*) begin
        if (mem_read)
            read_data = memory[addr];
        else
            read_data = 8'b0;
    end
endmodule
