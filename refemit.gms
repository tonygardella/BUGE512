* For running impacts with reference emissions (RCP 8.5)

$include mosaic_common_dec.gms
$include mosaic_carbon_dec.gms

parameter world_emissions_u(t)    /
$include RCP85_emit
/
    world_emissions(t)

    nyper       / 5 /
;

world_emissions(t) = world_emissions_u(t) * 3.66660;

loop(t,
$batinclude mosaic_carbon_exe.gms
);

display TATM;
