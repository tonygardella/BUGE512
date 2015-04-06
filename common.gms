* Common declarations for all models

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

set r    regions    /USA,CAN,WEU,JPK,ANZ,EEU,FSU,MDE,CAM,SAM,SAS,SEA,CHI,NAF,SSA,SIS/
set c    countries  / ARG,ARM,AUS,AUT,AZE,BHS,BHR,BGD,BRB,BLR,
                    BEL,BLZ,BEN,BTN,BOL,BIH,BWA,BRA,BRN,BGR,
                    BFA,BDI,KHM,CMR,CAN,CHL,CHN,COL,COM,CRI,
                    CIV,HRV,CYP,CZE,DNK,DJI,DOM,ECU,EGY,SLV,
                    GNQ,EST,ETH,FJI,FIN,FRA,GAB,GMB,GEO,DEU,
                    GHA,GRC,GTM,GIN,GNB,HND,HUN,ISL,IND,IDN,
                    IRN,IRQ,IRL,ISR,ITA,JAM,JPN,JOR,KAZ,KEN,
                    KOR,KWT,KGZ,LAO,LVA,LBN,LSO,LBR,LTU,LUX,
                    MKD,MDG,MWI,MYS,MDV,MLI,MLT,MRT,MUS,MEX,
                    MDA,MNG,MNE,MAR,MOZ,NAM,NPL,NLD,NZL,NER,
                    NGA,NOR,OMN,PAK,PAN,PRY,PER,PHL,POL,PRT,
                    QAT,ROU,RUS,RWA,STP,SAU,SEN,SRB,SLE,SGP,
                    SVK,SVN,ZAF,ESP,LKA,SDN,SUR,SWZ,SWE,CHE,
                    SYR,TJK,TZA,THA,TGO,TTO,TUN,TUR,TKM,UGA,
                    UKR,GBR,USA,URY,UZB,VEN,VNM,YEM,ZMB,ZWE /

rcmap(*,*) regional map /
         USA . (USA)
         CAN . (CAN)
         WEU . (AUT, BEL, CYP, DNK, FIN, FRA, DEU, GRC, ISL, IRL, ITA, LUX,
                MLT, NLD, NOR, PRT, ESP, SWE, CHE, GBR)
         JPK . (JPN,KOR)
         ANZ . (AUS, NZL)
         CEE . (BIH, BGR, HRV, CZE, HUN, MKD, POL, ROU, SVK, SVN)
         FSU . (ARM, AZE, BLR, EST, GEO, KAZ, KGZ, LVA, LTU, MDA, RUS, TJK,
                TKM, UKR, UZB)
         MDE . (BHR, IRN, IRQ, ISR, JOR, KUW, LBN, OMN, QAT, SAU, SYR, TUR, YEM)
         CAM . (BLZ, CRI, SLV, GTM, HND, MEX, PAN)
         SAM . (ARG, BOL, BRA, CHL, COL, ECU, PRY, PER, SUR, URY, VEN)
         SAS . (BGD, BTN, IND, NPL, PAK, LKA)
         SEA . (BRN, KHM, IND, LAO, MYS, PHL, SGP, THA, VNM)
         CHI . (CHN, MNG)
         NAF . (EGY, MAR, TUN)
         SSA . (BEN, BWA, BFA, BDI, CMR, CIV, DJI, GNQ, ETH, GAB, GMB, GHA, GIN,
                GNB, KEN, LSO, LBR, MDG, MWI, MLI, MRT, MOZ, NAM, NER, NGA,
                RWA, SEN, SLE, ZAF, SDN, SWZ, TZA, TGO, ZMB, ZWE)
         SIS . (BHS, BRB, COM, DOM, FJI, JAM, MDV, MUS, STP, TTO)
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

