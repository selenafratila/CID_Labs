`timescale 1ns / 1ps

module afisor_7seg (
    input  logic [4:0] valoare, 
    output logic [6:0] segmente, 
    output logic [3:0] anozi     
);
    always_comb begin
        anozi = 4'b1110; 
        case (valoare % 10)
            4'd0: segmente = 7'b1000000; // 0
            4'd1: segmente = 7'b1111001; // 1
            4'd2: segmente = 7'b0100100; // 2
            4'd3: segmente = 7'b0110000; // 3
            4'd4: segmente = 7'b0011001; // 4
            4'd5: segmente = 7'b0010010; // 5
            4'd6: segmente = 7'b0000010; // 6
            4'd7: segmente = 7'b1111000; // 7
            4'd8: segmente = 7'b0000000; // 8
            4'd9: segmente = 7'b0010000; // 9
            default: segmente = 7'b1111111;
        endcase
    end
endmodule
