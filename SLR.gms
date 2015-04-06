* FUND Sea level rise
* AUTHOR: Alexey Shiklomanov

* Abbreviations:
*   eft = e folding time
*   SL = sea level
*   DEM = digital elevation model

* "r" functions are draws from distributions:
*   rgamma(shape, scale)
*   rtriangle(lower limit, upper limit)

$include common.gms

parameters          
* Sea level rise
    A(t,r)                  Area of region r at time t
    SL(t)                   Sea level at time t
    SLR(t)                  Sea level rise at time t

* Dryland loss
    CD_potential(t,r)       Cumulative potential dryland loss in year t
    D_potential(t,r)        Potential dryland loss in year t
    D_actual(t,r)           Actual dryland loss in year t
    CD_actual(t,r)          Actual cumulative dryland loss in year t
    VD(t,r)                 Value of dryland in region r at time t

* Wetland loss
    W(t,r)                  Wetland loss in region r at time t
    CW(t,r)                 Cumulative wetland loss in region r at time t
    VW(t,r)                 Value of wetlands in region r at time t

* Protection    
    consump_term(t,r)       Shorthand term for consumption elasticity
    NPVVP(t,r)              Net present value of protecting entire coast
    NPVVW(t,r)              Net present value of wetland loss from coastal squeeze
    NPVVD(t,r)              Net present value of land loss without any protection
    Protection(t,r)         Fraction of coast protected in region r at time t

* FUND parameters 
    SLR_par_gl(*)   "Global parameters related to sea-level rise" /
$include SLR_global_pars.dat
/
    SLR_par_c(c,*)  "Country parameters related to sea-level rise"
;

table SLR_par_r(r,*)    "Regional parameters related to sea-level rise"
$include SLR_regional_pars.dat                    
;

*---------------------
*        Model       
*---------------------

* Disaggregate regional parameters into national parameters
SLR_par_c(c,*) = sum(r$rcmap(r,c), SLR_par_r(r));

* Initialize loops
loop(t,
loop(r,

*** Sea level equations ***
SL(t+1) = (1 - 1/(SLR_par_gl("SL_eft_rho"))) * SL(t) +
    SLR_par_gl("SL_temp_sensitivity") * temp(t+1);

SLR(t+1) = SL(t+1) - SL(t);


*** Dryland ***
CD_potential(t+1,r) = min(SLR_par_r(r, "dryland_loss") * SL(t+1)**(SLR_par_r(r, "DEM")), SLR_par_r(r, "area_2000"));

D_potential(t+1,r) = CD_potential(t+1,r) - CD_actual(t,r);

D_actual(t+1,r) = (1 - Protection(t+1,r)) * D_potential(t+1,r);

CD_actual(t+1,r) = CD_actual(t,r) + D_actual(t+1,r);

VD(t+1,r) = SLR_par_gl("land_value") * 
    (Y(t+1,r) / A(t+1,r) / SLR_par_gl("income_density")) ** 
        SLR_par_gl("land_value_elasticity");


*** Wetland ***
W(t+1, r) = SLR_par_r(r, "wetland_loss_SLR") * SLR(t+1) + 
    SLR_par_r(r, "wetland_loss_coastalsqueeze") * Protection(t+1, r) * SLR(t+1);

CW(t+1, r) = min(CW(t, r) + W(t, r), SLR_par_r(r, "exposed_wetland"));

VW(t+1, r) = 21 * SLR_par_gl("W_service_value") * 
        (Y_pc(t+1,r)/SLR_par_gl("W_income_normalization")) ** 
            SLR_par_gl("WV_income_elasticity") *
        (P_dens(t+1,r)/SLR_par_gl("W_popdens_normalization")) ** 
            SLR_par_gl("WV_popdens_elasticity") *
        (1 - CW(t+1,r)/SLR_par_r(r, "W_1990")) **
            SLR_par_gl("WV_size_elasticity");


*** Protection costs ***
consump_term(t+1,r) = RHO + ETA * Y_pc_growth(t+1,r);

NPVVP(t+1,r) = (1 + consump_term(t+1,r)) / consump_term(t+1,r) 
                * SLR_par_r(r, "coast_protection_cost") * SLR(t+1);

NPVVW(t+1,r) = W(t+1,r) * VW(t+1,r) * (1 + consump_term(t+1,r)) /
    (consump_term(t+1,r) -
        SLR_par_gl("WV_income_elasticity") * Y_pc_growth(t+1,r) -
        SLR_par_gl("WV_popdens_elasticity") * Y_dens_growth(t+1,r) -
        SLR_par_gl("WV_size_elasticity") * (-W(t+1,r))
    );

NPVVD(t+1,r) = D_potential(t+1,r) * VD(t+1,r) * 
    (1 + consump_term(t+1,r)) /
        (consump_term(t+1,r) - SLR_par_gl("DV_income_elasticity") * Y_dens(t+1,r));
    
Protection(t+1,r) = max(0, 1 - 0.5 * (NPVVP(t+1,r) + NPVVW(t+1,r))/NPVVD(t+1,r));

* End loops
));
