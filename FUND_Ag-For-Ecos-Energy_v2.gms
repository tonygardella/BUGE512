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
GDP(t,r)        "Gross domestic product"
Y_pc(t,r)       "Per capita income"
Y(t,r)          "Income"
CT(t)           "Change in global mean temp. rel to 1990"
CRT(t)          "Change in reg. mean temp. rel. to 1990"
CO(t)           "CO2 concentration"
DELTAT(t,r)     "Change in regional mean temp"
temp(t)         "Global mean temperature"
P(t,r)          "Pop. size in millions"
DT(t)           "Change in temperature"

*AGRICULTURE p.6-7
A(t,r)          "Impacts on Agriculture"
Ar(t,r)         "Impacts due to rate of CC"
Al(t,r)         "Impacts due to level of CC"
Af(t,r)         "Impacts from carbon dioxide fertilization"
*GAP is not provided in any table.
gap(t,r)        "Gross agr. product"

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


Table   ag_par_reg(r,*)          "Regional parameters for agriculture"
$ondelim onlisting
$include 'ag_par_reg.csv'
$offdelim offlisting
;

Table for_par_reg(r,*)           "Regional parameters for forestry"
$ondelim onlisting
$include 'for_par_reg.csv'
$offdelim offlisting
;

Table energ_par_reg(r,*)          "Regional parameters for energy"
$ondelim onlisting
$include 'for_par_reg.csv'
$offdelim offlisting
;

Table aeeidata(t,*)              "Autonomous Energy Efficiency Improvement"
$ondelim onlisting
$include 'AEEI_FUND_table.csv'
$offdelim offlisting
;


loop(t,
*AGRICULTURE
Ar(t,r)             =       ag_par_reg(r,"alpha") * (DELTAT(t,r)/0.04)**ag_par_glob("B") + (1-(1/ag_par_glob("p"))) * Ar(t-1,r);
Al(t,r)             =       ag_par_reg(r,"deltal") * CRT(t) + ag_par_reg(r,"deltaq") * (CRT(t)**2);
Af(t,r)             =       ag_par_reg(r,"gamma") * log(CO(t)/275);
A(t,r)              =       Ar(t,r) +Al(t,r)+Af(t,r);
gap(t,r)/GDP(t,r)   =       (gap(1990,r)/GDP(1990,r)) * (Y_pc(1990,r)/Y_pc(t,r))**ag_par_glob("epsilon");

*FORESTRY
F(t,r)              =       for_par_reg(r,"alpha) * (Y_pc(t,r)/Y_pc("t1990",r))**for_par_glob("epsilon") * (0.5 * temp(t)**for_par_glob("beta") + 0.5 * for_par_glob("gamma") * log(CO(t)/275));

*ECOSYSTEMS
*Check smax syntax
B(t)                =       smax(ecos_par_glob("Bo")/100,B(t-1)*(1-ecos_par_glob("rho")-ecos_par_glob("sigma2") * (DT(t)**2/ecos_par_glob("tau")**2));
E(t, r)             =       ecos_par_glob("alpha") * P(t,r) * ((Y_pc(t,r)/yb(r)) / 1+(Y_pc(t,r)/yb(r))) * ((DT(t)/ecos_par_glob("tau")) / 1+(DT(t)/ecos_par_glob("tau"))) * (1-ecos_par_glob("sigma") + ecos_par_glob("sigma") * (ecos_par_glob("Bo")/B(t));

*ENERGY
*Check prod(AEEI))

SH(t,r)             =       (energ_par_reg(r,"aheat") * Y("t1990",r) * (arctan(CT(t))/arctan(1)) * (Y_pc(t,r)/Y_pc("t1990",r))**energ_par_glob("epsilon") *(P(t,r)/P("t1990",r))) / prod(t,aeeidata(t,r));
SC(t,r)             =       (energ_par_reg(r,"acool") * Y("t1990",r) * (CT(t))**energ_par_glob("beta") * (Y_pc(t,r)/Y_pc("t1990",r))**energ_par_glob("epsilon") *(P(t,r)/P("t1990",r))) / prod(t,aeeidata(t,r));
);