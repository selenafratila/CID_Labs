`timescale 1ns / 1ps


module Numarator(
    input logic ck,
    input logic reset,
    input logic en,
    output logic [3:0] out_num );
    
always_ff @(posedge ck)
  if(reset) out_num<=0 ;
            else if(en) out_num <= out_num+1 ;
                    else out_num <= out_num ;
 

endmodule
