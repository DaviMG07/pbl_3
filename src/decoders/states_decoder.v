module states_decoder(
    input [1:0] state,
    output [7:0] segments
);

wire E, A, G, L;

decoder_2_4(state, E, A, G, L);

assign segments[0] = L;

or(segments[1], G, L, E);

or(segments[2], L, E);

assign segments[3] = A;

assign segments[4] = 0;

assign segments[5] = 0;

or(segments[6], G, L);

endmodule
