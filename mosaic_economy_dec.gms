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
         prodgr1             dummy productivity growth rate           /0.01/
         pro                 productivity trend
         eii                 intial emissions intensity
         emiss_int           emissions intensity
         world_emissions(t)  total emissions
         mt2gt               megaton to gigaton                       /1e10/

* Economy derivative variables
        Y_pc(t,c)           "Per capita income in nation c at time t"
        Y_pc_growth(t,c)    "Per captia income growth in nation c at time t"
        Y_dens(t,c)         "Income density of region t at time r"
        Y_dens_growth(t,c)  "Income density growth of region t at time r"
        P_dens(t,c)         "Population density of nation c at time t"
        P_growth(t,c)       "Population growth rate of nation c at time t"
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
table prodgr(*,*)
$ondelim
$include gdp_grate.csv
$offdelim
;

         k("2010",c)       =     1000 * initparam("k",c);

         s(c)              =     0.01 * initparam("s",c);

         y_gross("2010",c) =     initparam("y",c);

         l(t,c)            =     pop(t,c);

         pro("2010",c)       =     y_gross("2010",c) / [ l("2010",c)**lshr * k("2010",c)**(1 - lshr)];

         emiss_count("2010",c)       =     initparam("e",c);

         aeei(t,c)         =     0.01 * sum(rcmap(r,c), aeeidata(t,r));

         pro(t,c)= pro("2010",c) * (1+prodgr(t,c))**(nyper*(ord(t)-1));

         emiss_int("2010",c)     =     emiss_count("2010",c)/y_gross("2010",c);

         emiss_int(t,c)= emiss_int("2010",c)* (1 + aeei(t,c))**(nyper*(ord(t)-1));
