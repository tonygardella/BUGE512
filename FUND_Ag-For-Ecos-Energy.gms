*FUND  Agriculture, Forestry, Ecosystems and Energy.
*First Draft, parameter syntax.
*Author: Paulo Arevalo

*Abbreviations:
*        CC      = Climate change

*All temperatures in °C, $ in 1995 USD


set r    /reg1*reg16/
set t    /t2010*t2100/


Parameters
*AGRICULTURE
                 A(t,r)          "Impacts on Agriculture
                 Ar(t,r)         "Impacts due to rate of CC"
                 Al(t,r)         "Impacts due to level of CC"
                 Af(t,r)         "Impacts from carbon dioxide fertilization"

*for Ar
                 alpha(r)        "regional change in ag. prod. for annual warming of 0.04C"
                 DELTAT(t,r)     "Change in regional mean temp"
                 B               "Non lineary of reaction to temp"                        /2.0/
                 p               "Speed of adaptation"                                     /10/
*for Al
                 deltal(r)       "Regional change in ag. prod for warming of 2.5 above today"
                 deltaq(r)       "Optimal temp. for ag. in each region"
                 CRT(t)           "Change in reg. mean temp. rel. to 1990"
*for Af
                 gamma(r)        "Generic parameter...see tableA"
                 CO2(t)           "CO2 concentration"

*FOREST
                 F(t,r)          "Change in forestry consumer and produc.surplus"
                 alpha2(r)       "Impact of CC of a 1C warming on econ. welfare"
                 y(t,r)          "Yearly per capita income"
                 epsilon         "Income elasticity for agr."                              /0.31/
                 T(t)            "Global mean temp."
                 beta            "Expert guess, 0.11-0.51"                                   /1/
                 gamma2          "Parameter, see documentation"

*ECOSYSTEMS
                 E(t,r)          "Value of loss of ecosystems"
                 alpha3          "P. such that the value equals $50 per person if per capita income equals the OECD avg in '90"
                 P(t,r)          "Pop. size in millions"
                 yb(r)           "Parameter, regionalized?"                              /30000/
                 DT(t)           "Change in temperature, not regionalized?"
                 tau                                                                     /0.025/
                 sigma           "parameter, expert guess"                               /0.05/
                 Bo              "No. Species at time 0?"                                /14000000/
                 B(t)            "Number of species"
                 rho             /0.003/
                 sigma2          /0.001/

*ENERGY
                 SH(t,r)         "Space heating"
                 SC(t,r)         "Space cooling"
                 alpha3(r)       "Benchmark impact, dollar per °C, check table EFW, col6-7"
                 inc(t,r)        "Income"
                 CT(t)           "Change in global mean temp. rel to 1990"
                 epsilon2        "Income elasticity of space heat. demand"               /0.8/
                 AEEI(t,r)       "Autonomous Energy Efficiency Improvement"

                 alpha4(r)       "check table EFW, col8-9"
                 beta2           "parameter btw 1 - 2"                                   /1.5/;

Equations

*AGRICULTURE
Ar(t,r)  =       alpha(r) * (DELTAT(t,r)/0.04)**B + (1-(1/p)) * Ar(t-1,r);
*Verify the second CRT in the following equation
Al(t,r)  =       deltal(r) * CRT(t) + deltaq(r) * CRT(t);
Af(t,r)  =       gamma(r) * log(CO2(t)/275);
A(t,r)   =       Ar(t,r) +Al(t,r)+Af(t,r);

*FORESTRY (reuses log(CO2(t)/275))
F(t,r)   =       alpha2(r) * (y(t,r)/y("t1990",r))**epsilon * (0.5 * T(t)**beta + 0.5 * gamma2 * log(CO2(t)/275));
                                                                                  t
*ECOSYSTEMS (reuses y(t,r))
*Check smax syntax
B(t)     =       smax(Bo/100,B(t-1)*(1-rho-sigma2 * (DT(t)**2/tau**2));
E(t, r)  =       alpha3 * P(t,r) * ((y(t,r)/yb(r)) / 1+(y(t,r)/yb(r))) * ((DT(t)/tau) / 1+(DT(t)/tau)) * (1-sigma + sigma * (Bo/B(t));

*ENERGY (reuses y(t,r), P(t,r), check prod(AEEI))

SH(t,r)  =       (alpha3(r) * inc("t1990",r) * (arctan(CT(t))/arctan(1)) * (y(t,r)/y("t1990",r))**epsilon2 *(P(t,r)/P("t1990",r))) / prod(t,AEEI(t,r));
SC(t,r)  =       (alpha4(r) * inc("t1990",r) * (CT(t))**beta2 * (y(t,r)/y("t1990",r))**epsilon2 *(P(t,r)/P("t1990",r))) / prod(t,AEEI(t,r));
