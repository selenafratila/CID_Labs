`timescale 1ns / 1ps

module sum4( 
        input logic [3:0] a,b,
        input logic c,
        output logic [4:0] s );
assign s=a+b+c;  
endmodule
