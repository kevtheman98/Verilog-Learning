module traffic_light(
            input logic clk,
            input logic reset,
            output logic [1:0] light
);

typedef enum logic [1:0] {
    red, // red
    green, // green
    yellow  // yellow
} statetype;

statetype state, nextstate;

//state reg
always_ff @(posedge clk) 
    if(reset) state <= red;
    else      state <= nextstate;

// next state logic
always_comb
    begin
        nextstate = red; // make nextstate initially red
        case(state)
            red: nextstate = green;
            green: nextstate = yellow;
            yellow: nextstate = red;
            default: nextstate = red;
        endcase
    end

assign light = state;
endmodule



