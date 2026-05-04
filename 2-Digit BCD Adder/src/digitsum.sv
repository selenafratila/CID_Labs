`timescale 1ns / 1ps

module DIGIT_SUM(
        input logic [3:0] a,b,
        input logic ci,
        output logic co,
        output logic [3:0] digit );
logic [4:0] w1;
logic [3:0] w2 ;
logic w3;
sum4 SUM4_1 ( .a(a),
              .b(b),
              .c(ci),
              .s(w1) );
sum4 SUM4_2 ( .a(w1[3:0]),
              .b(6),
              .c(0),
              .s(w2) );
cmp CMP (   .a(w1),
            .gt(w3) );
mux MUX( .i0(w1[3:0]),
         .i1(w2),
         .sel(w3),
         .y(digit) ); 
assign co=w3;                           
endmodule
