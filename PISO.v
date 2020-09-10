//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// File: Parallel In Serial Out.v
// Purpose: Feed the inputs parallelly in 1 clock, when EN is high, 
// Concept: Design a 16 bit deep FF based parallel in serial out, use the asynchronous negative edge to reset
//
// Owner: Rohit Kumar Singh
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`timescale 1ns/1ns

module PISO (OUT, CLK, RST, EN, IN);
input wire [15:0]IN;
output reg OUT;
input CLK;
input RST;
input EN;
reg [15:0] temp;

always@(posedge CLK or negedge RST)
begin
temp<=16'b0;
if (!RST)
begin
OUT<=1'b0;
end
else
begin
if(EN)
begin
temp<=IN;
OUT<=0;
end
else 
begin
OUT<=temp[15];
temp<=temp<<1;
end
end
end

endmodule
