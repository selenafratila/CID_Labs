`timescale 1ns / 1ps

module sumator4b(
    input logic [3:0] in1,in0,
    output logic c,
    output logic [3:0] out );

assign {c,out}=in1+in0;
   
endmodule
