`timescale 1ns / 1ps

module TOP(
        input logic [3:0] a0,b0,a1,b1,
        output logic [3:0] s0,s1,
        output logic s2 );
logic w;       
DIGIT_SUM circ0 ( .a(a0),
                  .b(b0),
                  .ci(0),
                  .digit(s0),
                  .co(w) );
DIGIT_SUM circ1 ( .a(a1),
                  .b(b1),
                  .ci(w),
                  .digit(s1),
                  .co(s2) );
                            
endmodule
