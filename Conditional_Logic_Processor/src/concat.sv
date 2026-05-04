`timescale 1ns / 1ps

module concatenare(
    input logic in3,in2,in1,in0,
    output logic [3:0] out );
    
assign out={in3,in2,in1,in0};
    
endmodule
