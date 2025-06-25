`timescale 1ns / 1ps

module tb_fir_filter_40;

    reg clk = 0;
    wire [7:0] din;  
    wire [31:0] dout;

    fsm_fir_filter_40 uut ( .clk(clk), .din(din), .dout(dout) );

    always #15 clk = ~clk;

    initial 
        begin
            #5000;  
            $finish;
        end

endmodule