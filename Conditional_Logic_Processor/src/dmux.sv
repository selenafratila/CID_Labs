`timescale 1ns / 1ps


module dmux(
    input logic en,
    input logic sel0,sel1,
    output logic out3, out2,out1,out0 );
    
    logic [1:0] sel;
    assign sel={sel1,sel0};
    always_comb
    if(en==1)
        case(sel)
            2'b00: begin
                    out0=1'b1;
                    out1=1'b0;
                    out2=1'b0;
                    out3=1'b0;
                    end
            2'b01: begin
                    out0=1'b0;
                    out1=1'b1;
                    out2=1'b0;
                    out3=1'b0;
                    end 
            2'b10: begin
                    out0=1'b0;
                    out1=1'b0;
                    out2=1'b1;
                    out3=1'b0;
                    end
            2'b11: begin
                    out0=1'b0;
                    out1=1'b0;
                    out2=1'b0;
                    out3=1'b1;
                    end
            default:  begin
                    out0=1'b1;
                    out1=1'b0;
                    out2=1'b0;
                    out3=1'b0;
                    end
                    
        endcase
        else begin
             out0=0;
             out1=0;
             out2=0;
             out3=0;
             end
  
endmodule
