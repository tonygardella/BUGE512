Parameters

***Water Resources Declarations


         W(t,r) " change in water resources in 1995 US dollar"
         Alpha(r) "percent of 1990 GDP per degree celsius"
         Y_pc(t,r) "per capitia income"
*         *****Pop(t,r) "population size"
         Temp(t) "mean global temp above pre-industrial degrees C "
         Tau "technological progress in water supply and demand" / 0.005/
         Beta  "impacts response to economic growth"   / 0.85/
         N  "impacts response to population growth" / 0.85/
         Gamma  "impacts response to warming" / 1/
;

parameter Alpha_water(*)          "param defining benchmark impact of 1 degree C of warming on Water Resources"           /
$include alphaH20Resources.txt
/
;





