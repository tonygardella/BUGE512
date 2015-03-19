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

sets        t   "time"  / t0 /
            region / "USA" /
            vars   / "climate_sensitivity", 
                    "temp_eft_alpha", 
                    "temp_eft_beta_l", 
                    "temp_eft_beta_q", 
                    "SL_eft_rho", 
                    "SL_temp_sensitivity",
                    "dryland_loss",
                    "elevation",
                    "maximum_dryland_loss"
                    /  
;

parameters          tol_param(region, vars)
                    CD(t, region)       "Potential cumulative dryland lost at time t"
;

*** Sea level equations ***
phi = max(tol_param(region, "temp_eft_alpha") + 
    tol_param(region, "temp_eft_beta_l")*CS + 
    tol_param(region, "temp_eft_beta_q")*CS**2, 1);
temp(t+1) = (1 - 1/phi) * temp(t) + (1/phi) * 
    (tol_param(region, "climate_sensitivity")/(5.35*log(2))) * RF(t);
SL(t) = (1 - 1/(tol_param(region, "SL_eft_rho"))) * SL(t-1) + tol_param(region, "SL_temp_sensitivity") * temp(t);
SLR(t) = SL(t) - SL(t-1);


*** SLR impact equations ***
* Cumulative potential dryland loss in year t
CD_potential(t, region) = min(tol_param(region, "dryland_loss") * SL(t)**(tol_param(region, "elevation"));

* Potential dryland loss in year t -- difference between cum. pot. loss and actual cumulative loss from previous year
D_potential(t, region) = CD_potential(t, region) - CD_actual(t-1, region);

* Actual dryland loss in year t -- accounts for protection P(t,region)
D_actual(t, region) = (1 - Protection(t, region)) * D_potential(t, region);

* Actual cumulative dryland loss in year t
CD_actual(t, region) = CD_actual(t-1, region) + D_actual(t, region);

* Value of dryland
Value_dryland(t, region) = tol_param(region, "land_value") * 
    (Income(t, region) / Area(t, region) / tol_param("world", "income_density"))**tol_param("world", "land_value_elasticity");

* Wetland loss
Wetland_loss(t, region) = ttol_param(region, "wetland_loss_SLR") * SLR(t, region) + 
    tol_param(region, "wetland_loss_coastalsqueeze") * Protection(t, region) * SLR(t, region);

Cum_wetland_loss(t, region) = min(Cum_wetland_loss(t-1, region) + Wetland_loss(t-1, region), tol_param(region, "exposed_wetland"));

Value_wetland(t, region) = tol_param()
