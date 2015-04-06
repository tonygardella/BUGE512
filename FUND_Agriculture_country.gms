$ontext
FUND  Agriculture
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

parameter

*General states
temp(t)         "Temperature in C"
temp_r(t,c)     "Regional temp in C"
CO(t)           "CO2 concentration"

DT(t)           "Change in temperature"
DT_r(t,c)       "Change in regional mean temp"
CT(t)           "Change in global mean temp. rel to 2010"
CRT(t,c)        "Change in reg. mean temp. rel. to 2010"

A(t,c)          "Impacts on Agriculture"
Ar(t,c)         "Impacts due to rate of CC"
Al(t,c)         "Impacts due to level of CC"
Af(t,c)         "Impacts from carbon dioxide fertilization"

ag_par_cntry(c,*) "country version"


ag_par_glob(*)/
$ondelim
$include ag_par_glob.txt
$offdelim
/;

Table carbon(t,*)                "Input from DICE carbon model"
$ondelim onlisting
$include 'DICE_Carbon.csv'
$offdelim offlisting
;

*SECTOR TABLES
Table   ag_par_reg(r,*)          "Regional parameters for agriculture"
$ondelim onlisting
$include 'ag_par_reg.csv'
$offdelim offlisting
;

Table   shr_ag(c,*)               "Share of agr. production in total income, per country"
$ondelim onlisting
$include 'ag_gdpshare_cc.csv'
$offdelim offlisting
;

*Initialization
DT("2010")          =       0;
DT_r("2010",c)      =       0;
*which value to use?
Ar("2010",c)        =       -0.001;

*Region to country mapping
ag_par_cntry(c,"alpha") = sum(rcmap(r,c), ag_par_reg(r,"alpha"));
ag_par_cntry(c,"deltal") = sum(rcmap(r,c), ag_par_reg(r,"deltal"));
ag_par_cntry(c,"deltaq") = sum(rcmap(r,c), ag_par_reg(r,"deltaq"));
ag_par_cntry(c,"gamma") = sum(rcmap(r,c), ag_par_reg(r,"gamma"));


loop(t,
*GENERAL
temp(t)             =       13.78 + carbon(t,"TATM");
temp_r(t,c)         =       13.78 + carbon(t,"TATM");

*CO2 concentration in 2010 in PPMV
CO(t)               =       (carbon(t,"MAT")/2.13) + (3.66*280);
DT(t)               =       temp(t)- temp(t-1);
DT_r(t,c)           =       temp_r(t,c)- temp_r(t-1,c);
CT(t)               =       temp(t) - temp("2010");
CRT(t,c)            =       temp_r(t,c) - temp_r("2010",c);

*AGRICULTURE
Ar(t,c)             =       ag_par_cntry(c,"alpha") * (DT_r(t,c)/0.04)**ag_par_glob("B") + (1-(1/ag_par_glob("p"))) * Ar(t-1,c);
Al(t,c)             =       ag_par_cntry(c,"deltal") * CRT(t,c) + ag_par_cntry(c,"deltaq") * (CRT(t,c)**2);
Af(t,c)             =       ag_par_cntry(c,"gamma") * log(CO(t)/275);
A(t,c)              =       Ar(t,c) + Al(t,c) + Af(t,c);

*Not interacting with other equations yet, loaded table of UN gdp share of agriculture
*shr_ag(t,r)          =     (gap_y("2010",r)/GDP("2010",r)) * (Y_pc("2010",r)/Y_pc(t,r))**ag_par_glob("epsilon");
);

display Ar,Al,Af,A;

