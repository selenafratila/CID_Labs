`timescale 1ns / 1ps

module TEST_TOP( );
         
logic [3:0] sa0,sb0,sa1,sb1;
logic [3:0] ss0,ss1;
logic ss2;
    
TOP dut( .a0(sa0),
         .b0(sb0),
         .a1(sa1),
         .b1(sb1),
         .s0(ss0),
         .s1(ss1),
         .s2(ss2) );

initial begin 

sa1=7;
sa0=5;
sb1=2;
sb0=8;
 //  75+20=103
#50
sa1=1;
sa0=0;
sb1=0;
sb0=4; // 10+4=14

#50
sa1=6;
sa0=5;
sb1=2;
sb0=9; // 65+29=94

#50
sa1=5;
sa0=2;
sb1=8;
sb0=3; // 62+83=135

#50
sa1=5;
sa0=6;
sb1=8;
sb0=7; // 65+29=143



#50 $stop; 


end
         
endmodule
