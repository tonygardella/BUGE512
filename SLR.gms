* FUND Sea level rise
* AUTHOR: Alexey Shiklomanov

* Abbreviations:
*   eft = e folding time
*   SL = sea level
*   DEM = digital elevation model

* "r" functions are draws from distributions:
*   rgamma(shape, scale)
*   rtriangle(lower limit, upper limit)

set t    time       /2010,2015,
                     2020,2025,
                     2030,2035,
                     2040,2045,
                     2050,2055,
                     2060,2065,
                     2070,2075,
                     2080,2085,
                     2090,2095,
                     2100/

set r    regions    /USA,CAN,WEU,JPK,ANZ,EEU,FSU,MDE,CAM,SAM,
                     SAS,SEA,CHI,NAF,SSA,SIS/
set c    countries  /
                    ARG,ARM,AUS,AUT,AZE,
                    BDI,BEL,BEN,BFA,BGD,BGR,BHR,BHS,BIH,BLR,
                        BLZ,BOL,BRA,BRB,BRN,BTN,BWA,
                    CAN,CHE,CHL,CHN,CIV,CMR,COL,COM,CRI,CYP,
                        CZE,
                    DEU,DJI,DNK,DOM,
                    ECU,EGY,ESP,EST,ETH,
                    FIN,FJI,FRA,
                    GAB,GBR,GEO,GHA,GIN,GMB,GNB,GNQ,GRC,GTM,
                    HND,HRV,HUN,
                    IDN,IND,IRL,IRN,IRQ,ISL,ISR,ITA,
                    JAM,JOR,JPN,
                    KAZ,KEN,KGZ,KHM,KOR,KWT,
                    LAO,LBN,LBR,LKA,LSO,LTU,LUX,LVA,
                    MAR,MDA,MDG,MDV,MEX,MKD,MLI,MLT,MNE,MNG,
                        MOZ,MRT,MUS,MWI,MYS,
                    NAM,NER,NGA,NLD,NOR,NPL,NZL,
                    OMN,
                    PAK,PAN,PER,PHL,POL,PRT,PRY,
                    QAT,
                    ROU,RUS,RWA,
                    SAU,SDN,SEN,SGP,SLE,SLV,SRB,STP,SUR,SVK,
                        SVN,SWE,SWZ,SYR,
                    TGO,THA,TJK,TKM,TTO,TUN,TUR,TZA,
                    UGA,UKR,URY,USA,UZB,
                    VEN,VNM,
                    YEM,
                    ZAF,ZMB,ZWE
                    /

rcmap(*,*) regional map /
         USA . (USA)
         CAN . (CAN)
         WEU . (AUT,BEL,CHE,CYP,DEU,DNK,ESP,FIN,FRA,GBR,
                    GRC,IRL,ISL,ITA,LUX,MLT,NLD,NOR,PRT,
                    SWE)
         JPK . (JPN,KOR)
         ANZ . (AUS,NZL)
         CEE . (BGR,BIH,CZE,HRV,HUN,MKD,MNE,POL,ROU,SRB,
                    SVK,SVN)
         FSU . (ARM,AZE,BLR,EST,GEO,KAZ,KGZ,LTU,LVA,MDA,
                    RUS,TJK,TKM,UKR,UZB)
         MDE . (BHR,IRN,IRQ,ISR,JOR,KWT,LBN,OMN,QAT,SAU,
                    SYR,TUR,YEM)
         CAM . (BLZ,CRI,GTM,HND,MEX,PAN,SLV)
         SAM . (ARG,BOL,BRA,CHL,COL,ECU,PER,PRY,SUR,URY,VEN)
         SAS . (BGD,BTN,IND,LKA,NPL,PAK)
         SEA . (BRN,IDN,KHM,LAO,MYS,PHL,SGP,THA,VNM)
         CHI . (CHN,MNG)
         NAF . (EGY,MAR,TUN)
         SSA . (BDI,BEN,BFA,BWA,CIV,CMR,DJI,ETH,GAB,GHA,
                    GIN,GMB,GNB,GNQ,KEN,LBR,LSO,MDG,MLI,
                    MOZ,MRT,MWI,NAM,NER,NGA,RWA,SDN,SEN,
                    SLE,SWZ,TGO,TZA,UGA,ZAF,ZMB,ZWE)
         SIS . (BHS,BRB,COM,DOM,FJI,JAM,MDV,MUS,STP,TTO)
         /;

parameters
*** General states ***

* Atmosphere
temp(t)                 "Temperature (degrees C)"
temp_r(t,c)             "Regional (country) temp (degrees C)"
CO(t)                   "CO2 concentration (ppm??)"
DT(t)                   "Change in temperature (degrees C)"
DT_r(t,c)               "Change in regional mean temp (degrees C)"
CT(t)                   "Change in global mean temp. rel to 2010 (degrees C)"
CRT(t,c)                "Change in reg. mean temp. rel. to 2010 (degrees C)"

* Economy
Y(t,c)                  "Income in nation c at time t"
Y_pc(t,c)               "Per capita income in nation c at time t"
Y_pc_growth(t,c)        "Per capita income growth in nation c at time t"
Y_dens(t,c)             "Income density of region t at time r"
Y_dens_growth(t,c)      "Income density growth of region t at time r"
P_dens(t,c)             "Population density of nation c at time t"
P_growth(t,c)           "Population growth of nation c at time t"

* Global scalars 
tstep   "Time step - 5 years, as per DICE model"     / 5   /
RHO     "Time preference"                            / 0.5 /
ETA     "Marginul utility of consumption elasticity" / 1.0 /



*** DICE carbon parameters ***

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
                 E_dice(t,c)       Emissions in GtC

* SolowSwan parameters
         k(t,c)       capital
         i(t,c)       investment
         s(c)         savings
         y_gross(t,c) output
         y_net(t,c)
         a(t,c)       tech
         l(t,c)       labor
         e(t,c)       emissions
         nyper        timestep                                      /5/
         lshr         labor share                                   /0.66/
         AEEI         Autonomous energy emissionintensity
         delta        depreciation                                  /0.05/
         omega        damage                                        /0.05/
         prodgr       productivity growth coefficient               /0.02/
         pro          productivity trend
         epsi         energy intensity
;

table initparam(*,*)  contains params rgdpl-y-e-k-s
$ondelim onlisting
$include 'initparams.csv'
$offdelim offlisting
;

table pop(*,*)
$ondelim onlisting
$include population.csv
$offdelim offlisting
;

*** Sea level rise parameters
parameters
* Sea level rise
    Area(t,c)                  Area of country c at time t
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

* DICE carbon cycle

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

temp("2010")               = 13.78 + TATM("2010");

* SolowSwan initialization
k("2010",c)             = initparam("k",c);
s(c)                    = 0.01 * initparam("s",c);
y_gross("2010",c)       = initparam("y",c);
l(t,c)                  = pop(t,c);
a("2010",c)             = y_gross("2010",c) / [ l("2010",c)**lshr * k("2010",c)**(1 - lshr)];
AEEI(t,c)               = 0.01 * 1;
e("2010",c)             = initparam("e",c);
epsi("2010",c)          = y_gross("2010",c)/e("2010",c);
pro(t,c)                = a("2010",c) * exp(prodgr*ord(t)-1);


* Precauclated quantities
Area("2010",c)          = SLR_par_c(c,"area_2000");
P_dens("2010",c)        = pop("2010",c) / Area("2010",c);
Y_pc("2010",c)          = y_gross("2010",c) / pop("2010",c);
Y_dens("2010",c)        = y_gross("2010",c) / Area("2010",c);
Y_pc_growth("2010",c)   = 0;
Y_dens_growth("2010",c) = 0;
E_dice("2010",c)        = e("2010",c) / 1000;


*---------------------
*        Model       
*---------------------

* Initial conditions
SL("2010")              = 15000;
SLR("2010")             = 0;

CD_actual("2010", c)    = 0;
Protection("2010", c)   = 0;
CW("2010",c)            = 0;


* Initialize loops
loop(t,
loop(c,

*Climate and carbon cycle
MAT(t+1)                 =     MAT(t)*b11 + MU(t)*b21 + (E_dice(t,c)*(5/3.666));
ML(t+1)                  =     ML(t)*b33  + MU(t)*b23;
FORC(t+1)                =     fco22x * ((log((MAT(t+1)/588.000))/log(2))) + forcoth(t);
MU(t+1)                  =     MAT(t)*b12 + MU(t)*b22 + ML(t)*b32;
TATM(t+1)                =     TATM(t) + c1 * ((FORC(t+1)-(fco22x/t2xco2)*TATM(t))-(c3*(TATM(t)-TOCEAN(t))));
TOCEAN(t+1)              =     TOCEAN(t) + c4*(TATM(t)-TOCEAN(t));
temp(t+1)                =     13.78 + TATM(t+1);

*GLOBAL Solow-Swan economic growth model
y_net(t,c)               =     (1-omega)*y_gross(t,c);
i(t,c)                   =     s(c)*y_net(t,c)*nyper;
y_gross(t+1,c)           =     pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);
k(t+1,c)                 =     i(t,c)+(1-delta)**nyper *k(t,c);
epsi(t+1,c)              =     epsi(t,c)*exp(- AEEI(t,c));
e(t+1,c)                 =     epsi(t,c) * y_net(t,c);
E_dice(t+1,c)            =     e(t+1,c) / 1000;

*** Sea level equations ***
SL(t+1)                  =     (1 - 1/(SLR_par_gl("SL_eft_rho"))) * SL(t) +
                                SLR_par_gl("SL_temp_sensitivity") * temp(t+1);

SLR(t+1)                 =     SL(t+1) - SL(t);


*** Dryland ***
CD_potential(t+1,c)      =     min(SLR_par_c(c, "dryland_loss") * SL(t+1)**(SLR_par_c(c, "DEM")), SLR_par_c(c, "area_2000"));

D_potential(t+1,c)       =     CD_potential(t+1,c) - CD_actual(t,c);

D_actual(t+1,c)          =     (1 - Protection(t+1,c)) * D_potential(t+1,c);

CD_actual(t+1,c)         =     CD_actual(t,c) + D_actual(t+1,c);

VD(t+1,c)                =     SLR_par_gl("land_value") *
                                (Y_gross(t+1,c) / Area(t+1,c) / SLR_par_gl("income_density")) ** 
                                    SLR_par_gl("land_value_elasticity");


*** Wetland ***
W(t+1, c)                =     SLR_par_c(c, "wetland_loss_SLR") * SLR(t+1) +
                                SLR_par_c(c, "wetland_loss_coastalsqueeze") * Protection(t+1, c) * SLR(t+1);

CW(t+1, c)               =     min(CW(t, c) + W(t, c), SLR_par_c(c, "exposed_wetland"));

VW(t+1, c)               =     21 * SLR_par_gl("W_service_value") *
                                (Y_pc(t+1,c)/SLR_par_gl("W_income_normalization")) ** 
                                    SLR_par_gl("WV_income_elasticity") *
                                (P_dens(t+1,c)/SLR_par_gl("W_popdens_normalization")) ** 
                                    SLR_par_gl("WV_popdens_elasticity") *
                                (1 - CW(t+1,c)/SLR_par_c(c, "W_1990")) **
                                    SLR_par_gl("WV_size_elasticity");


*** Protection costs ***
consump_term(t+1,c)      =     RHO + ETA * Y_pc_growth(t+1,c);

NPVVP(t+1,c)             =     (1 + consump_term(t+1,c)) / consump_term(t+1,c)
                                    * SLR_par_c(c, "coast_protection_cost") * SLR(t+1);

NPVVW(t+1,c)             =     W(t+1,c) * VW(t+1,c) * (1 + consump_term(t+1,c)) /
                                (consump_term(t+1,c) -
                                    SLR_par_gl("WV_income_elasticity") * Y_pc_growth(t+1,c) -
                                    SLR_par_gl("WV_popdens_elasticity") * Y_dens_growth(t+1,c) -
                                    SLR_par_gl("WV_size_elasticity") * (-W(t+1,c))
                                );

NPVVD(t+1,c)             =     D_potential(t+1,c) * VD(t+1,c) *
                                (1 + consump_term(t+1,c)) /
                                    (consump_term(t+1,c) - SLR_par_gl("DV_income_elasticity") * Y_dens(t+1,c));
    
Protection(t+1,c)        =     max(0, 1 - 0.5 * (NPVVP(t+1,c) + NPVVW(t+1,c))/NPVVD(t+1,c));

* Concluding evaluation
Area(t+1,c)              =     max(Area(t,c) - W(t+1,c) - D_actual(t+1,c), 0);
y_pc(t+1,c)              =     y_gross(t,c) / pop(t,c);
Y_pc_growth(t+1,c)       =     y_net(t+1,c) - y_net(t,c);
Y_dens(t+1,c)            =     y_gross(t+1,c) / Area(t+1,c);
Y_dens_growth(t+1,c)     =     y_dens(t+1,c) - y_dens(t,c);
P_dens(t+1,c)            =     pop(t+1,c) / Area(t+1,c);

* End loops
));

display SL, temp;
