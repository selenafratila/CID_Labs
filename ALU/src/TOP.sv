`timescale 1ns / 1ps


module TOP(
input logic [3:0] A,B,
input logic EN,
input logic [1:0] SELd,SELm,
output logic OVERFLOW,
output logic [3:0] OUT );

 logic [3:0] w0,w1,w2,w3,w;
dmux DMUX(  .en(EN),
            .sel(SELd),
            .out(w) );
sum SUM( .in1(A),
         .in2(B),
         .en(w[0]) ,
         .out(w0),
         .cout(OVERFLOW) );
dif DIF( .in1(A),
         .in2(B),
         .en(w[1]),
         .out(w1)   );
andd ANDD( .in1(A),
           .in2(B),
           .en(w[2]),
           .out(w2)   ); 
xorl XORL( .in1(A),
           .in2(B),
           .en(w[3]),
           .out(w3) );
mux MUX( .in0(w0),
         .in1(w1),
         .in2(w2),
         .in3(w3),
         .sel(SELm),
         .out(OUT) );    
endmodule
