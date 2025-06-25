`timescale 1ns / 1ps

module fsm_fir_filter_40
(
    input wire clk,
    
    output reg [7:0] din,
    output reg [31:0] dout = 0
);

parameter   PAST = 8'd0,
            TAPS = 8'd1,
            SUM = 8'd2;

reg [7:0] state = PAST;
reg [7:0] i = 0;

reg [7:0]  b  =  8'd100;         // coefficients
reg [15:0] y [0:39];             // taps 
reg [7:0]  x [0:39];             // Past inputs
reg [8:0]  clk_counter = 0;
reg temp = 0;


always @(posedge clk) 
    begin
        clk_counter <= clk_counter + 1;

        if (clk_counter < 40)
            din <= 8'd100;
        else
            din <= 8'd0;

        if (clk_counter == 239)
            clk_counter <= 0;
    end



always @(posedge clk) 
    begin

        case (state)
        
        
            PAST:
                begin
                    if (temp == 0)
                        begin
                            temp <= 1;
                        end
                    
                    else
                        begin
                            x[i] <= din;
                                if(i == 39)
                                    begin
                                        i <= 0;
                                        state <= TAPS;
                                    end
                                else
                                    begin
                                        i <= i + 1;
                                    end
                        end
                end
                
                
            TAPS:
                begin
                    y[i] <= x[i] * b;
                    
                        if( i == 39)
                            begin
                                i <= 0;
                                state <= SUM;
                            end
                        else
                            begin
                                i <= i + 1;
                            end
                end
        
        
            SUM:
                begin
                    dout <= dout + y[i];
                    
                        if( i == 39)
                            begin
                                i <= 0;
                                state <= PAST;
                            end
                        else
                            begin
                                i <= i + 1;
                            end
                end
        endcase
    end
endmodule