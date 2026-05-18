module testbench_mux_tb;
    logic a, b, c, d;
    logic y, yexpected;
    logic [1:0] s;
    logic [31:0] vectornum, errors;
    

    mux mux_instance (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s(s),
        .y(y)
    );
    
    initial 
        begin
            vectornum = 0;
            errors = 0;
            // go through each test vector and test all variations
            for (int inputs = 0; inputs < 16; inputs++) 
                begin
                    {a, b, c, d} = inputs[3:0];
                    

                    for (int sel = 0; sel < 4; sel++) 
                        begin
                            s = sel[1:0]; // put each selection in actual circut and test case
                            case (s)
                                2'b00 : yexpected = a;
                                2'b01 : yexpected = b;
                                2'b10 : yexpected = c;
                                2'b11 : yexpected = d;
                                default: yexpected = 1'bx;
                            endcase
                            vectornum++;
                            #1;
                            if(y !== yexpected) 
                                begin
                                    $display("Error sel = %b y = %b expected %b", s, y, yexpected);
                                    errors++;
                                end
                        end

                    

                
                end
            $display("Done. %d test completed with %d errors", vectornum, errors);
            
        end

        
    
        
    
    
    
   
endmodule