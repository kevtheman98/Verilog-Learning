module clock_div 
    #(parameter N = 50) // one program cycle is N cycle of clk
    (
            input logic clk,
            input logic reset,
            output logic tick
    );

logic [31:0] counter;

always_ff @(posedge clk) 
    if(reset) 
        begin
            tick <= 0;
            counter <= 0;
        end
    else
        begin
            if(counter == N - 1)
            begin
                tick <= 1;
                counter <= 0;
            end
            
        else
            begin
                tick <= 0;
                counter <= counter + 1;
            end

        end
endmodule

        
            


    









