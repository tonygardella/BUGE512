* Common declarations for mosaic model
$ontext
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

parameters

        Area(t,c)               Area of country c at time t (km2)
;


* This is here because it containts national Area
table SLR_par_c(c,*)    "Country parameters related to sea-level rise"
$include SLR_national_pars.dat
;

        Area("2010",c)          = SLR_par_c(c,"area_2000");
