`timescale 1ns / 1ps


module sum(
input logic [3:0] in1,in2,
input logic en,
output logic [3:0] out,
output logic cout);

always_comb
if(en==1)
{cout,out}=in1+in2; 
else {cout,out}=5'b00000;   
endmodule
