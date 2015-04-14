*** From class
* File name conventions
*       mosaic_`sector`_dec.gms
*       mosaic_`sector`_exe.gms
* Then include all declarations at top.
* For execution, instead of $include, use $batinclude


* main loop
loop(t,

* Solow Swan model
*       Y_gross
*       Y_net
*       For now, assume these are the same -- but do it on Y_net
*       emissions (Mega-tons C)
*       populations

* Derivative calculations
*   Inputs:
*       Various...
*       Per capita
*       Density

* DICE carbon cycle
*   Inputs:
*       Emissions
*   Outputs:
*       Change in global mean temperature (C)
*       Concentration in CO2 (ppm)
*       Change in ocean temperature (C)

* Damages
*       Takes above as inputs


* For mine:
*       Use a conditional at a top (if coast > 0)
*       Growth RATE is present year / last year - 1
*           This applies to all '_growth' measures
*       Wetland area loss:
*           First, compute the value of the wetland
*           Then, amount that would be lost
*           Then, multiply by value of loss
*           Then, decrement any losses (including area)

);

