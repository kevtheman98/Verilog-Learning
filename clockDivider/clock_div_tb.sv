module clock_div_tb;
    logic clk;
    logic reset;
    logic tick;
    parameter N = 50;
    

    clock_div #(
        .N(N)
    ) clock_div_instance (
        .clk(clk),
        .reset(reset),
        .tick(tick)
    );

    initial clk = 0;
    always #5 clk = ~clk;
    
    initial 
        begin
            reset = 1;
            repeat(2) @(posedge clk);
            reset = 0;
            repeat(3) @(posedge tick);
            $finish;
        end
    
    always @(posedge tick) 
        begin
            $display("Tick occured");
        end
    
endmodule