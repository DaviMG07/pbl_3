// OK
module counter_30_0(
    input clock,
    input [5:0] preset,
    input [5:0] reset,
    output [1:0] dozens,
    output [3:0] units,
    output time_over
);

wire ten_s;

counter_9_0(
    clock, 
    preset[3:0], 
    reset[3:0], 
    units
);

counter_3_0(
    ten_s, 
    preset[5:4], 
    reset[5:4], 
    dozens
);

nor(ten_s, !units[0], units[1], units[2], !units[3]);
nor(time_over, dozens[1], dozens[0], units[3], units[2], units[1], units[0]);

endmodule
