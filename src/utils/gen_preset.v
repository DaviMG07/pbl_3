// OK
module gen_preset(
    input pulse,
    input [1:0] state,
    input specific,
    output [5:0] preset,
    output [5:0] reset
);

wire [5:0] aux, S;

wire E, A, G, L;
/*
E = 00
A = 01
G = 10
L = 11

| pulse | state | specific | preset |
|   1   |   E   |     -    |   30   |
|   1   |   A   |     0    |   15   |
|   1   |   A   |     1    |   22   |
|   1   |   G   |     0    |   30   |
|   0   |   G   |     1    |    -   |
|   1   |   L   |     -    |    5   |

*/
decoder_2_4(state, E, A, G, L);

// P5 = p [G + sp · A]
// R5 = p [G + sp · A]'
and(aux[0], specific, A);
or(aux[1], aux[0], G);
and(preset[5], aux[1], pulse);

// P4 = p (E + G + sp' · A)
and(aux[2], !specific, A);
or(aux[3], E, G, aux[2]);
and(preset[4], pulse, aux[3]);

// P3 = 0
assign preset[3] = 0;

// P2 = p (L + sp' · A)
or(aux[4], L, aux[2]);
and(preset[2], pulse, aux[4]);

// P1 = p · sp · A
and(preset[1], pulse, aux[0]);

// P0 = P2
assign preset[0] = preset[2];

assign reset[0] = pulse;
assign reset[1] = pulse;
assign reset[2] = pulse;
assign reset[3] = pulse;
assign reset[4] = pulse;
assign reset[5] = pulse;

endmodule
