module flipflop (input logic data, clk, reset,
                 output logic y);
    
    always_ff@(posedge clk)
        if(reset)
            y <= 1'b0;
        else
            y <= data;

endmodule
    