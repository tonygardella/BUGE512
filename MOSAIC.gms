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

file out / health_outputs.txt /;
out.pc = 6;
out.nd = 6;
out.nr = 2;
put out;
put "total_deaths" "total_health_damages" "total_health_damages_percentage"
         "value_life" "value_year_morbidity" "deaths_diarrhea"
         "deaths_vector_borne" "deaths_cardiovascular_heat"
         "deaths_cardiovascular_cold" "deaths_respiratory"/;
loop((t,c),
        put total_deaths(t,c), total_health_damages(t,c), total_health_damages_percentage(t,c),
            value_life(t,c), value_year_morbidity(t,c), deaths_diarrhea(t,c),
            deaths_vector_borne(t,c), deaths_cardiovascular_heat(t,c),
            deaths_cardiovascular_cold(t,c), deaths_respiratory(t,c)
          /;
         );
putclose;

