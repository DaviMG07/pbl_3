// OK
module level_to_pulse(
	input clock,
	input level,
	output pulse
);

wire D, aux;

wire [1:0] state;

nand(aux, level, !state[0], !state[1]);
and(D, aux, level);

flip_flop_D(clock, level, , , state[0]);
flip_flop_D(clock, D, , , state[1]);

and(pulse, state[0], !state[1]);

endmodule
