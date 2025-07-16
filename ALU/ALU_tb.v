module ALU_tb;
    reg [7:0]a;
    reg [7:0]b;
    reg [1:0]s;
    wire [7:0]y;
    wire overflow;
    wire borrowflag;
    ALU alut(.r0(a),.r1(b),.r2(y),.sel(s),.overflow(overflow),.borrowflag(borrowflag));
    initial begin
        $dumpfile("ALU.vcd");
        $dumpvars(0,ALU_tb);
        $display("       decimal value 106 is stored in reg. r0 and 226 in reg r1.. AND overflow and borrowFlag are FLAGS");
        $monitor($time," r0 =%b , r1= %b , r2= %b , overFlow = %b , BorrowFlag= %b",a,b,y,overflow,borrowflag);
        a=11100010;b=10011101;
        s=2'b00; #10;
        s=2'b01; #10;
        s=2'b10; #10;
        s=2'b11; #10;
        $finish;
    end
endmodule