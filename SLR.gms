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
    t       time                    / t0, t1 /
    r       region                  / "world" /

    vars    tol_param descriptions  / "time_preference",
                                        "margU_consump_elasticity",
                                        "climate_sensitivity", 
                                        "SL_eft_Tb0", 
                                        "SL_eft_Tb1", 
                                        "SL_eft_Tb2", 
                                        "SL_eft_rho", 
                                        "SL_temp_sensitivity",
                                        "dryland_loss",
                                        "elevation",
                                        "land_value",
                                        "income_density",
                                        "land_value_elasticity",
                                        "wetland_loss_SLR",
                                        "wetland_loss_coastalsqueeze",
                                        "exposed_etland",
                                        "W_service_value",
                                        "W_income_normalization",
                                        "WV_income_elasticity",
                                        "W_popdens_normalization",
                                        "WV_popdens_elasticity",
                                        "WV_size_elasticity",
                                        "coast_protection_cost",
                                        "DV_income_elasticity"
                                        /  
;

parameters          
    tol_param(r, vars)  "FUND parameters"
;

variables           
* General States
    temp(t)                 Global mean temperature at time t
    Y(t,r)                  Income in region r at time t
    Y_pc(t,r)               Per capita income in region r at time t
    Y_pc_growth(t,r)        Per capita income growth in region r at time t
    P_dens(t,r)             Population density of region r at time t
    P_growth(t,r)           Population growth of region r at time t
    A(t,r)                  Area of region r at time t

* Sea level rise
    eft                     e folding time for sea level rise
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
    NPVVP(t,r)              Net present value of protecting entire coast
    NPVVW(t,r)              Net present value of wetland loss from coastal squeeze
    NPVVD(t,r)              Net present value of land loss without any protection
    Protection(t,r)         Fraction of coast protected in region r at time t
;


*** Sea level equations ***
eft = max(tol_param("world", "SL_eft_Tb0") + 
            tol_param("world", "SL_eft_Tb1") * tol_param("world", "climate_sensitivity") + 
            tol_param("world", "SL_eft_Tb2")* tol_param("world", "climate_sensitivity")**2,
        1);

temp(t+1) = (1 - 1/eft) * temp(t) + (1/eft) * 
    (tol_param("world", "climate_sensitivity")/(5.35*log(2))) * RF(t);

SL(t) = (1 - 1/(tol_param(r, "SL_eft_rho"))) * SL(t-1) +
    tol_param(r, "SL_temp_sensitivity") * temp(t);

SLR(t) = SL(t) - SL(t-1);


*** Dryland ***
CD_potential(t,r) = min(tol_param(r, "dryland_loss") * SL(t)**(tol_param(r, "elevation"),
                        A("t2000", r);

D_potential(t,r) = CD_potential(t,r) - CD_actual(t-1,r);

D_actual(t,r) = (1 - Protection(t,r)) * D_potential(t,r);

CD_actual(t,r) = CD_actual(t-1,r) + D_actual(t,r);

VD(t,r) = tol_param(r, "land_value") * 
    (Y(t,r) / A(t,r) / tol_param("world", "income_density")) ** 
        tol_param("world", "land_value_elasticity");


*** Wetland ***
W(t, r) = tol_param(r, "wetland_loss_SLR") * SLR(t, r) + 
    tol_param(r, "wetland_loss_coastalsqueeze") * Protection(t, r) * SLR(t, r);

CW(t, r) = min(CW(t-1, r) + W(t-1, r), tol_param(r, "exposed_wetland"));

VW(t, r) = tol_param("world", "W_service_value") * 
        (Y_pc(t,r)/tol_param("world", "W_income_normalization")) ** 
            tol_param("world", "WV_income_elasticity") *
        (P_dens(t,r)/tol_param("world", "W_popdens_normalization")) ** 
            tol_param("world", "WV_popdens_elasticity") *
        (1 - CW(t,r)/tol_param(r, "W_1990")) **
            tol_param("world", "WV_size_elasticity");


*** Protection costs ***
consump_term(t,r) = tol_param("world", "time_preference") +
                    tol_param("world", "margU_consump_elasticity") * g(t,r);

NPVVP(t,r) = (1 + consump_term(t,r)) / consump_term(t,r) 
                * tol_param(r, "coast_protection_cost") * SLR(t);

NPVVW(t,r) = W(t,r) * VW(t,r) * (1 + consump_term) /
    (consump_term(t,r) -
        tol_param("world", "WV_income_elasticity") * g(t,r) -
        tol_param("world", "WV_popdens_elasticity") * p(t,r) -
        tol_param("world", "WV_size_elasticity") * wetland_growth(t, r)
    );

NPPVD(t,r) = D_potential(t,r) * VD(t,r) * 
    (1 + consump_term(t,r)) /
        (consump_term(t,r) - tol_param("world", "DV_income_elasticity") * Y_dens(t,r));
    
Protection(t,r) = max(0, 1 - 0.5 * (NPVVP(t,r) + NPVVW(t,r))/NPVVD(t,r));

