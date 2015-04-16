* FUND Sea level rise
* AUTHOR: Alexey Shiklomanov

$include mosaic_common_dec.gms
$include mosaic_economy_dec.gms
$include mosaic_carbon_dec.gms
$include mosaic_sealevel_dec.gms

loop(t,
        
$batinclude mosaic_economy_exe.gms
$batinclude mosaic_carbon_exe.gms
$batinclude mosaic_sealevel_exe.gms
);

display SLR, Area
