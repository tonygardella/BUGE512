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

"alpha"                  "Impact of a 1�C warming on forestry in fraction of GDP"

-ENERGY          energ_par_reg(r,*)

"aheat"                  "Impact of a 1�C warming on heating in fraction of GDP"
"acool"                  "Impact of a 1�C warming on cooling in fraction of GDP"
*The sign of acool values was changed to positive.

$offtext


*AGRICULTURAL PARAMETERS AND TABLES
parameter
IA(t,c)                          "Impacts of CC as a percentage of agricultural production"
Ar(t,c)                          "Damage in ag. prod. as a fraction due to rate of CC"
Al(t,c)                          "Damage in ag. prod. as a fraction due to level of CC"
Af(t,c)                          "Damage in ag. prod. as a fraction due to carbon dioxide fertilization"
sa(t,c)                          "Share of ag. prod. in income, over time"
IAI(t,c)                         "Impacts on agriculture in USD by country"
IAI_region(t,r)                  "Impacts on agriculture in USD by region"

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
         LE(t,c)                 "Value of loss of ecosystems in USD by country"
         LE_region(t,r)          "Value of loss of ecosystems in USD by region"
         B(t)                    "Number of species"

*Forestry (changed to give values in USD for consistency with the other sectors)
         F(t,c)                  "Change in forestry consumer and produc.surplus in USD by country"
         F_region(t,r)           "Change in forestry consumer and produc.surplus in USD by region"
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

         SH(t,c)                 "Decrease in spenditure on space heating in USD by country"
         SH_region(t,r)          "Decrease in spenditure on space heating in USD by region"

         SC(t,c)                 "Increase in spenditure in space cooling in USD by country"
         SC_region(t,r)          "Increase in spenditure in space cooling in USD by region"
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

parameter
*By country
         IAI_y(t,c)              "Impacts on ag. as fraction of GDP"
         F_y(t,c)                "Impacts on forestry as a fraction of GDP"
         LE_y(t,c)               "Impacts on ecosystems as fraction of GDP"
         SH_y(t,c)               "Spending on space heating as fraction of GDP"
         SC_y(t,c)               "Spending on space cooling as fraction of GDP"
*By region
         IAI_y_region(t,r)       "Impacts on ag. as fraction of GDP"
         F_y_region(t,r)         "Impacts on forestry as a fraction of GDP"
         LE_y_region(t,r)        "Impacts on ecosystems as fraction of GDP"
         SH_y_region(t,r)        "Spending on space heating as fraction of GDP"
         SC_y_region(t,r)        "Spending on space cooling as fraction of GDP";

*************************************************************
*Initialization

temp_change_interannual("2010")                  =       0;
temp_change_interannual_national("2010",c)       =       0;

*Initialized with arbitrary value
Ar("2010",c)                                     =       -0.001;

B("2010")                                        =       ecos_par_glob("Bo");

*Region to country mappings
ag_par_cntry(c,"alpha")                          =       sum(rcmap(r,c), ag_par_reg(r,"alpha"));
ag_par_cntry(c,"deltal")                         =       sum(rcmap(r,c), ag_par_reg(r,"deltal"));
ag_par_cntry(c,"deltaq")                         =       sum(rcmap(r,c), ag_par_reg(r,"deltaq"));
ag_par_cntry(c,"gamma")                          =       sum(rcmap(r,c), ag_par_reg(r,"gamma"));

for_par_cntry(c,"alpha")                         =       sum(rcmap(r,c), for_par_reg(r,"alpha"));

energ_par_cntry(c,"aheat")                       =       sum(rcmap(r,c), energ_par_reg(r,"aheat"));
energ_par_cntry(c,"acool")                       =       sum(rcmap(r,c), energ_par_reg(r,"acool"));

