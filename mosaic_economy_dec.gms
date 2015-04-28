parameters
         nyper                   timestep                                 /5/
         lshr                    labor share                              /0.66/
         omega                   damage                                   /0/
         prodgr1                 dummy productivity growth rate           /0.1/
         delta1                  dummy depreciation rate                  /0.02/
         s1                      dummy savings rate                       /0.2/
         t2mt                    tons to gigtons                          /1e6/
         mt2gt                    megatons                                 /1e3/
         lpart(c)                labor participation rate
         delta(c)                depreciation
         k(t,c)                  capital
         i(t,c)                  investment
         s(c)                    savings
         y_gross(t,c)            output
         y_net(t,c)              income net of damages
         a(t,c)                  initial tech
         l(t,c)                  labor
         emiss_count(t,c)        emissions
         aeei(t,c)               Autonomous energy emissionintensity
         pro(t,c)                productivity trend
         emiss_int(t,c)          emissions intensity
         world_emissions(t)      total world emissions
         e_intensity(c)          emissions intensity
         y_region(t,r)           output by region
         y_percapita_region(t,r) percapita income by region
         emiss_region(t,r)       emissions by region
         y_world(t)              output of the world
         y_percapita_world(t)    per capita income of the world

* Economy derivative variables
        Y_pc(t,c)           "Per capita income in nation c at time t"
        Y_pc_growth(t,c)    "Per captia income growth in nation c at time t"
        Y_dens(t,c)         "Income density of region t at time r"
        Y_dens_growth(t,c)  "Income density growth of region t at time r"
        P_dens(t,c)         "Population density of nation c at time t"
        P_growth(t,c)       "Population growth rate of nation c at time t"


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



table initparam(*,*)
$ondelim
$include initparams.csv
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


         lpart(c)          =     initparam("lpart",c);

         k("2010",c)       =     initparam("k",c);

         s(c)              =     initparam("s",c);

         y_gross("2010",c) =     initparam("y",c);

         e_intensity(c)    =     initparam("e_intensity",c);

         delta(c)          =     initparam("delta",c);

         l(t,c)            =     (0.01*lpart(c))*(pop(t,c));

         pro("2010",c)       =     y_gross("2010",c) / [ l("2010",c)**lshr * k("2010",c)**(1 - lshr)];

         emiss_count("2010",c)       =     initparam("e",c);

         aeei(t,c)         =    0.01 *sum(rcmap(r,c), aeeidata(t,r));

         pro(t,c)= pro("2010",c) * (1+prodgr(t,c))**(nyper*(ord(t)-1));

         emiss_int("2010",c)     =     e_intensity(c);

         emiss_int(t,c)= emiss_int("2010",c)* (1 + aeei(t,c))**(nyper*(ord(t)-1));
