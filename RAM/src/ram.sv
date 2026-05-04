`timescale 1ns / 1ps


module ram(
        input logic [7:0] data_in, 
        input logic [6:0] adr,
        input logic CK,we,
        output logic [7:0] data_out);

//declararea memoriei
logic [7:0] ram[0:127];

// scrierea sincrona posedge ck
always_ff@(posedge CK)
if(we) ram[adr]<=data_in;

//citirea asincrona
    //assign data_out=ram[adr];
   
//citire sincrona
always_ff@(posedge CK)
data_out<=ram[adr];


endmodule
