`timescale 1ns / 1ps

module cmp(
       input logic [4:0] a,
       output logic gt );
logic w1,w2;

and p1(w1, a[3], a[2]);
and p2(w2, a[3], a[1]);
or p3(gt, a[4],w1,w2);
   
endmodule
