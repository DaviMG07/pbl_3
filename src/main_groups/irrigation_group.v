module irrigation_group(
    input air_umidity,
    input soil_umidity,
    input temperature,
    input [1:0] water_box,
    output [1:0] irrigation_data,
    output specific,
    output sprinkler,
    output drip
);

main_irrigation(
    air_umidity,
    soil_umidity,
    !temperature,
    water_box,
    sprinkler,
    drip,
    specific
);

encoder_irrigation(
    sprinkler,
    drip,
    specific,
    irrigation_data
);

endmodule
