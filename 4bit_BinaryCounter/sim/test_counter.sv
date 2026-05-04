`timescale 1ns / 1ps


module test_numarator( );
 logic s_ck, s_reset, s_en;
 logic [3:0] s_out_num;
 
 Numarator dut( .ck(s_ck),
                .reset(s_reset),
                .en(s_en),
                .out_num(s_out_num) );

initial 
 begin
 s_ck=0;
 forever begin 
            #10 s_ck=~s_ck;
         end
 end

initial 
 begin
 s_reset=0;
 s_en=1;
 #45 s_reset=1;
 #40 s_reset=0;
 #380 s_en=0;
#50 $stop;
 end

endmodule
