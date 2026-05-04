`timescale 1ns / 1ps

module test_TOP( );

    logic [3:0] sA, sB;
    logic sEN;
    logic [1:0] sSELd, sSELm;
    logic  sOVERFLOW;
    logic [3:0] sOUT;

    TOP dut (
        .A(sA), 
        .B(sB),
        .EN(sEN), 
        .SELd(sSELd), 
        .SELm(sSELm), 
        .OVERFLOW(sOVERFLOW), 
        .OUT(sOUT)
    );

    initial begin
       sA=4'b1100; // 12 in zecimal
       sB=4'b0111;//7
        sEN = 1'b1;  
        sSELd = 2'b00;
        sSELm = 2'b00; 
        //12+7= 19 => 1 0011
        
        #20;
        
        sSELd=2'b01; 
        sSELm=2'b01;
        //12-7=5 =>0101
        
        #20 
       
        sSELd=2'b10; 
        sSELm=2'b10;
        //and 0100
        
        #20
        
         sSELd=2'b11; 
        sSELm=2'b11;
        // xor 1011
        #20 
        
        sEN = 1'b0;
        #20;

       
   
        $stop; 
end

endmodule

