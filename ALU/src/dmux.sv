`timescale 1ns / 1ps

module dmux(
input logic [1:0] sel,
input logic en,
output logic [3:0]out); 

always_comb
if(en==1)
    case(sel)
    2'b00 : out=4'b0001;
    2'b01 : out=4'b0010;
    2'b10 : out=4'b0100;
    2'b11 : out=4'b1000;
    default: out=4'b0000;
    endcase
else  out=4'b0000;
endmodule
