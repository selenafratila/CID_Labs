`timescale 1ns / 1ps
module comparator(
    input logic [2:0] in0,in1,
    output logic egal );
always_comb
if (in1==in0 )
egal=1'b1;
else egal=1'b0;
endmodule
