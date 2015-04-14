$ontext
Authors:Anthony Gardella (Solow-Swan), Kevin Zheng (health and mortality)

Last Edit: 04/14/2015

$offtext

$title    GE512 Integrated Assesment Model

$ontext
--------
COMMENTS
--------

Updated with minor changes in converting each of Tol's formulas to a single
number of additional deaths associated with climate change. Got the population
denisty and urbanization factor to run. Integrated some of the other mosaic
pieces. However, ran into an issue with the common.gms file.

Results are still unusual... showing that climate change will decrease GDP
associated with the change in deaths. Additional diarrheal related deaths drops
significantly frmo 2015-2020 and is practically non-existant as time passes.
This will unlikely be the case as it should be tied in with water resources.
The urbanization factor seems a bit high but is only ties down the increase in
heat related deaths. Cold-related deaths decrease much more than the heat
related deaths increase accouting for the increase in GDP. Increase in vector-
borne diseases is non-existent. Each of the rates is extremely small and
schiostosomasis is actually negative.

Areas that need to be looked at:
         1) vector-borne
         2) diarrheal
         3) integrating other mosaics


$offtext


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

*MOSAIC FILES
$ONTEXT
$include mosaic_common_dec.gms
$include mosaic_economy_exe.gms
$offtext

$include mosaic_economy_dec.gms
$include mosaic_carbon_dec.gms

parameters
         y_percapita(t,c)

*DICE Carbon model - mosaic file missing emissions?
         Emissions(t)

*Health parameters section

         preindustrial_temp degrees C based on scenario 42 /13.78/
         reg_temp(t,c) regional mean temperature
         reg_temp_dif(t,c) regional temperature difference from preindustrial
         deaths_diarrhea(t,c) additional diarrheal deaths due to climate change
         deaths_vector additional vector borone deaths due to climate change
         deaths_vector_malaria_rate (t,c) change in malara deaths rate
         deaths_vector_dengue_rate (t,c) change in dengue fever deaths rate
         deaths_vector_schis_rate (t,c) change in schistosomisis deaths rate
         deaths_vector_malaria (t,c) additional malaria deaths
         deaths_vector_dengue (t,c) additional dengue fever deaths
         deaths_vector_schis (t,c) additional schistosomiasis deaths
         value_life(t,c) value of a statisical life
         value_year_morb(t,c) value of a year of morbidity
         change_cardio_res_hot_over65(t,c) Tol parameters climate induced mortality per 100000
         change_cardio_res_hot_under65(t,c) Tol parameters climate induced mortality per 100000
         change_cardio_res_cold_over65(t,c) Tol parameters climate induced mortality per 100000
         change_cardio_res_cold_under65(t,c) Tol parameters climate induced mortality per 100000
         deaths_cardio_res_heat(t,c) additional heat related cardio-respiratory deaths
         deaths_cardio_res_cold(t,c) additional cold related cardio-respiratory deaths
         total_loss_health(t,c) total $ damages due to climate change related deaths
         P_dens(t,c) population density
         area(c) country area
         urbanization(t,c) percentage of population living in cities

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
                 "urbanization_param_1"                     0.031
                 "urbanization_param_2"                    -0.011
         /;

table rcpem(*,*) "Emissions"
                 2010         2020          2030          2040         2050        2060         2070         2080         2090        2100
Rcp6            9.389        9.357         9.438        10.840        12.58      14.566       16.477       17.525       14.556      13.935
Rcp45           9.518       10.212        11.170        11.537       11.280       9.585        7.222        4.190        4.220       4.249
Rcp26           9.878       10.260         7.946         5.024        3.387       2.034        0.654        0.117       -0.268      -0.420
Rcp85           9.969       12.444        14.554        17.432       20.781      24.097       26.374       27.715       28.531      28.817
;

*health and mortality related tables
table regional_health(r,*)
$ondelim onlisting
$include 'regional_health.csv'
$offdelim offlisting
;

table country_rate(c,*) death rates per 100000
$ondelim onlisting
$include 'country_health.csv'
$offdelim offlisting
;

*DICE Carbon

        Emissions(t) = rcpem("Rcp85",t);

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
         pro(t,c)= a("2010",c) * exp(prodgr*ord(t)-1);
         a(t,c)= y_gross(t,c) / [ l(t,c)**lshr * k(t,c)**(1 - lshr)];
         y_gross(t,c)=pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);

* for now  y_gross=y_net
         y_net(t,c)= y_gross(t,c);
         i(t,c)=s(c)*y_net(t,c)*nyper;
         k(t+1,c)=i(t,c)+(1-delta)**nyper *k(t,c);
         ei(t,c)= eii("2010",c)*exp(- aeei(t,c)*ord(t)-1);
         e(t,c)=(ei(t,c) * y_net(t,c))/ 10**9;
         te(t)       =    sum( c, e(t,c));

*DICE Carbon

   FORC(t) = fco22x * ((log((MAT(t)/588.000))/log(2)));
   MAT(t+1) = MAT(t)*b11 + MU(t)*b21 + Emissions(t)*(5/3.666);
   ML(t+1) = ML(t)*b33  + MU(t)*b23;
   MU(t+1) = MAT(t)*b12 + MU(t)*b22 + ML(t)*b32;
   TATM(t+1) = TATM(t) + c1 * ((FORC(t)-(fco22x/t2xco2)*TATM(t))-(c3*(TATM(t)-TOCEAN(t))));
   TOCEAN(t+1) = TOCEAN(t) + c4*(TATM(t)-TOCEAN(t));

*health

         y_percapita(t,c) = y_net(t,c) / pop(t,c);
         reg_temp(t,c) = (preindustrial_temp + TATM(t)) * Country_Tol_regional_temp(c);
         reg_temp_dif(t,c) = TATM(t) * Country_Tol_regional_temp(c);

         area(c) = country_rate(c,"area");
         P_dens(t,c) = (pop(t,c) * 1000) / area(c);

         urbanization(t,c) = ((global_param_health("urbanization_param_1")*sqrt(y_percapita(t,c)))
                  + (global_param_health("urbanization_param_2")*sqrt(P_dens(t,c))))/
                 (1 + global_param_health("urbanization_param_1")*sqrt(y_percapita(t,c))
                  + (global_param_health("urbanization_param_2")*sqrt(P_dens(t,c))));

*DIARRHEA

deaths_diarrhea(t,c) = (country_rate(c,"diarrhea")/1000) *
         pop(t,c) * (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_diarrhea_mort") *
         (reg_temp(t,c) / preindustrial_temp)**
         global_param_health("diarrhea_mort_response_warming");

*VECTOR BORNE

deaths_vector_malaria_rate(t,c) = (country_rate(c,"malaria")*10)
         * global_param_health("malaria_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_dengue_rate(t,c) = (country_rate(c,"dengue")*10)
         * global_param_health("dengue_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_schis_rate(t,c) = (country_rate(c,"schistosomiasis")*10)
         * global_param_health("schistosomiasis_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_malaria(t,c) = deaths_vector_malaria_rate(t,c) * pop(t,c) / 1000;

deaths_vector_dengue(t,c) = deaths_vector_dengue_rate(t,c) * pop(t,c) / 1000;

deaths_vector_schis(t,c) = deaths_vector_schis_rate(t,c) * pop(t,c) / 1000;

deaths_vector(t,c) = deaths_vector_malaria(t,c) + deaths_vector_dengue(t,c)+
         deaths_vector_schis(t,c);

*CARDIOVASCULAR AND RESPIRATORY

change_cardio_res_hot_over65(t,c) = (Country_Tol_heat_over65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_heat_over65_2(c) * reg_temp_dif(t,c)** 2)* pop(t,c) / 100 ;

change_cardio_res_hot_under65(t,c) = (Country_Tol_heat_under65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_heat_under65_2(c) * (reg_temp_dif(t,c))** 2) * pop(t,c) / 100 ;

deaths_cardio_res_heat(t,c) = (change_cardio_res_hot_over65(t,c) + change_cardio_res_hot_under65(t,c)) * urbanization(t,c);

change_cardio_res_cold_over65(t,c) = (Country_Tol_cold_over65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_cold_over65_2(c) * reg_temp_dif(t,c)**2) * pop(t,c) / 100;

change_cardio_res_cold_under65(t,c) = (Country_Tol_cold_under65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_cold_under65_2(c) * reg_temp_dif(t,c)**2) * pop(t,c) / 100;

deaths_cardio_res_cold(t,c) = change_cardio_res_cold_over65(t,c) + change_cardio_res_cold_under65(t,c);

*MORBIDITY AND MORTALITY

value_life(t,c) = global_param_health("mort_morb_no_description_1") *
         (y_percapita(t,c) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_life");

value_year_morb(t,c) = global_param_health("mort_morb_no_description_2") *
         (y_percapita(t,c) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_year_morb");

*TOTAL DAMAGES LOST DUE TO CLIMATE CHANGE

total_loss_health(t,c) = (deaths_diarrhea(t,c) + deaths_vector(t,c) +
         deaths_cardio_res_heat(t,c) + deaths_cardio_res_cold(t,c)) *
         value_life(t,c);

);

display total_loss_health;
display deaths_diarrhea;
display deaths_vector;
display deaths_cardio_res_heat;
display deaths_cardio_res_cold;

display deaths_vector_malaria;
display deaths_vector_dengue;
display deaths_vector_schis;
display deaths_vector_malaria_rate;
display deaths_vector_dengue_rate;
display deaths_vector_schis_rate;

display value_life;
display urbanization;
