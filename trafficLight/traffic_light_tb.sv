module traffic_light_tb;
    logic clk;
    logic reset;
    logic [1:0] light;
    parameter maxcycles = 10;
    int counter = 0;


traffic_light traffic_light_instance (
    .clk(clk),
    .reset(reset),
    .light(light)
);

//gen clock

initial clk = 0;
always #5 clk = ~clk;

// start test reset initially
initial 
    begin
        reset = 1;
        @(posedge clk);
        @(posedge clk);
        @(negedge clk); // do at negclk so no race with dut
        reset = 0;
    
    end

//test logic
always@(posedge clk)
    begin
        if(counter < maxcycles)
            begin
                $display("The light is, %b" , light);        
                counter <= counter + 1; 

            end
        else
            begin
                $display("Done. %d test completed", counter);
                $finish;
            end
        
        
    end


    
endmodule
