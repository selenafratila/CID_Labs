`timescale 1ns / 1ps

module test_ram( );

 logic [7:0] sdata_in;
 logic [6:0] sadr;
 logic sCK,swe;
logic [7:0] sdata_out;

ram dut ( .data_in(sdata_in),
          .adr(sadr),
          .CK(sCK),
          .we(swe),
          .data_out(sdata_out));

initial  begin
    sCK=0;
    forever
         begin
         #10
         sCK=(~sCK);
         end
   end

initial begin 

sadr=0;
sdata_in=0;
swe=0;

#25
sadr=3;
sdata_in=13;
swe=1;
#10 swe=0;

#30
sadr=4;
sdata_in=14;
swe=1;
#10 swe=0;

#30
sadr=6;
sdata_in=16;
swe=1;
#10 swe=0;

#100
 sadr=4;
 #25
 sadr=6;
 #25
 sadr=3;
 #40
 $stop;
    end        
endmodule
