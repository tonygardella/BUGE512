$ontext
MOSAIC MODEL
-Duplicate AEEI calls must be harmonized (economy-agriculture models)

$offtext

$include mosaic_common_dec.gms
$include mosaic_economy_dec.gms
$include mosaic_carbon_dec.gms
$include mosaic_ag_for_ecos_energ_dec.gms
$include mosaic_health_dec.gms

loop(t,

$batinclude mosaic_economy_exe.gms
$batinclude mosaic_carbon_exe.gms
$batinclude mosaic_ag_for_ecos_energ_exe.gms
$batinclude mosaic_health_exe.gms

);
