$ontext
FUND  Agriculture, Forestry, Ecosystems and Energy v3.
Author: Paulo Arevalo

PARAMETERS

-AGRICULTURE:    ag_par_glob(*)

B                        "Non lineary of reaction to temp, expert guess (1.5 -2.5)"
p                        "Speed of adaptation, expert guess (5-15)"
epsilon                  "Income elasticity of the share of ag.in econ"

-ECOSYSTEMS:     ecos_par_glob(*)

alpha                    "P. such that the value equals $50 per person if per capita income equals the OECD avg in '90"
yb                       "Parameter, regional"
tau                      "Parameter, in Celsius"
sigma                    "parameter, expert guess"
Bo                       "No. Species in 2000"
rho                      "Parameter"
sigma2                   "Parameter"

-FORESTRY:       for_par_glob(*)

epsilon                  "Income elasticity for agr. (0.11-0.51)"
beta                     "Expert guess, (0.5-1.5)"
gamma                    "Parameter, see documentation p.8, (0.29-0.87)"

-ENERGY:         energ_par_glob(*)

epsilon                  "Income elasticity of space heat. demand"
beta                     "parameter btw 1 - 2"
tr                       "Rate of technology substitution. Yet to be defined, set at 1"

TABLES

-AGRICULTURE:     ag_par_reg(r,*)

"alpha"                  "regional change in ag. prod. for annual warming of 0.04C"
"deltal"                 "Regional change in ag. prod for warming of 2.5 above today"
"deltaq"                 "Optimal temp. for ag. in each region"
"gamma"                  "Effect of CO2 fertilization on agr. prod."

-FORESTRY:       for_par_reg(r,*)

"alpha"                  "Impact of CC of a 1°C warming on econ. welfare"

-ENERGY          energ_par_reg(r,*)

"aheat"                  "Benchmark impact, dollar per °C, check table EFW, col6"
"acool"                  "check table EFW, col8"
$offtext

*SET DEFINITIONS AND COMMON PARAMETERS
$include common.gms

*ECONOMIC PARAMETETRS AND EQUATIONS (TONY's CODE)
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

*CARBON MODEL INPUT, REPLACE BY ACTUAL MODEL
Table carbon(t,*)                "Input from DICE carbon model"
$ondelim onlisting
$include 'DICE_Carbon.csv'
$offdelim offlisting
;

*AGRICULTURAL PARAMETERS AND TABLES
parameter
IA(t,c)                          "Impacts on Agriculture"
Ar(t,c)                          "Impacts due to rate of CC"
Al(t,c)                          "Impacts due to level of CC"
Af(t,c)                          "Impacts from carbon dioxide fertilization"
sa(t,c)                          "Share of ag. prod. in income, over time"

ag_par_cntry(c,*)                "Ag. parameters by country"

*Global ag. parameters
ag_par_glob(*)/
$ondelim
$include ag_par_glob.txt
$offdelim
/;

*Regional ag. parameters
Table   ag_par_reg(r,*)          "Regional parameters for agriculture"
$ondelim onlisting
$include 'ag_par_reg.csv'
$offdelim offlisting
;


Table   shr_ag(c,*)              "Share of agr. production in total income, per country"
$ondelim onlisting
$include 'ag_gdpshare_cc.csv'
$offdelim offlisting
;

*ECOSYSTEMS AND FORESTRY PARAMETERS
parameter
*Ecosystems
         LE(t,c)                 "Value of loss of ecosystems in USD"
         B(t)                    "Number of species"

*Forestry
         F(t,c)                  "Change in forestry consumer and produc.surplus"
         for_par_cntry(c,*)      "Forestry parameters by country"

*Global ecosystem parameters
ecos_par_glob(*)/
$ondelim
$include ecos_par_glob.txt
$offdelim
/;

parameter
*Global forestry parameters
for_par_glob(*)/
$ondelim
$include for_par_glob.txt
$offdelim
/

*Regional forestry parameters
Table for_par_reg(r,*)           "Regional parameters for forestry"
$ondelim onlisting
$include 'for_par_reg.csv'
$offdelim offlisting
;

*ENERGY
parameter

         SH(t,c)                 "Decrease in spenditure on space heating"
         SC(t,c)                 "Increase in spenditure in space cooling"
         energ_term(t,c)         "Common term for SH and SH equations"

         energ_par_cntry(c,*)    "Energy parameters by country"
         aeei_cntry(t,c)         "AEEI by country"

*Global energy parameters
energ_par_glob(*)/
$ondelim
$include energ_par_glob.txt
$offdelim
/;

*Regional energy parameters
Table energ_par_reg(r,*)         "Regional parameters for energy"
$ondelim onlisting
$include 'energ_par_reg.csv'
$offdelim offlisting
;

*AEEI data by region
Table aeeidata(t,r)              "Autonomous Energy Efficiency Improvement (FUND)"
$ondelim onlisting
$include 'aeei_interp.csv'
$offdelim offlisting
;

*ADDITIONAL, TO BE INCLUDED IN COMMON OR ECONOMIC SECTION
parameter
Y_pc(t,c)                        "Income per capita"
;

*************************************************************
*Initialization

DT("2010")                       =       0;
DT_r("2010",c)                   =       0;

*Initialized with arbitrary value
Ar("2010",c)                     =       -0.001;

B("2010")                        =       ecos_par_glob("Bo");

*Region to country mappings
ag_par_cntry(c,"alpha")          =       sum(rcmap(r,c), ag_par_reg(r,"alpha"));
ag_par_cntry(c,"deltal")         =       sum(rcmap(r,c), ag_par_reg(r,"deltal"));
ag_par_cntry(c,"deltaq")         =       sum(rcmap(r,c), ag_par_reg(r,"deltaq"));
ag_par_cntry(c,"gamma")          =       sum(rcmap(r,c), ag_par_reg(r,"gamma"));

for_par_cntry(c,"alpha")         =       sum(rcmap(r,c), for_par_reg(r,"alpha"));

energ_par_cntry(c,"aheat")       =       sum(rcmap(r,c), energ_par_reg(r,"aheat"));
energ_par_cntry(c,"acool")       =       sum(rcmap(r,c), energ_par_reg(r,"acool"));
aeei_cntry(t,c)                  =       sum(rcmap(r,c), aeeidata(t,r));


loop(t,

*GENERAL
temp(t)                  =       13.78 + carbon(t,"TATM");
temp_r(t,c)              =       13.78 + carbon(t,"TATM");

*CLIMATE (CO2 concentration in 2010 in PPMV)
CO(t)                    =       (carbon(t,"MAT")/2.13) + (3.66*280);
DT(t)$(ord(t) > 1)       =       temp(t)- temp(t-1);
DT_r(t,c)$(ord(t) > 1)   =       temp_r(t,c)- temp_r(t-1,c);
CT(t)                    =       temp(t) - temp("2010");
CRT(t,c)                 =       temp_r(t,c) - temp_r("2010",c);

*ECONOMY
y_gross(t+1,c)           =       pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);
y_net(t,c)               =       (1-omega)*y_gross(t,c);
i(t,c)                   =       s(c)*y_net(t,c)*nyper;
k(t+1,c)                 =       i(t,c)+(1-delta)**nyper *k(t,c);
epsi(t+1,c)              =       epsi(t,c)*exp(- AEEI(t,c));
e(t+1,c)                 =       epsi(t,c) * y_net(t,c);

Y_pc(t,c)                =       Y_gross(t,c)/pop(t,c);

*AGRICULTURE
Ar(t,c)$(ord(t) > 1)     =       ag_par_cntry(c,"alpha") * (DT_r(t,c)/0.04)**ag_par_glob("B") + (1-(1/ag_par_glob("p"))) * Ar(t-1,c);
Al(t,c)                  =       ag_par_cntry(c,"deltal") * CRT(t,c) + ag_par_cntry(c,"deltaq") * (CRT(t,c)**2);
Af(t,c)                  =       ag_par_cntry(c,"gamma") * log(CO(t)/275);
IA(t,c)                  =       Ar(t,c) + Al(t,c) + Af(t,c);

sa(t,c)                  =       shr_ag(c,"share") * (Y_pc("2010",c)/Y_pc(t,c))**ag_par_glob("epsilon");


*ECOSYSTEMS
B(t)$(ord(t) > 1)        =       max(ecos_par_glob("Bo")/100,
                                 B(t-1)*(1-ecos_par_glob("rho")-ecos_par_glob("gamma") * (DT(t)**2/ecos_par_glob("tau")**2)));

LE(t, c)                 =       ecos_par_glob("alpha") * pop(t,c) *
                                 ((Y_pc(t,c)/ecos_par_glob("yb")) / 1+(Y_pc(t,c)/ecos_par_glob("yb"))) *
                                 ((DT(t)/ecos_par_glob("tau")) / 1+(DT(t)/ecos_par_glob("tau"))) *
                                 (1-ecos_par_glob("sigma") + ecos_par_glob("sigma") * (ecos_par_glob("Bo")/B(t)));

*FORESTRY
F(t,c)                   =       for_par_cntry(c,"alpha") * (Y_pc(t,c)/Y_pc("2010",c))**for_par_glob("epsilon") *
                                 (0.5 * temp(t)**for_par_glob("beta") + 0.5 * for_par_glob("gamma") * log(CO(t)/275));

*ENERGY
*This equation has a divide by zero error in exec. time, caused by missing countries in the pop table.
energ_term(t,c)          =       ((Y_pc(t,c)/Y_pc("2010",c))**energ_par_glob("epsilon") *
                                 (pop(t,c)/pop("2010",c))) / aeei_cntry(t,c);

*SH is going up and SC is going down?
SH(t,c)                  =        energ_par_cntry(c,"aheat") * Y_gross("2010",c) * (arctan(CT(t))/arctan(1)) * energ_term(t,c);
SC(t,c)                  =        energ_par_cntry(c,"acool") * Y_gross("2010",c) * (CT(t))**energ_par_glob("beta") * energ_term(t,c);
);

*display ;
*temp, Ar, Al, Af, IA, B, LE, F, SH, SC
