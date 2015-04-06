$ontext
Authors:Anthony Gardella (Solow-Swan), Kevin Zheng (health and mortality)

Last Edit: 04/05/2015

COUNTRY INDEX
ARG        Argentina              GHA        Ghana         NGA        Nigeria
ARM        Armenia                GRC        Greece        NOR        Norway
AUS        Australia              GTM        Guatemala     OMN        Oman
AUT        Austria                GIN        Guinea        PAK        Pakistan
AZE        Azerbaijan             GNB        Guinea-Bissau PAN        Panama
BHS        Bahamas                HND        Honduras      PRY        Paraguay
BHR        Bahrain                HUN        Hungary       PER        Peru
BGD        Bangladesh             ISL        Iceland       PHL        Philippines
BRB        Barbados               IND        India         POL        Poland
BLR        Belarus                IDN        Indonesia     PRT        Portugal
BEL        Belgium                IRN        Iran          QAT        Qatar
BLZ        Belize                 IRQ        Iraq          ROU        Romania
BEN        Benin                  IRL        Ireland       RUS        Russia
BTN        Bhutan                 ISR        Israel        RWA        Rwanda
BOL        Bolivia                ITA        Italy         STP        Sao Tome and Principe
BIH        Bosnia and Herzegovina JAM        Jamaica       SAU        Saudi Arabia
BWA        Botswana               JPN        Japan         SEN        Senegal
BRA        Brazil                 JOR        Jordan        SRB        Serbia
BRN        Brunei                 KAZ        Kazakhstan    SLE        Sierra Leone
BGR        Bulgaria               KEN        Kenya         SGP        Singapore
BFA        Burkina Faso           KOR        Korea         SVK        Slovak Republic
BDI        Burundi                KWT        Kuwait        SVN        Slovenia
KHM        Cambodia               KGZ        Kyrgyzstan    ZAF        South Africa
CMR        Cameroon               LAO        Laos          ESP        Spain
CAN        Canada                 LVA        Latvia        LKA        Sri Lanka
CHL        Chile                  LBN        Lebanon       SDN        Sudan
CHN        China                  LSO        Lesotho       SUR        Suriname
COL        Colombia               LBR        Liberia       SWZ        Swaziland
COM        Comoros                LTU        Lithuania     SWE        Sweden
CRI        Costa Rica             LUX        Luxembourg    CHE        Switzerland
CIV        Cote d`Ivoire          MKD        Macedonia     SYR        Syria
HRV        Croatia                MDG        Madagascar    TJK        Tajikistan
CYP        Cyprus                 MWI        Malawi        TZA        Tanzania
CZE        Czech Republic         MYS        Malaysia      THA        Thailand
DNK        Denmark                MDV        Maldives      TGO        Togo
DJI        Djibouti               MLI        Mali          TTO        Trinidad & Tobago
DOM        Dominican Republic     MLT        Malta         TUN        Tunisia
ECU        Ecuador                MRT        Mauritania    TUR        Turkey
EGY        Egypt                  MUS        Mauritius     TKM        Turkmenistan
SLV        El Salvador            MEX        Mexico        UGA        Uganda
GNQ        Equatorial Guinea      MDA        Moldova       UKR        Ukraine
EST        Estonia                MNG        Mongolia      GBR        United Kingdom
ETH        Ethiopia               MNE        Montenegro    USA        United States
FJI        Fiji                   MAR        Morocco       URY        Uruguay
FIN        Finland                MOZ        Mozambique    UZB        Uzbekistan
FRA        France                 NAM        Namibia       VEN        Venezuela
GAB        Gabon                  NPL        Nepal         VNM        Vietnam
GMB        Gambia                 NLD        Netherlands   YEM        Yemen
GEO        Georgia                NZL        New Zealand   ZMB        Zambia
DEU        Germany                NER        Niger         ZWE        Zimbabwe

$offtext

$title    GE512 Integrated Assesment Model

sets
         t               time                    /2010,2015,2020,2025,2030,2035,2040,2045,2050,2055,2060,2065,2070,2075,2080,2085,2090,2095,2100/

         c               countries               /ARG,ARM,AUS,AUT,AZE,BHS,BHR,BGD,BRB,BLR,BEL,BLZ,BEN,BTN,BOL,BIH,BWA,BRA,BRN,BGR,BFA,BDI,KHM,CMR,CAN,CHL,CHN,COL,
COM,CRI,CIV,HRV,CYP,CZE,DNK,DJI,DOM,ECU,EGY,SLV,GNQ,EST,ETH,FJI,FIN,FRA,GAB,GMB,GEO,DEU,GHA,GRC,GTM,GIN,GNB,HND,HUN,ISL,IND,IDN,IRN,IRQ,IRL,ISR,ITA,JAM,JPN,JOR,
KAZ,KEN,KOR,KWT,KGZ,LAO,LVA,LBN,LSO,LBR,LTU,LUX,MKD,MDG,MWI,MYS,MDV,MLI,MLT,MRT,MUS,MEX,MDA,MNG,MNE,MAR,MOZ,NAM,NPL,NLD,NZL,NER,NGA,NOR,OMN,PAK,PAN,PRY,PER,PHL,POL,
PRT,QAT,ROU,RUS,RWA,STP,SAU,SEN,SRB,SLE,SGP,SVK,SVN,ZAF,ESP,LKA,SDN,SUR,SWZ,SWE,CHE,SYR,TJK,TZA,THA,TGO,TTO,TUN,TUR,TKM,UGA,UKR,GBR,USA,URY,UZB,VEN,VNM,YEM,ZMB,ZWE
/
         r regions / USA, CAN, WEU, JPK, ANZ, CEE, FSU, MDE, CAM, SAM, SAS, SEA, CHI, NAF, SSA, SIS/

         rcmap(*,*) regional map /
         USA.(USA)
         CAN.(CAN)
         WEU.(AUT, BEL, CYP, DNK, FIN, FRA, DEU, GRC, ISL, IRL, ITA, LUX,
              MLT, NLD, NOR, PRT, ESP, SWE, CHE, GBR)
         JPK.(JPN, KOR)
         ANZ.(AUS, NZL)
         CEE.(BIH, BGR, HRV, CZE, HUN, MKD, POL, ROU, SVK, SVN)
         FSU.(ARM, AZE, BLR, EST, GEO, KAZ, KGZ, LVA, LTU, MDA, RUS, TJK,
              TKM, UKR, UZB)
         MDE.(BHR, IRN, IRQ, ISR, JOR, KUW, LBN, OMN, QAT, SAU, SYR, TUR, YEM)
         CAM.(BLZ, CRI, SLV, GTM, HND, MEX, PAN)
         SAM.(ARG, BOL, BRA, CHL, COL, ECU, PRY, PER, SUR, URY, VEN)
         SAS.(BGD, BTN, IND, NPL, PAK, LKA)
         SEA.(BRN, KHM, IND, LAO, MYS, PHL, SGP, THA, VNM)
         CHI.(CHN, MNG)
         NAF.(EGY, MAR, TUN)
         SSA.(BEN, BWA, BFA, BDI, CMR, CIV, DJI, GNQ, ETH, GAB, GMB, GHA, GIN,
              GNB, KEN, LSO, LBR, MDG, MWI, MLI, MRT, MOZ, NAM, NER, NGA,
              RWA, SEN, SLE, ZAF, SDN, SWZ, TZA, TGO, ZMB, ZWE)
         SIS.(BHS, BRB, COM, DOM, FJI, JAM, MDV, MUS, STP, TTO)
         /;


parameters

*Solow-Swan parameters

         k(t,c)       capital
         i(t,c)       investment
         s(c)         savings
         y_gross(t,c) output
         y_net(t,c)
         y_percapita(t,c) per capita income
         e(t,c)       emissions series
         a(t,c)       tech
         l(t,c)       labor
         nyper        timestep                                      /5/
         lshr         labor share                                   /0.66/
         AEEI         Autonomous energy emissionintensity
         delta        depreciation                                  /0.05/
         omega        damage                                        /0.05/
         prodgr       productivity growth coefficient               /0.02/
         pro          productivity trend
         epsi         energy intensity

*DICE Carbon model

        b12        Carbon cycle transition matrix                         /.088/
        b23        Carbon cycle transition matrix                         /0.00250/
        c1beta     Regression slope coefficient(SoA~Equil TSC)            /0.01243/
        c10        Initial climate equation coefficient for upper level   /0.098/
        c3         Transfer coefficient upper to lower stratum            /0.088/
        c4         Transfer coefficient for lower level                   /0.025/
        fco22x     Forcings of equilibrium CO2 doubling (Wm-2)            /3.8/
        mateq      Equilibrium concentration atmosphere  (GtC)            /588/
        mleq       Equilibrium concentration in lower strata (GtC)        /10000/
        mueq       Equilibrium concentration in upper strata (GtC)        /1350/
        t2xco2     Equilibrium temp impact (oC per doubling CO2)          /2.9/
        tstep      Time Step                                              /5/
        b11        Carbon cycle transition matrix
        b21        Carbon cycle transition matrix
        b22        Carbon cycle transition matrix
        b32        Carbon cycle transition matrix
        b33        Carbon cycle transition matrix
        c1         Climate equation coefficient for upper level
        FORC(t)    Forcing Equation
        MAT(t)     Atmospheric concentration equation
        ML(t)      Lower ocean concentration
        MU(t)      Shallow ocean concentration
        TATM(t)    Temperature-climate equation for atmosphere
        TOCEAN(t)  Temperature-climate equation for lower ocean

*Health parameters section
$ontext
         temp(t) global mean temperature /
                  2010        11.6989
                  2015        11.8373
                  2020        12.1969
                  2025        12.3194
                  2030        12.2645
                  2035        12.2202
                  2040        12.5091
                  2045        12.572
                  2050        12.5642
                  2055        12.8808
                  2060        12.9086
                  2065        13.1473
                  2070        13.2911
                  2075        13.1729
                  2080        13.1218
                  2085        13.3003
                  2090        13.7775
                  2095        13.4196
                  2100        13.338     /
$offtext

         preindustrial_temp degrees C based on scenario 42 /10.9985/
         reg_temp(t,c) regional mean temperature
         reg_temp_dif(t,c) regional temperature difference from preindustrial
         deaths_diarrhea(t,c) deaths due to diarrhea
         deaths_vector total deaths due to vector borne diseases
         deaths_vector_malaria_rate (t,c) deaths rate due to malaria
         deaths_vector_dengue_rate (t,c) deaths rate due to dengue fever
         deaths_vector_schis_rate (t,c) deaths rate due to schistosomiasis
         deaths_vector_malaria (t,c) deaths due to malaria
         deaths_vector_dengue (t,c) deaths due to dengue fever
         deaths_vector_schis (t,c) deaths due to schistosomiasis
         value_life(t,c) value of a statisical life
         value_year_morb(t,c) value of a year of morbidity
         change_cardio_res_hot_over65(t,c) climate induced mortality per 100000
         change_cardio_res_hot_under65(t,c)
         change_cardio_res_cold_over65(t,c)
         change_cardio_res_cold_under65(t,c)
         deaths_cardio_res_heat(t,c) deaths due to heat related cardio-respiratory
         deaths_cardio_res_cold(t,c) deaths due to cold related cardio-respiratory
         total_loss_health(t,c) total $ lost due to deaths from climate change

         Country_Tol_regional_temp(c)
         Country_Tol_heat_over65_1(c)
         Country_Tol_heat_over65_2(c)
         Country_Tol_heat_over65_1mort(c)
         Country_Tol_heat_over65_2mort(c)
         Country_Tol_heat_under65_1(c)
         Country_Tol_heat_under65_2(c)
         Country_Tol_heat_under65_1mort(c)
         Country_Tol_heat_under65_2mort(c)
         Country_Tol_cold_over65_1(c)
         Country_Tol_cold_over65_2(c)
         Country_Tol_cold_over65_1mort(c)
         Country_Tol_cold_over65_2mort(c)
         Country_Tol_cold_under65_1(c)
         Country_Tol_cold_under65_2(c)
         Country_Tol_cold_under65_1mort(c)
         Country_Tol_cold_under65_2mort(c)
         Country_Tol_diarrhea(c)

         global_param_health(*)  Tol parameters /
                 "income_elas_diarrhea_mort"               -1.58
                 "diarrhea_mort_response_warming"           1.14
                 "deg_nonlinearity_mortality_in_warming"    1.00
                 "income_elas_vector_mort"                 -2.65
                 "mort_morb_no_description_1"               4992523
                 "mort_morb_no_description_2"               19970
                 "normalization_constant"                   24963
                 "income_elas_value_of_life"                1.00
                 "income_elas_value_of_year_morb"           1.00
                 "malaria_param"                            0.0794
                 "dengue_param"                             0.3534
                 "schistosomiasis_param"                   -0.1149
         /;

table rcpem(*,*) "Emissions"
                 2010         2020          2030          2040         2050        2060         2070         2080         2090        2100
Rcp6            9.389        9.357         9.438        10.840        12.58      14.566       16.477       17.525       14.556      13.935
Rcp45           9.518       10.212        11.170        11.537       11.280       9.585        7.222        4.190        4.220       4.249
Rcp26           9.878       10.260         7.946         5.024        3.387       2.034        0.654        0.117       -0.268      -0.420
Rcp85           9.969       12.444        14.554        17.432       20.781      24.097       26.374       27.715       28.531      28.817
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

*health and mortality related tables
table regional_health(r,*)
$ondelim onlisting
$include 'regional_health.csv'
$offdelim offlisting
;

table country_rate(c,*)
$ondelim onlisting
$include 'country_health.csv'
$offdelim offlisting
;

*Solow- Swan

         k("2010",c)       =    initparam("k",c);
         s(c)              =    0.01 * initparam("s",c);
         y_gross("2010",c) =    initparam("y",c);
         l(t,c)            =    pop(t,c);
         a("2010",c)       =    y_gross("2010",c) / [ l("2010",c)**lshr * k("2010",c)**(1 - lshr)];
         AEEI(t,c)         =    0.01 * 1;
         pro(t,c)          =    a("2010",c) * exp(prodgr*ord(t)-1);
         e("2010",c)       =    initparam("e",c);
         epsi("2010",c)    =    y_gross("2010",c)/e("2010",c);

*DICE Carbon

        E(t,c) = rcpem("Rcp85",t);
        tocean("2010") = .0068;
        tatm("2010") = 0.80;
        mat("2010") = 830.4;
        mu("2010")=1527;
        ml("2010")=10010;
        b11 = 1 - b12;
        b21 = b12*MATEQ/MUEQ;
        b22 = 1 - b21 - b23;
        b32 = b23*mueq/mleq;
        b33 = 1 - b32 ;
        c1 =  c10 + c1beta*(t2xco2-2.9);

*health

         Country_Tol_regional_temp(c) = sum(r$rcmap(r,c), regional_health(r,"reg_temp_conversion"));
         Country_Tol_heat_over65_1(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_1"));
         Country_Tol_heat_over65_2(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_2"));
         Country_Tol_heat_over65_1mort(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_1mort"));
         Country_Tol_heat_over65_2mort(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_2mort"));
         Country_Tol_heat_under65_1(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_1"));
         Country_Tol_heat_under65_2(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_2"));
         Country_Tol_heat_under65_1mort(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_1mort"));
         Country_Tol_heat_under65_2mort(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_2mort"));
         Country_Tol_cold_over65_1(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_1 "));
         Country_Tol_cold_over65_2(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_2"));
         Country_Tol_cold_over65_1mort(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_1mort"));
         Country_Tol_cold_over65_2mort(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_2mort"));
         Country_Tol_cold_under65_1(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_1"));
         Country_Tol_cold_under65_2(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_2"));
         Country_Tol_cold_under65_1mort(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_1mort"));
         Country_Tol_cold_under65_2mort(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_2mort"));
         Country_Tol_diarrhea(c) = sum(r$rcmap(r,c), regional_health(r,"diarrhea"));

;

loop(t,
*GLOBAL Solow-Swan economic growth model

         y_gross(t+1,c)=pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);
         y_net(t,c) = (1-omega)*y_gross(t,c);
         i(t,c)=s(c)*y_net(t,c)*nyper;
         k(t+1,c)=i(t,c)+(1-delta)**nyper * k (t,c);
         epsi(t+1,c)= epsi(t,c)*exp(- AEEI(t,c));
         e(t+1,c)=epsi(t,c) * y_net(t,c);

*DICE Carbon

*Need to change 10 in MAT(t+1) back to E
   FORC(t) = fco22x * ((log((MAT(t)/588.000))/log(2)));
   MAT(t+1) = MAT(t)*b11 + MU(t)*b21 + e(t,c)*(5/3.666);
   ML(t+1) = ML(t)*b33  + MU(t)*b23;
   MU(t+1) = MAT(t)*b12 + MU(t)*b22 + ML(t)*b32;
   TATM(t+1) = TATM(t) + c1 * ((FORC(t)-(fco22x/t2xco2)*TATM(t))-(c3*(TATM(t)-TOCEAN(t))));
   TOCEAN(t+1) = TOCEAN(t) + c4*(TATM(t)-TOCEAN(t));

*health

         y_percapita(t,c) = y_net(t,c) / pop(t,c);
         reg_temp(t,c) = (preindustrial_temp + TATM(t)) * Country_Tol_regional_temp(c);
         reg_temp_dif(t,c) = TATM(t) * Country_Tol_regional_temp(c);

*DIARRHEA - currently using FUND regional mortality rates from table HD.3

deaths_diarrhea(t,c) = Country_Tol_diarrhea(c) *
         pop(t,c) * (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_diarrhea_mort") *
         (reg_temp(t,c) / preindustrial_temp)**
         global_param_health("diarrhea_mort_response_warming");

*VECTOR BORNE

*outputs deaths per thousand
deaths_vector_malaria_rate(t,c) = country_rate(c,"malaria")
         * global_param_health("malaria_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_dengue_rate(t,c) = country_rate(c,"dengue")
         * global_param_health("dengue_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_schis_rate(t,c) = country_rate(c,"schistosomiasis")
         * global_param_health("schistosomiasis_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_malaria(t,c) = deaths_vector_malaria_rate(t,c) * pop(t,c) * 1000;

deaths_vector_dengue(t,c) = deaths_vector_dengue_rate(t,c) * pop(t,c) * 1000;

deaths_vector_schis(t,c) = deaths_vector_schis_rate(t,c) * pop(t,c) * 1000;

deaths_vector(t,c) = deaths_vector_malaria(t,c) + deaths_vector_dengue(t,c)+
         deaths_vector_schis(t,c);

*MORBIDITY AND MORTALITY

value_life(t,c) = global_param_health("mort_morb_no_description_1") *
         (y_percapita(t,c) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_life");

value_year_morb(t,c) = global_param_health("mort_morb_no_description_2") *
         (y_percapita(t,c) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_year_morb");

*CARDIOVASCULAR AND RESPIRATORY

change_cardio_res_hot_over65(t,c) = Country_Tol_heat_over65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_heat_over65_2(c) * reg_temp_dif(t,c)** 2;

change_cardio_res_hot_under65(t,c) = Country_Tol_heat_under65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_heat_under65_2(c) * (reg_temp_dif(t,c))** 2;

deaths_cardio_res_heat(t,c) = (change_cardio_res_hot_over65(t,c) +
         change_cardio_res_hot_under65(t,c)) * pop(t,c) / 100000 ;

change_cardio_res_cold_over65(t,c) = Country_Tol_cold_over65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_cold_over65_2(c) * reg_temp_dif(t,c)**2;

change_cardio_res_cold_under65(t,c) = Country_Tol_cold_under65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_cold_under65_2(c) * reg_temp_dif(t,c)**2;

deaths_cardio_res_cold(t,c) = (change_cardio_res_cold_over65(t,c) +
         change_cardio_res_cold_under65(t,c)) * pop(t,c) / 100000 ;

*TOTAL VALUE $ LOST DUE TO CLIMATE CHANGE

total_loss_health(t,c) = (deaths_diarrhea(t,c) + deaths_vector(t,c) +
         deaths_cardio_res_heat(t,c) + deaths_cardio_res_cold(t,c)) *
         value_life(t,c);
*Missing/unsure how to incorporate urban factor from equation HC.3
);

display total_loss_health;
display reg_temp;
display deaths_diarrhea;
display deaths_vector;
display deaths_cardio_res_heat;
display deaths_cardio_res_cold;
