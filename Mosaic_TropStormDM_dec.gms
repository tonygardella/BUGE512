parameters

         TD(t,c) "damage duue to tropical storms 1995$ per year"
         Y(t,c) "gross domestic product 1995$ per year"
         alpha_trop_storm(c) "current damage as fraction of GDP"
         Y_pc(t,c) "per capitia income"
         Epsilon_trop_storm "income elasticity of storm damage" /-0.514/
         delta_trop_storm  "how much wind speed increase per degree warming" /0.04/
         Temp_trop_storm(t,c) "temperature increase since pre-industrial time in degrees C"
         gamma_trop_storm  "the power of the wind in the cube of its speed" /3/

         TM(t,c) "mortality due to Tropical Storms, in people per year"
         Pop(t,c) "population size"
         Beta_trop_storm(c) "current mortality as fraction of population"
         Y(t,c) "per capita income 1995$ per person per year"
         eta_trop_storm  "income elasticity of storm damage"  /-0.501/
         delta_trop_storm "how much wind speed increase per degree warming" /0.04/
         Temp_trop_storm(t,c) "temperature increase since pre-industrial time in degrees C"
         gamma_trop_storm  "the power of the wind in the cube of its speed"  /3/

parameter alpha_trop_storm(c)          "param defining benchmark impact of 1 degree C of warming on Water Resources"           /
$include CrrntDM_tropStorm_alpha.txt
/;
;
;

parameter Beta_trop_storm(c)          "param defining benchmark impact of 1 degree C of warming on Water Resources"           /
$include mortality_population_TropStormBeta.txt
/;
;
;

