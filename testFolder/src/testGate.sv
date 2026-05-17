module testGate(input logic [3:0] a, output logic y);
    always_comb
        y = ^a;
      
endmodule
