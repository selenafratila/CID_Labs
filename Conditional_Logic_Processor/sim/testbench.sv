`timescale 1ns / 1ps

module testbench( );

 logic [2:0] sA,sB;
  logic sCF;
  logic [3:0] sOUT_dmux, sOUT ;

TOP dut (.A(sA),
         .B(sB),
         .OUT_dmux(sOUT_dmux),
         .OUT(sOUT),
         .CF(sCF) );
initial
 begin
 sA=7;
 sB=7; //egale impare cu bitul 2=1
 #50
 sA=2;
 sB=2; //egale pare cu bitul 2=0
 
 #50 ;
 sA=5;
 sB=4; // diferite A impar, Bpar; fara trecere peste ordin
 
 #50
 sA=4;
 sB=5 ; // diferite A par Bimpar fara trecere peste ordin
 
 #50
 sA=7;
 sB=6 ; // diferite A impar B par cu trecere peste ordin
 
 #50;
 sA=6;
 sB=7; //diferite A par, B impar cu trecere peste ordin
 
 #50
 $stop;
 end  
endmodule
