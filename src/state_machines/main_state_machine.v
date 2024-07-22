module main_state_machine(
    input clock,
    input time_over,
    input [1:0] irrigation,
    output [1:0] state
);

wire E, A, G, L;
wire As, Gs, Sp, No;

wire [1:0] D;
wire [12:0] aux;

decoder_2_4(irrigation, No, As, Gs, Sp);
decoder_2_4(state, E, A, G, L);

// As + Sp
or(aux[0], As, Sp);

// E (As + Sp)
and(aux[1], E, aux[0]);

// E (As + Sp) + A + G
or(aux[2], aux[1], A, G);

// As + Sp + No
or(aux[3], aux[0], No);

// A(As + Sp + No)
and(aux[4], A, aux[3]);

// A(As + Sp + No) + L
or(aux[5], aux[4], L);

// T' [A(As + Sp + No) + L]
and(aux[6], !time_over, aux[5]);

// T [E (As + Sp) + A + G]
and(aux[7], time_over, aux[2]);

// A + L
or(aux[8], A, L);

// E · Go
and(aux[9], E, Go);

// E · Go + A
or(aux[10], aux[9], A);

// T(E · Go + A)
and(aux[11], time_over, aux[10]);

// T' (A + L)
and(aux[12], !time_over, aux[8]);

// D0 = T [E (As + Sp) + A + G] + T' [A(As + Sp + No) + L]
or(D[0], aux[7], aux[6]);

// D1 = T(E · Go + A) + T' (A + L)
or(D[1] , aux[11], aux[12]);

flip_flop_D(clock, D[0], 0, 0, state[0]);
flip_flop_D(clock, D[1], 0, 0, state[1]);

endmodule
