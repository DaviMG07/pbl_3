module water_box_group(
    input A_Hz,
    input G_Hz,
    input E_Hz,
    input [1:0] state,
    output clock,
    output direction,
    output [2:0] count,
    output [1:0] water_box
);

// OK
dual_counter_0_7(
    !clock, 
    direction, 
    preset, 
    reset, 
    count
);

// OK
mux_4_2_1(
    G_Hz, 
    G_Hz, 
    A_Hz, 
    E_Hz, 
    state, 
    clock
);

and(direction, !state[1], !state[0]);

// OK
encoder_water_box(
    count, 
    water_box
);

endmodule
