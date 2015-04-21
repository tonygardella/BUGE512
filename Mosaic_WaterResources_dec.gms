Parameters

***Water Resources Declarations
         CO2_pre  / 270/
*water resources
         W(t,c) " change in water resources in 1995 US dollar"
*         Alpha(r) "percent of 1990 GDP per degree celsius"
*         Y_pc(t,r) "per capitia income"
*         *****Pop(t,r) "population size"
*         Temp(t) "mean global temp above pre-industrial degrees C "
         Tau_water "technological progress in water supply and demand" / 0.005/
         Beta_water  "impacts response to economic growth"   / 0.85/
         N_water  "impacts response to population growth" / 0.85/
         Gamma_water  "impacts response to warming" / 1/

*tropical storm damage and mortality

         TD(t,c) "damage duue to tropical storms 1995$ per year"
*         Y(t,c) "gross domestic product 1995$ per year"
*         alpha_trop_storm(c) "current damage as fraction of GDP"
*         Y_pc(t,c) "per capitia income"
         Epsilon_trop_storm "income elasticity of storm damage" /-0.514/
         delta_trop_storm  "how much wind speed increase per degree warming" /0.04/
*         Temp_trop_storm(t,c) "temperature increase since pre-industrial time in degrees C"
         gamma_trop_storm  "the power of the wind in the cube of its speed" /3/

         TM(t,c) "mortality due to Tropical Storms, in people per year"
*         Pop(t,c) "population size"
*         Beta_trop_storm(c) "current mortality as fraction of population"
*         Y(t,c) "per capita income 1995$ per person per year"
         eta_trop_storm  "income elasticity of storm damage"  /-0.501/
*         delta_trop_storm "how much wind speed increase per degree warming" /0.04/
*         Temp_trop_storm(t,c) "temperature increase since pre-industrial time in degrees C"
*        gamma_trop_storm  "the power of the wind in the cube of its speed"  /3/

*exxtra trop storm daamage and mortality

         ETD(t,c) "damage from extra tropical storms"
*         y(t,c) "gross domestic product"
*         alpha_etrop_storm(c) "benchmark damage from extratropical cyclones for juust region"
*         Y_pc(t,c) "per capita income"
         epsilon_etrop_storm  "income elasticity of extra tropical storm damages" / -0.514/
*         delta_etrop_storm(c) "storm sensitivity to atmospheric CO2 concentrations for juust region"
*         CO2_con (c) "atmospheric CO2 concentrations.. time t, region???"
*         CO2_pre "CO2 concentrations in pre-industrial era"
         gamma_etrop_storm  " is a param?? help get right shape maybe" /1/

         ETM(t,c) "mortality from extratropical cyclones"
*         P_dens(t,c) "population"
*         beta_etrop_storm(c) " benchmark mortality from extratropical cyclones JUST FOR REGION"
*         Y_pc(t,c) "per capita income"
         psi_etrop_storm  "income elasticity of extra tropical storm mortality" /-0.501/
*         delta_etrop_storm (c) "storm sensitivity to atmospheric CO2 concentrations for juust region"
*         CO2 (t) "atmospheric CO2 concentrations.. time t, region???"
*         CO2_pre "CO2 concentrations in pre-industrial era"
***         gamma_etrop_storm  " is a param?? help get right shape maybe" /1/

         WR_par_cntry(c,*)

;

*Regional forestry parameters
Table WR_par_reg(r,*)           "Regional parameters for water"
$ondelim onlisting
$include 'H20_param.csv'
$offdelim offlisting
;

*Region to country mappings
*initialize


WR_par_cntry(c,"Alpha_water")                          =       sum(rcmap(r,c), WR_par_reg(r,"alpha_water"));
WR_par_cntry(c,"Alpha_tropstorm")                         =       sum(rcmap(r,c), WR_par_reg(r,"alpha_tropstorm"));
WR_par_cntry(c,"Beta_trop_storm")                         =       sum(rcmap(r,c), WR_par_reg(r,"beta_trop_storm"));
WR_par_cntry(c,"alpha_etrop_storm")                         =       sum(rcmap(r,c), WR_par_reg(r,"alpha_etrop_storm"));
WR_par_cntry(c,"beta_etrop_storm")                         =       sum(rcmap(r,c), WR_par_reg(r,"beta_etrop_storm"));
WR_par_cntry(c,"delta_etrop_storm")                         =       sum(rcmap(r,c), WR_par_reg(r,"delta_etrop_storm"));





