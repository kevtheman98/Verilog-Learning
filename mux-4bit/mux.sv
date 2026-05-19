module mux4 (input logic a, b, c, d,
            input logic [1:0] s,
            output logic y);
    always_comb 
        begin
            case (s)
                2'b00 : y = a;
                2'b01 : y = b;
                2'b10 : y = c;
                2'b11 : y = d;
                default : y = 1'bx;
            endcase
        end
endmodule

module mux8(input logic a, b, c, d, e, f, g, h,

    input logic [2:0] sIn,
    output logic y);

    logic y1, y2;

    mux4 mux4_1 (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s(sIn[1:0]),
        .y(y1)
    );

    mux4 mux4_2 (
        .a(e),
        .b(f),
        .c(g),
        .d(h),
        .s(sIn[1:0]),
        .y(y2)
    );

    assign y = sIn[2] ? y2 : y1; // pick mux 1 or 2 based on most sig bit
    
endmodule
