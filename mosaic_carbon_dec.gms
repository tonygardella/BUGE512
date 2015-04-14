*** DICE carbon parameters ***

parameters
* Initial Conditions
        mat0   Initial Concentration in atmosphere 2010 (GtC)        /830.4   /
        mu0    Initial Concentration in upper strata 2010 (GtC)      /1527.   /
        ml0    Initial Concentration in lower strata 2010 (GtC)      /10010.  /
        mateq  Equilibrium concentration atmosphere  (GtC)           /588     /
        mueq   Equilibrium concentration in upper strata (GtC)       /1350    /
        mleq   Equilibrium concentration in lower strata (GtC)       /10000   /

* Flow paramaters
        b12      Carbon cycle transition matrix                      /.088   /
        b23      Carbon cycle transition matrix                      /0.00250 /

* These are for declaration and are defined later
        b11      Carbon cycle transition matrix
        b21      Carbon cycle transition matrix
        b22      Carbon cycle transition matrix
        b32      Carbon cycle transition matrix
        b33      Carbon cycle transition matrix


** Climate model parameters
        t2xco2   Equilibrium temp impact (oC per doubling CO2)    / 2.9   /
        fex0     2010 forcings of non-CO2 GHG (Wm-2)              / 0.25  /
        fex1     2100 forcings of non-CO2 GHG (Wm-2)              / 0.70  /
        tocean0  Initial lower stratum temp change (C from 1900)  /.0068  /
        tatm0    Initial atmospheric temp change (C from 1900)    /0.80   /
        tempC_preind    Preindustrial temperature (degrees C)     / 13.78 /
        CO2_ppm_preind  Preindustrial CO2 concentration (ppm)     / 275  /

        c10      Initial climate equation coefficient for upper level /0.098  /
        c1beta   Regression slope coefficient(SoA~Equil TSC)          /0.01243 /
        c1       Climate equation coefficient for upper level     /0.098  /
        c3       Transfer coefficient upper to lower stratum      /0.088  /
        c4       Transfer coefficient for lower level             /0.025  /
        fco22x   Forcings of equilibrium CO2 doubling (Wm-2)      /3.8    /

        forcoth(t)    Exogenous forcing for other greenhouse gases

*Climate and carbon cycle

        MU(t)           Shallow ocean concentration
        ML(t)           Lower ocean concentration
        FORC(t)         Increase in radiative forcing (watts per m2 from 1900)
        TATM(t)         Increase temperature of atmosphere (degrees C from 1900)
        TOCEAN(t)       Increase temperatureof lower oceans (degrees C from 1900)
        MAT(t)          Carbon concentration increase in atmosphere (GtC from 1750)
        MU(t)           Carbon concentration increase in shallow oceans (GtC from 1750)
        ML(t)           Carbon concentration increase in lower oceans (GtC from 1750)

        temp(t)                               "Temperature in C"
        temp_r(t,c)                           "Regional temp in C"
        CO2_ppm(t)                            "CO2 concentration"

        temp_change_from_preind_national(t,c)
        temp_change_interannual(t)            "Change in temperature"
        temp_change_interannual_national(t,c) "Change in regional mean temp"
        temp_change_from_2010(t)              "Change in global mean temp. rel to 2010"
        temp_change_national_from_2010(t,c)   "Change in reg. mean temp. rel. to 2010"

* Regional temperature scaling
        reg_temp_conv(r) /
$include regional_temp_scaling.dat
/
;
        Country_Tol_regional_temp(c) = sum(r$rcmap(r,c), reg_temp_conv(r));

* Parameters for long-run consistency of carbon cycle
        b11                     = 1 - b12;
        b21                     = b12*MATEQ/MUEQ;
        b22                     = 1 - b21 - b23;
        b32                     = b23*mueq/mleq;
        b33                     = 1 - b32 ;

        forcoth(t)              = 0;
**fex0 + (1/18)*(fex1-fex0)*(t.val-1)$(t.val lt 19)+ (fex1-fex0)$(t.val ge 19);

        MAT("2010")             = mat0;
        ML("2010")              = ml0;
        TOCEAN("2010")          = tocean0;
        TATM("2010")            = tatm0;
        MU("2010")              = mu0;
        FORC("2010")            = fco22x + fex0;

