*DECLARATIONS
$include mosaic_common_dec.gms
$include mosaic_economy_dec.gms
$include mosaic_carbon_dec.gms
$include mosaic_sealevel_dec.gms
$include mosaic_ag_for_ecos_energ_dec.gms
$include mosaic_health_dec.gms
$include Mosaic_WaterResources_dec.gms

*EXECUTION
loop(t,

$batinclude mosaic_economy_exe.gms
$batinclude mosaic_carbon_exe.gms
$batinclude mosaic_sealevel_exe.gms
$batinclude mosaic_ag_for_ecos_energ_exe.gms
$batinclude mosaic_health_exe.gms
$batinclude Mosaic_WaterResources_exe.gms

);

*REGIONAL REMAPPING AND PUT FILES
$include SolowSwanResults.gms
$include HealthResults.gms
$include mosaic_ag_for_ecos_energ_output.gms

execute_unload "MOSAIC.gdx"

