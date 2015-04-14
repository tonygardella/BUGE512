* FUND Sea level rise
* AUTHOR: Alexey Shiklomanov

* Abbreviations:
*   eft = e folding time
*   SL = sea level
*   DEM = digital elevation model

* "r" functions are draws from distributions:
*   rgamma(shape, scale)
*   rtriangle(lower limit, upper limit)

$include mosaic_common_dec.gms
$include mosaic_economy_dec.gms
$include mosaic_carbon_dec.gms

parameters
*** General states ***

* Economy
        Y_pc(t,c)               "Per capita income in nation c at time t"
        Y_pc_growth(t,c)        "Per capita income growth in nation c at time t"
        Y_dens(t,c)             "Income density of region t at time r"
        Y_dens_growth(t,c)      "Income density growth of region t at time r"
        P_dens(t,c)             "Population density of nation c at time t"
        P_growth(t,c)           "Population growth rate of nation c at time t"

* Global scalars 
        RHO     "Time preference"                            / 0.5 /
        ETA     "Marginul utility of consumption elasticity" / 1.0 /


*** Sea level rise parameters
* Sea level rise
        Area(t,c)               Area of country c at time t
        SLR(t)                  Sea level rise at time t

* Dryland loss
        CD_potential(t,c)       Cumulative potential dryland loss in year t
        D_potential(t,c)        Potential dryland loss in year t
        D_actual(t,c)           Actual dryland loss in year t
        CD_actual(t,c)          Actual cumulative dryland loss in year t
        VD(t,c)                 Value of dryland in region r at time t

* Migration
        migration_r(r,r)        Regional migration matrix
        migration(c,c)          Country migration matrix
        pop_out(t,c)            Population emigrating from country c at time t
        pop_in(t,c)             Population immigrating into country c at time t
        migration_impact(t,c)   Net impact of migration (in $?) of country c at time t
        pop_r(r)                Regional population in 2010. Used only for migration aggregation

* Wetland loss
        W(t,c)                  Wetland loss in region r at time t
        CW(t,c)                 Cumulative wetland loss in region r at time t
        VW(t,c)                 Value of wetlands in region r at time t

* Protection    
        consump_term(t,c)       Shorthand term for consumption elasticity
        NPVVP(t,c)              Net present value of protecting entire coast
        NPVVW(t,c)              Net present value of wetland loss from coastal squeeze
        NPVVD(t,c)              Net present value of land loss without any protection
        Protection(t,c)         Fraction of coast protected in region r at time t

* FUND parameters 
        SLR_par_gl(*)   "Global parameters related to sea-level rise" /
$include SLR_global_pars.dat
/
;

table SLR_par_c(c,*)    "Country parameters related to sea-level rise"
$include SLR_national_pars.dat
;

table migration_r(r,r)    "Table of migration coefficients"
$ondelim onlisting
$include SLR_migration.csv
$offdelim offlisting
;


* Disaggregate migration from regions to countries
alias(c, c2);
alias(r, r2);
pop_r(r) = sum(c$rcmap(r,c), pop("2010",c));
migration(c,c2) = sum((r,r2)$(rcmap(r,c) and rcmap(r2,c2)), migration_r(r,r2) * pop("2010",c)/pop_r(r));

* Initial conditions 
*   These are tuned to show a reasonable trend in
*   D_actual for USA. They NEED PROPER TUNING!
        SLR("2010")             = 0.1;
        Area("2010",c)          = SLR_par_c(c,"area_2000");
        Protection("2010",c)    = 0.98;
        P_growth("2010",c)      = 0;
        Y_pc_growth("2010",c)   = 0;
        Y_dens_growth("2010",c) = 0;

* Separate landlocked countries
sets    
        cdry(c)           Subset of landlocked countries
        cwet(c)           Subset of countries with coastlines
;
        cdry(c)                = yes$(SLR_par_c(c,"coast_length") = 0);
        D_potential(t,cdry)    = 0;
        D_actual(t,cdry)       = 0;
        CD_actual(t,cdry)      = 0;
        w(t,cdry)              = 0;
        CW(t,cdry)             = 0;
        Protection(t,cdry)     = 0;
        cwet(c)                = yes$(SLR_par_c(c,"coast_length") > 0);

* Compute land loss for pre-industrial sea-level
        D_potential("2010",cwet)   = min(SLR_par_c(cwet, "dryland_loss") * SLR("2010")**(SLR_par_c(cwet, "DEM")), 
                                                SLR_par_c(cwet, "max_dryland_loss"));
        D_actual("2010",cwet)      = (1 - Protection("2010",cwet)) * D_potential("2010",cwet);
        CD_actual("2010",cwet)     = D_actual("2010",cwet);
        W("2010",cwet)             = SLR_par_c(cwet, "wetland_loss_SLR") * SLR("2010") +
                                      SLR_par_c(cwet, "wetland_loss_coastalsqueeze") * Protection("2010", cwet) * SLR("2010");
        CW("2010",cwet)            = min(W("2010",cwet), SLR_par_c(cwet, "exposed_wetland"));

*---------------------
*        Model       
*---------------------

loop(t,
        
$batinclude mosaic_economy_exe.gms
$batinclude mosaic_carbon_exe.gms

* Derived economic quantities
        P_dens(t,c)                   =     pop(t,c) / Area(t,c);
        P_growth(t,c)$(ord(t)>1)      =     pop(t,c) / pop(t-1,c);
        y_pc(t,c)                     =     y_net(t,c) / pop(t,c);
        Y_pc_growth(t,c)$(ord(t)>1)   =     y_pc(t,c) / y_pc(t-1,c) - 1;
        Y_dens(t,c)                   =     y_net(t,c) / Area(t,c);
        Y_dens_growth(t,c)$(ord(t)>1) =     y_dens(t,c) / y_dens(t-1,c) - 1;

*** Sea level equations ***
* NOTE: Adjusted for 5 year time step (nyper)
* NOTE: I think original equation was in cm (based on results),
*   so I divided second term by 100. This gives more reasonable
*   results (~ 1 m SLR by 2100)
        SLR(t)$(ord(t)>1)             =     ((1 - 1/(SLR_par_gl("SL_eft")))**nyper) * SLR(t-1) +
                                                (SLR_par_gl("SL_temp_sensitivity") * TATM(t))/100;

*** Dryland ***
        CD_potential(t,cwet)$(ord(t)>1)  =     min(SLR_par_c(cwet, "dryland_loss") * SLR(t)**(SLR_par_c(cwet, "DEM")), 
                                                SLR_par_c(cwet, "max_dryland_loss"));
        D_potential(t,cwet)$(ord(t)>1)   =     CD_potential(t,cwet) - CD_actual(t-1,cwet);
        D_actual(t,cwet)$(ord(t)>1)      =     (1 - Protection(t,cwet)) * D_potential(t,cwet);
        CD_actual(t,cwet)$(ord(t)>1)     =     CD_actual(t-1,cwet) + D_actual(t,cwet);
        VD(t,c)                       =     SLR_par_gl("land_value") *
                                                (Y_dens(t,c) / SLR_par_gl("income_density")) ** 
                                                    SLR_par_gl("land_value_elasticity");

*** Migration ***
        pop_out(t,c) = P_dens(t,c) * D_actual(t,c);
        pop_in(t,c) = sum(c2, migration(c, c2) * pop_out(t,c2));
        migration_impact(t,c) = SLR_par_gl("migrant_out") * pop_out(t,c) * Y_pc(t,c) -
                                    SLR_par_gl("migrant_in") * pop_in(t,c) * Y_pc(t,c);

*** Wetland ***
        W(t,cwet)$(ord(t)>1)             =     SLR_par_c(cwet, "wetland_loss_SLR") * SLR(t) +
                                                SLR_par_c(cwet, "wetland_loss_coastalsqueeze") * Protection(t, cwet) * SLR(t);
        CW(t,cwet)$(ord(t)>1)            =     min(CW(t-1,cwet) + W(t,cwet), SLR_par_c(cwet, "exposed_wetland"));
        VW(t,c)                       =     21 * SLR_par_gl("W_service_value") *
                                                (Y_pc(t,c)/SLR_par_gl("W_income_normalization")) ** 
                                                    SLR_par_gl("WV_income_elasticity") *
                                                (P_dens(t,c)/SLR_par_gl("W_popdens_normalization")) ** 
                                                    SLR_par_gl("WV_popdens_elasticity") *
                                                (1 - CW(t,c)/SLR_par_c(c, "W_1990")) **
                                                    SLR_par_gl("WV_size_elasticity");

*** Protection costs ***
        consump_term(t,c)             =     RHO + ETA * Y_pc_growth(t,c);
        NPVVP(t,c)                    =     (1 + consump_term(t,c)) / consump_term(t,c)
                                                * SLR_par_c(c, "coast_protection_cost") * SLR(t);
        NPVVW(t,c)                    =     W(t,c) * VW(t,c) * (1 + consump_term(t,c)) /
                                                (consump_term(t,c) -
                                                    SLR_par_gl("WV_income_elasticity") * Y_pc_growth(t,c) -
                                                    SLR_par_gl("WV_popdens_elasticity") * P_growth(t,c) -
                                                    SLR_par_gl("WV_size_elasticity") * (W(t,c))
                                        );
        NPVVD(t,c)                    =     D_potential(t,c) * VD(t,c) *
                                                (1 + consump_term(t,c)) /
                                                (consump_term(t,c) - SLR_par_gl("DV_income_elasticity") * Y_dens_growth(t,c));
        Protection(t+1,c)             =     max(0, 1 - 0.5 * (NPVVP(t,c) + NPVVW(t,c))/NPVVD(t,c));

*** Calculate next year's area
        Area(t+1,c)                   =     max(Area("2010",c) - CW(t,c) - CD_actual(t,c), 0);

* End loop
);

display SLR, pop_out;
