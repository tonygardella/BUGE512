*** FUND Health Parameters ***

parameters
         urbanization(t,c) percentage of population living in cities
         deaths_diarrhea(t,c) additional diarrheal deaths due to climate change
         deaths_vector additional vector borone deaths due to climate change
         deaths_vector_malaria_rate (t,c) change in malara deaths rate
         deaths_vector_dengue_rate (t,c) change in dengue fever deaths rate
         deaths_vector_schis_rate (t,c) change in schistosomisis deaths rate
         deaths_vector_malaria (t,c) additional malaria deaths
         deaths_vector_dengue (t,c) additional dengue fever deaths
         deaths_vector_schis (t,c) additional schistosomiasis deaths
         value_life(t,c) value of a statisical life
         value_year_morb(t,c) value of a year of morbidity
         change_cardio_res_hot_over65(t,c) Tol parameters climate induced mortality per 100000
         change_cardio_res_hot_under65(t,c) Tol parameters climate induced mortality per 100000
         change_cardio_res_cold_over65(t,c) Tol parameters climate induced mortality per 100000
         change_cardio_res_cold_under65(t,c) Tol parameters climate induced mortality per 100000
         deaths_cardio_res_heat(t,c) additional heat related cardio-respiratory deaths
         deaths_cardio_res_cold(t,c) additional cold related cardio-respiratory deaths
         total_loss_health(t,c) total $ damages due to climate change related deaths

         Country_Tol_heat_over65_1(c)
         Country_Tol_heat_over65_2(c)
         Country_Tol_heat_over65_1mort(c)
         Country_Tol_heat_over65_2mort(c)
         Country_Tol_heat_under65_1(c)
         Country_Tol_heat_under65_2(c)
         Country_Tol_heat_under65_1mort(c)
         Country_Tol_heat_under65_2mort(c)
         Country_Tol_cold_over65_1(c)
         Country_Tol_cold_over65_2(c)
         Country_Tol_cold_over65_1mort(c)
         Country_Tol_cold_over65_2mort(c)
         Country_Tol_cold_under65_1(c)
         Country_Tol_cold_under65_2(c)
         Country_Tol_cold_under65_1mort(c)
         Country_Tol_cold_under65_2mort(c)
         Country_Tol_diarrhea(c)

         global_param_health(*)  Tol parameters /
                 "income_elas_diarrhea_mort"               -1.58
                 "diarrhea_mort_response_warming"           1.14
                 "deg_nonlinearity_mortality_in_warming"    1.00
                 "income_elas_vector_mort"                 -2.65
                 "mort_morb_no_description_1"               4992523
                 "mort_morb_no_description_2"               19970
                 "normalization_constant"                   24963
                 "income_elas_value_of_life"                1.00
                 "income_elas_value_of_year_morb"           1.00
                 "malaria_param"                            0.0794
                 "dengue_param"                             0.3534
                 "schistosomiasis_param"                   -0.1149
                 "urbanization_param_1"                     0.031
                 "urbanization_param_2"                    -0.011
         /;

*health and mortality related tables
table regional_health(r,*)
$ondelim onlisting
$include 'regional_health.csv'
$offdelim offlisting
;

table country_rate(c,*) death rates per 100000
$ondelim onlisting
$include 'country_health.csv'
$offdelim offlisting
;

*health

         Country_Tol_heat_over65_1(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_1"));
         Country_Tol_heat_over65_2(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_2"));
         Country_Tol_heat_over65_1mort(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_1mort"));
         Country_Tol_heat_over65_2mort(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_2mort"));
         Country_Tol_heat_under65_1(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_1"));
         Country_Tol_heat_under65_2(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_2"));
         Country_Tol_heat_under65_1mort(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_1mort"));
         Country_Tol_heat_under65_2mort(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_2mort"));
         Country_Tol_cold_over65_1(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_1 "));
         Country_Tol_cold_over65_2(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_2"));
         Country_Tol_cold_over65_1mort(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_1mort"));
         Country_Tol_cold_over65_2mort(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_2mort"));
         Country_Tol_cold_under65_1(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_1"));
         Country_Tol_cold_under65_2(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_2"));
         Country_Tol_cold_under65_1mort(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_1mort"));
         Country_Tol_cold_under65_2mort(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_2mort"));
         Country_Tol_diarrhea(c) = sum(r$rcmap(r,c), regional_health(r,"diarrhea"));

;
