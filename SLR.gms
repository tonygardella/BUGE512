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
    A(t,c)                  Area of country c at time t
    SL(t)                   Sea level at time t
    SLR(t)                  Sea level rise at time t

* Dryland loss
    CD_potential(t,c)       Cumulative potential dryland loss in year t
    D_potential(t,c)        Potential dryland loss in year t
    D_actual(t,c)           Actual dryland loss in year t
    CD_actual(t,c)          Actual cumulative dryland loss in year t
    VD(t,c)                 Value of dryland in region r at time t

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

*---------------------
*        Model       
*---------------------

* Initial conditions
loop(c, 
A("2010",c) = SLR_par_c(c,"area_2000");
);

* Initialize loops
loop(t,
loop(c,

*** Sea level equations ***
SL(t+1) = (1 - 1/(SLR_par_gl("SL_eft_rho"))) * SL(t) +
    SLR_par_gl("SL_temp_sensitivity") * temp(t+1);

SLR(t+1) = SL(t+1) - SL(t);


*** Dryland ***
CD_potential(t+1,c) = min(SLR_par_c(c, "dryland_loss") * SL(t+1)**(SLR_par_c(c, "DEM")), SLR_par_c(c, "area_2000"));

D_potential(t+1,c) = CD_potential(t+1,c) - CD_actual(t,c);

D_actual(t+1,c) = (1 - Protection(t+1,c)) * D_potential(t+1,c);

CD_actual(t+1,c) = CD_actual(t,c) + D_actual(t+1,c);

VD(t+1,c) = SLR_par_gl("land_value") * 
    (Y(t+1,c) / A(t+1,c) / SLR_par_gl("income_density")) ** 
        SLR_par_gl("land_value_elasticity");


*** Wetland ***
W(t+1, c) = SLR_par_c(c, "wetland_loss_SLR") * SLR(t+1) + 
    SLR_par_c(c, "wetland_loss_coastalsqueeze") * Protection(t+1, c) * SLR(t+1);

CW(t+1, c) = min(CW(t, c) + W(t, c), SLR_par_c(c, "exposed_wetland"));

VW(t+1, c) = 21 * SLR_par_gl("W_service_value") * 
        (Y_pc(t+1,c)/SLR_par_gl("W_income_normalization")) ** 
            SLR_par_gl("WV_income_elasticity") *
        (P_dens(t+1,c)/SLR_par_gl("W_popdens_normalization")) ** 
            SLR_par_gl("WV_popdens_elasticity") *
        (1 - CW(t+1,c)/SLR_par_c(c, "W_1990")) **
            SLR_par_gl("WV_size_elasticity");


*** Protection costs ***
consump_term(t+1,c) = RHO + ETA * Y_pc_growth(t+1,c);

NPVVP(t+1,c) = (1 + consump_term(t+1,c)) / consump_term(t+1,c) 
                * SLR_par_c(c, "coast_protection_cost") * SLR(t+1);

NPVVW(t+1,c) = W(t+1,c) * VW(t+1,c) * (1 + consump_term(t+1,c)) /
    (consump_term(t+1,c) -
        SLR_par_gl("WV_income_elasticity") * Y_pc_growth(t+1,c) -
        SLR_par_gl("WV_popdens_elasticity") * Y_dens_growth(t+1,c) -
        SLR_par_gl("WV_size_elasticity") * (-W(t+1,c))
    );

NPVVD(t+1,c) = D_potential(t+1,c) * VD(t+1,c) * 
    (1 + consump_term(t+1,c)) /
        (consump_term(t+1,c) - SLR_par_gl("DV_income_elasticity") * Y_dens(t+1,c));
    
Protection(t+1,c) = max(0, 1 - 0.5 * (NPVVP(t+1,c) + NPVVW(t+1,c))/NPVVD(t+1,c));

* End loops
));
