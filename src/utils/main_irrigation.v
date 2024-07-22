// OK
module main_irrigation(
    input air_umidity,
    input soil_umidity,
    input temperature,
    input [1:0] water_box,
    output sprinkler,
    output drip,
    output specific
);

wire H, M, L, C;
wire [5:0] aux;

decoder_2_4(water_box, C, L, M, H);

// H + M
or(aux[0], H, M);

// Ua · T' · (H + M)
and(aux[1], air_umidity, !temperature, aux[0]);

// Ua' + Ua · T' · (H + M)
or(aux[2], !air_umidity, aux[1]);

// As = Us' [Ua' + Ua · T' · (H + M)]
and(sprinkler, !soil_umidity, aux[2]);

// T' + L
and(aux[3], !temperature, L);

// T + T' · L
or(aux[4], temperature, aux[3]);

// Ua (T + T' · L)
and(aux[5], air_umidity, aux[4]);

// Gs = Us' · Ua (T + T' · L)
and(drip, !soil_umidity, aux[5]);

and(specific, air_umidity, !temperature);

endmodule
