* FUND Sea level rise
* AUTHOR: Alexey Shiklomanov

* Abbreviations:
*   eft = e folding time
*   SL = sea level
*   DEM = digital elevation model

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
        Area(t,c)               Area of country c at time t (km2)
        SLR(t)                  Sea level rise at time t (m)

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
        SLR("2010")             = 0.01;
        Area("2010",c)          = SLR_par_c(c,"area_2000");
        Protection("2010",c)    = 0.5;
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
