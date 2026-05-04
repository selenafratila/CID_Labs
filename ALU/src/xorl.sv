`timescale 1ns / 1ps

module xorl(
input logic [3:0] in1,in2,
input logic en,
output logic [3:0] out );

always_comb
if(en==1)  
out=in1^in2;
else out=4'b0000;
endmodule
