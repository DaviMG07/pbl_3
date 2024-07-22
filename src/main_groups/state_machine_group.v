module state_machine_group(
    input _50_MHz,
    input _1_Hz,
    input specific,
    input [1:0] irrigation_data,
    output [1:0] state,
    output [1:0] dozens,
    output [3:0] units,
    output [5:0] preset,
    output [5:0] reset,
    output time_over,
    output pulse
);

// OK
counter_30_0(
    _1_Hz, 
    preset, 
    reset, 
    dozens, 
    units, 
    time_over
);

// OK
gen_preset(
    pulse, 
    state, 
    specific, 
    preset, 
    reset
);

// OK ?
main_state_machine(
    _50_MHz, 
    time_over, 
    irrigation_data, 
    state
);

// OK
level_to_pulse(
    _50_MHz, 
    time_over, 
    pulse
);

endmodule
