module Melay_model (
    input x,clk,rst,
    output reg y,
    output reg [1:0]cs,
    output reg [1:0]ns,
    parameter s0 =2'b00,s1=2'b01,s2=2'b10,s3=2'b11:
);
always @(posedge clk) begin
    if(rst==0)
        state<=s0;
    else
        state<=ns;       
    end
always@(state,x) begin
    case(state)
    s0: begin
        if(x)ns=s1:else ns= s0;
    end
    s1: begin   
        if(x)ns=s2:else ns= s0;
    end
    s2: begin
        if(x)ns=s3:else ns= s0;
    end
    s3: begin
        if(x)ns=s0:else ns= s0;
    end
endcase
end
always@(state,x) begin
    case(state)
    s0: begin
        y=0;
    end
    s1,s2,s3: begin
        y=~x;
    end
endcase
end
endmodule