Parameter
         ETD(t,c) "damage from extra tropical storms"
         y(t,c) "gross domestic product"
         alpha_etrop_storm(c) "benchmark damage from extratropical cyclones for juust region"
         Y_pc(t,c) "per capita income"
         epsilon_etrop_storm  "income elasticity of extra tropical storm damages" / -0.514/
         delta_etrop_storm(c) "storm sensitivity to atmospheric CO2 concentrations for juust region"
         CO2_con (c) "atmospheric CO2 concentrations.. time t, region???"
         CO2_pre "CO2 concentrations in pre-industrial era"
         gamma_etrop_storm  " is a param?? help get right shape maybe" /1/

         ETM(t,c) "mortality from extratropical cyclones"
         P_dens(t,c) "population"
         beta_etrop_storm(c) " benchmark mortality from extratropical cyclones JUST FOR REGION"
         Y_pc(t,c) "per capita income"
         psi_etrop_storm  "income elasticity of extra tropical storm mortality" /-0.501/
         delta_etrop_storm (c) "storm sensitivity to atmospheric CO2 concentrations for juust region"
         CO2 (t) "atmospheric CO2 concentrations.. time t, region???"
         CO2_pre "CO2 concentrations in pre-industrial era"
         gamma_etrop_storm  " is a param?? help get right shape maybe" /1/




parameter alpha_etrop_storm(c)          "param defining benchmark impact of 1 degree C of warming on Water Resources"           /
$include DM_fromEtropCyclones_alpha.txt
/
;


parameter beta_etrop_storm(c)          "param defining benchmark impact of 1 degree C of warming on Water Resources"           /
$include Mortality_EtropCyclones_beta.txt
/
;

parameter delta_etrop_storm(c)          "param defining benchmark impact of 1 degree C of warming on Water Resources"           /
$include stormsensitivity_toCO2Etrop_delta.txt
/
;

