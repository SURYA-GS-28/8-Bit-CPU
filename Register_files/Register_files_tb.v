`timescale 1ns/1ps
module RegisterFile_tb;
    reg clk;
    reg write_en;
    reg [2:0] wr_addr;
    reg [7:0] wr_data;
    reg [2:0] rd_addr1;
    reg [2:0] rd_addr2;
    reg [7:0] rd_data1;
    reg [7:0] rd_data2;
    RegisterFile uut (
        .clk(clk),
        .write_en(write_en),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .rd_addr1(rd_addr1),
        .rd_addr2(rd_addr2),
        .rd_data1(rd_data1),
        .rd_data2(rd_data2)
    );
    // Clock generation
    always #5 clk = ~clk; // 10ns period
    initial begin
        $dumpfile("RegisterFile.vcd");
        $dumpvars(0, RegisterFile_tb);
        clk = 0;
        write_en = 0;
        wr_addr = 0;
        wr_data = 0;
        rd_addr1 = 0;
        rd_addr2 = 0;
        #10;
        write_en = 1;
        #10;
        wr_addr = 3'b010;     // R2
        wr_data = 8'd42;
        #10;
        // Write 100 to R4
        wr_addr = 3'b100;     // R4
        wr_data = 8'd100;
        #10;
        // Read R2 and R4
        rd_addr1 = 3'b010;    
        rd_addr2 = 3'b100; 
        #5;
        //Disable Write enable wire
        write_en = 0;   
        #10;
        rd_addr2 = 3'b001;    // R1
        #10;

        $finish;
    end

endmodule
