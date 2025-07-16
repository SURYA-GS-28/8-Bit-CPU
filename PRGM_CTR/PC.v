module program_counter (
    input clk, rst,
    input [7:0] pc_next,
    input pc_write,
    output reg [7:0] pc
);
always @(posedge clk or posedge rst) begin
    if (rst)
        pc <= 0;
    else if (pc_write)
        pc <= pc_next;
    else
        pc <= pc + 1;
    end
endmodule
