*FUND  Agriculture, Forestry, Ecosystems and Energy.
*Author: Paulo Arevalo

$ontext
PARAMETERS

AGRICULTURE
B               "Non lineary of reaction to temp"
p               "Speed of adaptation"
epsilon         "Income elasticity of the share of ag.in econ"

FORESTRY
epsilon         "Income elasticity for agr."
beta            "Expert guess, 0.11-0.51"
gamma          "Parameter, see documentation p.8, range 0.29-0.87"

ECOSYSTEMS
alpha            "P. such that the value equals $50 per person if per capita income equals the OECD avg in '90"
yb              "Parameter, regional??"
tau             "Parameter, in Celsius"
sigma           "parameter, expert guess"
Bo              "No. Species in 2000"
rho             "Parameter"
sigma2          "Parameter"

ENERGY
epsilon        "Income elasticity of space heat. demand"
beta           "parameter btw 1 - 2"

TABLES
ag_par_reg(r,*)
"alpha"                   "regional change in ag. prod. for annual warming of 0.04C"
"deltal"                  "Regional change in ag. prod for warming of 2.5 above today"
"deltaq"                  "Optimal temp. for ag. in each region"
"gamma"                   "Effect of CO2 fertilization on agr. prod."

for_par_reg(r,*)
"alpha"                   "Impact of CC of a 1C warming on econ. welfare"

energ_par_reg(r,*)
"aheat"                  "Benchmark impact, dollar per °C, check table EFW, col6"
"acool"                  "check table EFW, col8"

$offtext

set r    /USA,CAN,WEU,JPK,ANZ,EEU,FSU,MDE,CAM,SAM,SAS,SEA,CHI,NAF,SSA,SIS/
set t    /1950*2300/


parameter

*General states
Y(t,r)          "Income"

DT(t)           "Change in temperature"
DT_r(t,r)       "Change in regional mean temp"
CT(t)           "Change in global mean temp. rel to 2010"
CRT(t,r)        "Change in reg. mean temp. rel. to 2010"


*AGRICULTURE p.6-7
A(t,r)          "Impacts on Agriculture"
Ar(t,r)         "Impacts due to rate of CC"
Al(t,r)         "Impacts due to level of CC"
Af(t,r)         "Impacts from carbon dioxide fertilization"

ag_par_glob(*)/
$ondelim
$include ag_par_glob.txt
$offdelim
/;

parameter
*FORESTRY p. 7-8
F(t,r)         "Change in forestry consumer and produc.surplus"

for_par_glob(*)/
$ondelim
$include for_par_glob.txt
$offdelim
/;

parameter
*ECOSYSTEMS p.15-16
E(t,r)          "Value of loss of ecosystems"
B(t)            "Number of species"

ecos_par_glob(*)/
$ondelim
$include ecos_par_glob.txt
$offdelim
/;

parameter
*ENERGY  p. 9-10
SH(t,r)         "Space heating"
SC(t,r)         "Space cooling"

energ_par_glob(*)/
$ondelim
$include ecos_par_glob.txt
$offdelim
/;

*GENERAL STATES TABLES
Table   Y_pc(t,*)                "Per capita income"
$ondelim onlisting
$include 'Y_pc.csv'
$offdelim offlisting
;

Table   GDP(t,*)                 "Gross domestic product"
$ondelim onlisting
$include 'GDP.csv'
$offdelim offlisting
;

Table   P(t,*)                   "Pop. size in millions"
$ondelim onlisting
$include 'pop.csv'
$offdelim offlisting
;

* Values that will come from the model*
parameter   temp(t)              "Global mean temp" /
$ondelim onlisting
$include 'temp.csv'
$offdelim offlisting
/;

Table   temp_r(t,*)              "Regional mean temp"
$ondelim onlisting
$include 'temp_r.csv'
$offdelim offlisting
;

parameter   CO(t)                  "CO2 concentration"/
$ondelim onlisting
$include 'CO.csv'
$offdelim offlisting
/;


*SECTOR TABLES
Table   ag_par_reg(r,*)          "Regional parameters for agriculture"
$ondelim onlisting
$include 'ag_par_reg.csv'
$offdelim offlisting
;

*Made up values, get the real table from UN > shares of GPD.
Table   gap_y(t,*)               "Share of agr. production in total income"
$ondelim onlisting
$include 'gap.csv'
$offdelim offlisting
;

Table for_par_reg(r,*)           "Regional parameters for forestry"
$ondelim onlisting
$include 'for_par_reg.csv'
$offdelim offlisting
;

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

*Initialization
DT("2010")          =       0;
DT_r("2010",r)      =       0;

loop(t,
*GENERAL
DT(t)               =       DT(t)- DT(t-1);
DT_r(t,r)           =       DT_r(t,r)- DT_r(t-1,r);
CT(t)               =       temp(t) - temp("2010");
CRT(t,r)            =       temp_r(t,r) - temp_r("2010",r);

*AGRICULTURE
Ar(t,r)             =       ag_par_reg(r,"alpha") * (DT_r(t,r)/0.04)**ag_par_glob("B") + (1-(1/ag_par_glob("p"))) * Ar(t-1,r);
Al(t,r)             =       ag_par_reg(r,"deltal") * CRT(t,r) + ag_par_reg(r,"deltaq") * (CRT(t,r)**2);
Af(t,r)             =       ag_par_reg(r,"gamma") * log(CO(t)/275);
A(t,r)              =       Ar(t,r) + Al(t,r) + Af(t,r);

*Not interacting with other equations yet.
gap_y(t,r)          =       (gap_y("2010",r)/GDP("2010",r)) * (Y_pc("2010",r)/Y_pc(t,r))**ag_par_glob("epsilon");

*FORESTRY
F(t,r)              =       for_par_reg(r,"alpha") * (Y_pc(t,r)/Y_pc("2010",r))**for_par_glob("epsilon") * (0.5 * temp(t)**for_par_glob("beta") + 0.5 * for_par_glob("gamma") * log(CO(t)/275));

*ECOSYSTEMS
*Check max syntax (choose the max of the two elements in the equation)
B(t)                =       max(ecos_par_glob("Bo")/100 , B(t-1)*(1-ecos_par_glob("rho")-ecos_par_glob("sigma2") * (DT(t)**2/ecos_par_glob("tau")**2)));
E(t, r)             =       ecos_par_glob("alpha") * P(t,r) * ((Y_pc(t,r)/ecos_par_glob("yb")) / 1+(Y_pc(t,r)/ecos_par_glob("yb"))) * ((DT(t)/ecos_par_glob("tau")) / 1+(DT(t)/ecos_par_glob("tau"))) * (1-ecos_par_glob("sigma") + ecos_par_glob("sigma") * (ecos_par_glob("Bo")/B(t)));

*ENERGY
*Check prod(AEEI))

*replace prod(AEEI) with aeei index (geometric) 1+aeei**(growth*t)
SH(t,r)             =       (energ_par_reg(r,"aheat") * Y("2010",r) * (arctan(CT(t))/arctan(1)) * (Y_pc(t,r)/Y_pc("2010",r))**energ_par_glob("epsilon") *(P(t,r)/P("2010",r))) / prod(t,aeeidata(t,r));
SC(t,r)             =       (energ_par_reg(r,"acool") * Y("2010",r) * (CT(t))**energ_par_glob("beta") * (Y_pc(t,r)/Y_pc("2010",r))**energ_par_glob("epsilon") *(P(t,r)/P("2010",r))) / prod(t,aeeidata(t,r));
);
