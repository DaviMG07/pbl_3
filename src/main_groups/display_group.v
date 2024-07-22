module display_group(
    input [1:0] state,
    input [1:0] dozens,
    input [3:0] units,
    input _840_Hz,
    output [3:0] digits,
    output [7:0] segments
);

wire [7:0] seg_dozens, seg_states, seg_units;

driver_display(
    _840_Hz,
    seg_states,
    seg_dozens,
    seg_units,
    ,
    digits,
    segments
);

units_decoder(
    units,
    seg_units
);

states_decoder(
    state,
    seg_states
);

dozens_decoder(
    dozens,
    seg_dozens
);

endmodule
