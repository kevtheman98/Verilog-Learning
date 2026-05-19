module testbench_mux_tb;
    logic a, b, c, d, e, f, g, h;
    logic y, yexpected;
    logic [2:0] sIn;
    logic [31:0] vectornum, errors;

    mux8 mux8_instance (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h),
        .sIn(sIn),
        .y(y)
    );
    
    initial 
        begin
            vectornum = 0;
            errors = 0;
            // go through each test vector and test all variations
            for (int inputs = 0; inputs < 256; inputs++) 
                begin
                    {a, b, c, d, e, f, g, h} = inputs[7:0];
                    

                    for (int sel = 0; sel < 8; sel++) 
                        begin
                            sIn = sel;
                            case (sel)
                                3'b000 : yexpected = a;
                                3'b001 : yexpected = b;
                                3'b010 : yexpected = c;
                                3'b011 : yexpected = d;
                                3'b100 : yexpected = e;
                                3'b101 : yexpected = f;
                                3'b110 : yexpected = g;
                                3'b111 : yexpected = h;
                                default : yexpected = 1'bx;
                            endcase
                            
                            
                            vectornum++;
                            #1;
                            if(y !== yexpected) 
                                begin
                                    $display("Error sel = %b y = %b expected %b", sIn, y, yexpected);
                                    errors++;
                                end
                        end
                end
            $display("Done. %d test completed with %d errors", vectornum, errors);
            
        end

endmodule