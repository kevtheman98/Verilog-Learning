module testbench_flipflop_tb;
    logic clk, reset, data, y;


flipflop dut (
    .data(data),
    .clk(clk),
    .reset(reset),
    .y(y)
);

always 
    begin
        clk = 0;
        #5
        clk = 1;
        #5;
    end

initial 
    begin
        data = 0;
        reset = 1;
        @(posedge clk); // reset two cycles 
        @(posedge clk);
        reset = 0;
        @(posedge clk); // let y settle

        data = 1;
        @(posedge clk);

        if (y !== 1) $display("Fail");

        data = 0;
        @(posedge clk);

        if (y !== 0) $display("Fail");

        data = 1;
        @(posedge clk);

        if (y !== 1) $display("Fail");
        
    end



endmodule
