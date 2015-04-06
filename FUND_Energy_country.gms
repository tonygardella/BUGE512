$ontext
FUND  Energy
Author: Paulo Arevalo

CO2 concentrations must be provided in PPMV, hence the calculations
in the first part of the loop
$offtext

set t    time       /2010,2015,2020,2025,2030,2035,2040,2045,2050,2055,2060,2065,2070,2075,2080,2085,2090,2095,2100/
set r    regions    /USA,CAN,WEU,JPK,ANZ,EEU,FSU,MDE,CAM,SAM,SAS,SEA,CHI,NAF,SSA,SIS/
set c    countries  /ARG,ARM,AUS,AUT,AZE,BHS,BHR,BGD,BRB,BLR,BEL,BLZ,BEN,BTN,BOL,BIH,BWA,BRA,BRN,BGR,BFA,BDI,KHM,CMR,CAN,CHL,CHN,COL,
COM,CRI,CIV,HRV,CYP,CZE,DNK,DJI,DOM,ECU,EGY,SLV,GNQ,EST,ETH,FJI,FIN,FRA,GAB,GMB,GEO,DEU,GHA,GRC,GTM,GIN,GNB,HND,HUN,ISL,IND,IDN,IRN,IRQ,IRL,ISR,ITA,JAM,JPN,JOR,
KAZ,KEN,KOR,KWT,KGZ,LAO,LVA,LBN,LSO,LBR,LTU,LUX,MKD,MDG,MWI,MYS,MDV,MLI,MLT,MRT,MUS,MEX,MDA,MNG,MNE,MAR,MOZ,NAM,NPL,NLD,NZL,NER,NGA,NOR,OMN,PAK,PAN,PRY,PER,PHL,POL,
PRT,QAT,ROU,RUS,RWA,STP,SAU,SEN,SRB,SLE,SGP,SVK,SVN,ZAF,ESP,LKA,SDN,SUR,SWZ,SWE,CHE,SYR,TJK,TZA,THA,TGO,TTO,TUN,TUR,TKM,UGA,UKR,GBR,USA,URY,UZB,VEN,VNM,YEM,ZMB,ZWE
/

rcmap(*,*) regional map /
         USA.(USA)
         CAN.(CAN)
         WEU.(AUT, BEL, CYP, DNK, FIN, FRA,DEU, GRC, ISL, IRL, ITA,LUX,
              MLT,NLD, NOR, PRT,ESP, SWE, CHE, GBR)
         JPK.(JPN,KOR)
         ANZ.(AUS, NZL)
         CEE.(BIH,BGR,HRV,CZE,HUN,MKD, POL,ROU,SVK,SVN)
         FSU.(ARM, AZE, BLR, EST, GEO, KAZ,KGZ, LVA, LTU, MDA,RUS, TJK,
              TKM, UKR, UZB)
         MDE.(BHR, IRN, IRQ, ISR, JOR, KUW, LBN, OMN,QAT,SAU, SYR, TUR,YEM)
         CAM.(BLZ, CRI, SLV, GTM, HND, MEX, PAN)
         SAM.(ARG, BOL, BRA, CHL, COL, ECU,PRY,PER,SUR,URY,VEN)
         SAS.(BGD, BTN, IND, NPL, PAK,LKA)
         SEA.(BRN, KHM, IND, LAO, MYS, PHL, SGP, THA, VNM)
         CHI.(CHN, MNG)
         NAF.( EGY, MAR, TUN)
         SSA.(BEN, BWA, BFA, BDI,CMR, CIV,DJI,GNQ, ETH, GAB, GMB, GHA, GIN,
              GNB, KEN, LSO, LBR, MDG, MWI,MLI, MRT, MOZ, NAM, NER, NGA,
              RWA, SEN, SLE, ZAF, SDN,SWZ, TZA, TGO, ZMB, ZWE)
         SIS.(BHS, BRB,COM,DOM,FJI,JAM,MDV,MUS, STP, TTO)
         /;

parameters
*Climate
         temp(t)         "Temperature in C"
         temp_r(t,c)     "Regional temp in C"
         CO(t)           "CO2 concentration"
         DT(t)           "Change in temperature"
         DT_r(t,c)       "Change in regional mean temp"
         CT(t)           "Change in global mean temp. rel to 2010"
         CRT(t,c)        "Change in reg. mean temp. rel. to 2010"

         Y_pc(t,c)       "Income per capita"

         energ_par_cntry(c,*)
         SH(t,c)         "Space heating"
         SC(t,c)         "Space cooling"

         aeei_cntry(t,c)

energ_par_glob(*)/
$ondelim
$include energ_par_glob.txt
$offdelim
/;

Table energ_par_reg(r,*)          "Regional parameters for energy"
$ondelim onlisting
$include 'energ_par_reg.csv'
$offdelim offlisting
;

Table aeeidata(t,r)               "Autonomous Energy Efficiency Improvement"
$ondelim onlisting
$include 'AEEI_FUND_table.csv'
$offdelim offlisting
;

parameters
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

         k("2010",c)       =     initparam("k",c);

         s(c)              =     0.01 * initparam("s",c);

         y_gross("2010",c) =     initparam("y",c);

         l(t,c)            =     pop(t,c);

         a("2010",c)       =     y_gross("2010",c) / [ l("2010",c)**lshr * k("2010",c)**(1 - lshr)];

         AEEI(t,c)         =     0.01 * 1;

         e("2010",c)       =    initparam("e",c);

         epsi("2010",c)    =     y_gross("2010",c)/e("2010",c);

         pro(t,c)          =    a("2010",c) * exp(prodgr*ord(t)-1);

        ;



Table carbon(t,*)                "Input from DICE carbon model"
$ondelim onlisting
$include 'DICE_Carbon.csv'
$offdelim offlisting
;


*Initialization
DT("2010")          =       0;
DT_r("2010",c)      =       0;
energ_par_cntry(c,"aheat") = sum(rcmap(r,c), energ_par_reg(r,"aheat"));
energ_par_cntry(c,"acool") = sum(rcmap(r,c), energ_par_reg(r,"acool"));
aeei_cntry(t,c) = sum(rcmap(r,c), aeeidata(t,r));


loop(t,

*GENERAL

temp(t)             =       13.78 + carbon(t,"TATM");
temp_r(t,c)         =       13.78 + carbon(t,"TATM");

*CO2 concentration in 2010 in PPMV
DT(t)               =       temp(t)- temp(t-1);
DT_r(t,c)           =       temp_r(t,c)- temp_r(t-1,c);
CT(t)               =       temp(t) - temp("2010");
CRT(t,c)            =       temp_r(t,c) - temp_r("2010",c);

*ECONOMY
y_gross(t+1,c)=pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);
y_net(t,c)= (1-omega)*y_gross(t,c);
i(t,c)=s(c)*y_net(t,c)*nyper;
k(t+1,c)=i(t,c)+(1-delta)**nyper *k(t,c);
epsi(t+1,c)= epsi(t,c)*exp(- AEEI(t,c));
e(t+1,c)=epsi(t,c) * y_net(t,c);

Y_pc(t,c)           =       Y_gross(t,c)/pop(t,c);

*ENERGY
SH(t,c)             =       (energ_par_cntry(c,"aheat") * Y_gross("2010",c) * (arctan(CT(t))/arctan(1)) *
                            (Y_pc(t,c)/Y_pc("2010",c))**energ_par_glob("epsilon") *
                            (pop(t,c)/pop("2010",c))) / (aeei_cntry(t,c) * (1 + energ_par_glob("tr"))**t);
SC(t,c)             =       (energ_par_cntry(c,"acool") * Y_gross("2010",c) * (CT(t))**energ_par_glob("beta") *
                            (Y_pc(t,c)/Y_pc("2010",c))**energ_par_glob("epsilon") *
                            (pop(t,c)/pop("2010",c))) / (aeei_cntry(t,c) * (1 + energ_par_glob("tr"))**t);
);

display SH, SC;