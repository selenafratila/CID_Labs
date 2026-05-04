`timescale 1ns / 1ps

module top_calculator (
    input  logic [3:0] sw_a,    // intrarea A (4 switch-uri)
    input  logic [3:0] sw_b,    // intrarea B (4 switch-uri)
    output logic [6:0] segments, // iesirea catre segmentele a-g
    output logic [3:0] anodes    // activarea celor 4 cifre
);

   
    logic [4:0] fir_suma;

    
    sumator_4biti inst_sum (
        .a(sw_a),
        .b(sw_b),
        .sum(fir_suma)
    );

    // Instan?iere Afi?or
    afisor_7seg inst_disp (
        .valoare(fir_suma),
        .segmente(segments),
        .anozi(anodes)
    );

endmodule
