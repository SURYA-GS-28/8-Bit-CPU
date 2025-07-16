module RegisterFile (
    input wire clk,                  // Clock signal
    input wire write_en,            // Write enable signal
    input wire [2:0] wr_addr,       // Write address(R0-R7)
    input wire [7:0] wr_data,       // Data to write
    input wire [2:0] rd_addr1,     // Read address 1
    input wire [2:0] rd_addr2,      // Read address 2
    output wire  [7:0] rd_data1,     // Output data 1
    output  wire [7:0] rd_data2      // Output data 2
);
    reg [7:0] registers [0:7];
    //Combinational
    assign rd_data1 = registers[rd_addr1];
    assign rd_data2 = registers[rd_addr2];
//Sequential depends on W_En signal
    always @(posedge clk) begin
        if (write_en) begin
            registers[wr_addr] <= wr_data;
        end
    end
endmodule
