`timescale 1ns / 1ps

module mux(
        input logic [3:0] i0,i1,
        input logic sel,
        output logic [3:0] y );
always_comb
case(sel)
1'b0: y=i0;
1'b1: y=i1;
default: y=i0;
endcase
endmodule
