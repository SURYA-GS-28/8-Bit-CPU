module ALU(
    input [7:0] r0,
    input [7:0] r1,
    input [1:0] sel,
    output reg [7:0] r2,
	output reg overflow,borrowflag
);
	reg [8:0] temp;
always @(*) begin
	overflow=0;
	borrowflag=0;
    case (sel)
        2'b00: begin
		temp = r0 + r1;
		r2=temp[7:0];
		if(temp[8]==1)
			overflow=1;
		end
        2'b01: begin
			temp = r0 - r1;
			r2=temp[7:0];
			if(r0<r1)
				borrowflag=1;
		end
        2'b10: r2 = r0 & r1;
        2'b11: r2 = r0 | r1;
        default: r2 = 8'b00000000;
    endcase
end
endmodule
