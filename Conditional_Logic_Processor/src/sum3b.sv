`timescale 1ns / 1ps

module sumator3b(
        input logic [2:0] in0,in1,
        output logic [3:0] out );

assign out=in0+in1;
   
endmodule
