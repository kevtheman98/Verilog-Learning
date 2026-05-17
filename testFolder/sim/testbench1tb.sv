module testbench1tb;
    logic clk, reset;
    logic [3:0] a;
    logic y, yexpected;
    logic [31:0] vectornum, errors; // make two variables each has 32 bits
    logic [3:0] testvectors[10000:0]; // make 10000 arrays of 4 bit siginals

    //instantiate device under test named ports .portname(siginal name)
    testGate dut (.a(a),
                  .y(y));
    
    // generate infinite clock with 5 delay
    always 
        begin
            clk = 1;
            #5;
            clk = 0;
            #5;
        end
    
    // at start of test, load vectors and reset 
    initial
        begin
            $readmemb("testVect.tv", testvectors); // reads line by line in test Vect into testvectors array
            vectornum = 0;
            errors = 0;
            reset = 1; 
            #27;
            reset = 0;
        end
    
    //apply test vectors on rising edeg of clk
    always@(posedge clk)
        begin
            #1;
            for (int i = 0; i < 16; i++) 
                begin
                    {a, yexpected} = testvectors[i];
                    #10;

                    if(y !== yexpected) 
                        begin
                            $display("ERROR a = %b y = %b expected = %b", a, y, yexpected);
                        end
                    
                end
            $display("Done. %d test completed with %d errors", vectornum, errors);
            $finish;
        end
        
    endmodule