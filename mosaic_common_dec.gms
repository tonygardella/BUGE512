* Common declarations for mosaic model

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

    r    regions    /USA,CAN,WEU,JPK,ANZ,EEU,FSU,MDE,CAM,SAM,
                     SAS,SEA,CHI,NAF,SSA,SIS/
    c    countries  /
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
         EEU . (BGR,BIH,CZE,HRV,HUN,MKD,MNE,POL,ROU,SRB,
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

