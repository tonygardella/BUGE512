* Declarations for the SolowSwan economy

parameters
         k(t,c)              capital
         i(t,c)              investment
         s(c)                savings
         y_gross(t,c)        output
         y_net(t,c)          income net of damages
         y_pc(t,c)           income per capita
         a(t,c)              initial tech
         l(t,c)              labor
         emiss_count(t,c)    emissions
         nyper               timestep                                 /5/
         lshr                labor share                              /0.66/
         aeei                Autonomous energy emissionintensity
         delta               depreciation                             /0.05/
         omega               damage                                   /0/
         prodgr              productivity growth coefficient          /0.02/
         pro                 productivity trend
         eii                 calibrated intial emissions intensity
         emiss_int           emissions intensity
         world_emissions(t) total emissions

;
$ontext
Units:
K=2010 Capital stock at current PPPs (in mil. 2005US$) (ppp=purchasing power parity)
rgdpl= 2010 PPP Converted GDP Per Capita (Laspeyres), derived from growth rates of c, g, i, at 2005 constant prices
s = 2010 Investment Share of PPP Converted GDP Per Capita at 2005 constant prices [rgdpl]
y = 2010 GDP at 2005 constant prices
e =total GHG Emissions Including Land-Use Change and Forestry (MtCO2)
population = thousands persons
epsilon = $gdp/MtCarbon
$offtext



table initparam(*,*)  contains params rgdpl-y-e-k-s
$ondelim
$include 'initparams.csv'
$offdelim
;

table pop(*,*)
$ondelim
$include population.csv
$offdelim
;

table aeeidata(*,*)
$ondelim
$include aeei_interp.csv
$offdelim
;

         k("2010",c)       =     initparam("k",c);

         s(c)              =     0.01 * initparam("s",c);

         y_gross("2010",c) =     initparam("y",c);

         l(t,c)            =     pop(t,c);

         a("2010",c)       =     y_gross("2010",c) / [ l("2010",c)**lshr * k("2010",c)**(1 - lshr)];

         emiss_count("2010",c)       =     initparam("e",c);

         eii("2010",c)     =     emiss_count("2010",c)/y_gross("2010",c);

         aeei(t,c)         =     sum(rcmap(r,c), aeeidata(t,r))

        ;
