$include mosaic_common_dec.gms
$include mosaic_economy_dec.gms
$include mosaic_carbon_dec.gms
*$include mosaic_sealevel_dec.gms
$include mosaic_ag_for_ecos_energ_dec.gms
*$include mosaic_health_dec.gms
*$include mosaic_WaterResources_dec.gms

loop(t,

$batinclude mosaic_economy_exe.gms
$batinclude mosaic_carbon_exe.gms
*$batinclude mosaic_sealevel_exe.gms
$batinclude mosaic_ag_for_ecos_energ_exe.gms
*$batinclude mosaic_health_exe.gms
*$batinclude mosaic_WaterResources_exe.gms

);


file out / C:\Users\parevalo\OneDrive\Spring 2015\GE512\R\ag_for_ecos_energ_country_USD.dat /;
out.pc = 6;
out.nd = 6;
out.nr = 2;
put out;
put "IAI" "LE" "F" "SH" "SC" /;
loop((t,c),
        put , IAI(t,c), LE(t,c), F(t,c), SH(t,c), SC(t,c) /;
        );
putclose;


