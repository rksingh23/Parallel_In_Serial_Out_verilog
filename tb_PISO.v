//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// File: Parallel In Serial Out.v
// Purpose: Feed the inputs parallelly in 1 clock, when EN is high, 
// Concept: Design a 16 bit deep FF based parallel in serial out, use the asynchronous negative edge to reset
//
// Owner: Rohit Kumar Singh
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`timescale 1ns/1ns

module PISO_tb();

reg [15:0]IN;
wire OUT;
reg CLK,RST,EN;

PISO dut (.OUT(OUT),.CLK(CLK),.RST(RST),.EN(EN),.IN(IN));


always #2 CLK=~CLK;

initial 
begin
CLK<=0;
EN<=0;
RST=0;
#2
RST<=1;
IN<=16'b0;
#6;
RST<=0;
#5
RST<=1;

#2;
EN<=1;

IN<=16'b1111111111111111;
#4;
EN<=0;
#70;
EN<=1;
#5;
IN<=16'b1010111111110101;
#4;
EN<=0;
#70;
EN<=0;
IN<=16'b0000111111110101;


end


initial 
begin
$monitor("The output of the Serial Out at time %0t is %b ",$time,OUT);
end

endmodule
