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

execute_unload "SLR.gdx" 
            k, i, s, y_gross, y_net, l, emiss_count,
            P_dens, P_growth, y_pc, y_pc_growth,
            y_dens, y_dens_growth,
            SLR, Area,
            CD_potential, D_potential, D_actual, CD_actual, VD,
            pop_out, pop_in, migration_impact,
            W, CW, VW, consump_term, NPVVP, NPVVW, NPVVD, Protection,
            TATM, SLR, world_emissions;


