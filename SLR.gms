* FUND Sea level rise
* AUTHOR: Alexey Shiklomanov

* Abbreviations:
*   eft = e folding time
*   SL = sea level
*   DEM = digital elevation model
*   RF = Radiative forcing

* "r" functions are draws from distributions:
*   rgamma(shape, scale)
*   rtriangle(lower limit, upper limit)

sets        
    t       time                    / 2000, 2005, 2010, 2015,
                                    2020, 2025, 2030, 2035,
                                    2040, 2045, 2050, 2055,
                                    2060, 2065, 2070, 2075,
                                    2080, 2085, 2090, 2095,
                                    2100 /

    r       region                  / USA, CAN, WEU, JPK, ANZ, EEU,
                                      FSU, MDE, CAM, LAM, SAS, SEA,
                                      CHI, MAF, SSA, SIS /
;

parameters          
* General States
    temp(t)                 Global mean temperature at time t
    RF(t)                   Radiative forcing at time t
    Y(t,r)                  Income in region r at time t
    Y_pc(t,r)               Per capita income in region r at time t
    Y_pc_growth(t,r)        Per capita income growth in region r at time t
    Y_dens(t,r)             Income density of region t at time r
    Y_dens_growth(t,r)      Income density growth of region t at time r
    P_dens(t,r)             Population density of region r at time t
    P_growth(t,r)           Population growth of region r at time t
    A(t,r)                  Area of region r at time t

* Sea level rise
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

* Global scalars
    tstep   "Time step - 5 years, as per DICE model"     / 5   /
    RHO     "Time preference"                            / 0.5 /
    ETA     "Marginul utility of consumption elasticity" / 1.0 /

* FUND parameters 
    SLR_par_gl(*)   "Global parameters related to sea-level rise" /
$include SLR_global_pars.dat
/
;

table SLR_par_r(r,*)    "Regional parameters related to sea-level rise"
$include SLR_regional_pars.dat                    
;

*---------------------
*        Model       
*---------------------

* Initialize loops
loop(t,
loop(r,


*** Sea level equations ***
SL(t+1) = (1 - 1/(SLR_par_gl("SL_eft_rho"))) * SL(t) +
    SLR_par_gl("SL_temp_sensitivity") * temp(t+1);

SLR(t+1) = SL(t+1) - SL(t);


*** Dryland ***
CD_potential(t+1,r) = min(SLR_par_r(r, "dryland_loss") * SL(t+1)**(SLR_par_r(r, "DEM")), A("2000", r));

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
