`timescale 1ns / 1ps

module mux(
    input logic [3:0] in1,in0,
    input logic en,
    output logic [3:0] outmax  );
always_comb
if(en==1)
outmax=in1;
else outmax=in0;  
endmodule
