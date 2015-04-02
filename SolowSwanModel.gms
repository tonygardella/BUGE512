$ontext
Author:Anthony Gardella

This is a simple solow-swan economic growth model for 150 countries. It
includes labor,capital,technology, emissions,depreciation, and investment parameters
in 5 year increments from 2010 to 2100.

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

parameters
         k(c,t)       capital
         i(c,t)       investment
         s(c)         savings
         y_gross(c,t) output
         y_net(c,t)
         a(c,t)       tech
         l(c,t)       labor
         e(c,t)       emissions
         nyper        timestep                                      /5/
         lshr         labor share                                   /0.66/
         AEEI         Autonomous energy emissionintensity
         delta        depreciation                                  /0.05/
         omega        damage                                        /0.05/
         prodgr       productivity growth coefficient               /0.02/
         pro          productivity trend
;
$ontext
Units:
K=2010 Capital stock at current PPPs (in mil. 2005US$) (ppp=purchasing power parity)
rgdpl= 2010 PPP Converted GDP Per Capita (Laspeyres), derived from growth rates of c, g, i, at 2005 constant prices
s = 2010 Investment Share of PPP Converted GDP Per Capita at 2005 constant prices [rgdpl]
y= 2010 GDP at 2005 constant prices
e=total GHG Emissions Including Land-Use Change and Forestry (MtCO2)
population= thousands persons
$offtext



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

         k(c,"2010")       =     initparam(c,"k");

         s(c)              =     0.01 * initparam(c,"s");

         y_gross(c,"2010") =     initparam(c,"y");

         l(c,t)            =     pop(c,t);

         a(c,"2010")       =     y_gross(c,"2010") / [ l(c,"2010")**lshr * k(c,"2010")**(1 - lshr) ];

         e(c,"2010")       =     initparam(c,"e");

         i(c,"2010")       =     s(c) * y_gross(c,"2010");

         AEEI(c,t)         =     1;

         pro(c,t)          =    a(c,"2010") * exp(prodgr*ord(t)-1);

        ;

loop(t,
*GLOBAL Solow-Swan economic growth model
         y_gross(c,t+1)=pro(c,t)*l(c,t)**(lshr) * k(c,t)**(1-lshr);
         y_net(C,t+1)= (1-omega)*y_gross(c,t);
         i(c,t)=s(c)*y_net(c,t)*nyper;
         k(c,t+1)=i(c,t)+(1-delta)**nyper *k(c,t);
         e(c,t)=AEEI(c,t)*initparam(c,"e")*y_net(c,t);
);

display y_net

$libinclude gnuplotxyz y_net t c
$exit
file outfile /result.txt/;
put outfile;
outfile.pc       =       6;

put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put y(c,t);
         );
         put /;
);

putclose outfile;

