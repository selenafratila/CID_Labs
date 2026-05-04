`timescale 1ns / 1ps

module TOP(
    input logic [2:0] A,B,
    output logic CF,
    output logic [3:0] OUT_dmux, OUT );
logic w1,w3;
logic [3:0]w2,w4,w5;

comparator COMPARATOR ( .in1(A),
                        .in0(B),
                        .egal(w1) );
dmux DMUX( .sel0(A[2]),
           .sel1(B[2]),
           .en(w1),
           .out0(OUT_dmux[0]),
           .out1(OUT_dmux[1]),
           .out2(OUT_dmux[2]),
           .out3(OUT_dmux[3]) );
sumator3b SUMATOR3B (.in1(A),
                     .in0(B),
                     .out(w2) );

concatenare CONCATENARE (.in0(0),
                         .in1(1),
                         .in2(1),
                         .in3(w3),
                         .out(w4) );
sumator4b SUMATOR4B (.in0(w4),
                     .in1(w2),
                     .c(CF),
                     .out(w5) ); 
mux MUX(.in0(w5),
        .in1(w2),
        .en(w1),
        .outmax(OUT) );

assign w6=A[0]|B[0];
assign w7=~B[0];
assign w3=w6^w7;                         
    
endmodule
