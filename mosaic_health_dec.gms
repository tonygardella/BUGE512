*** FUND Health Parameters ***

parameters
*GENERAL
         urbanization(t,c) percentage of population living in cities
         pop_under65(t,c) proportion of population under 65 years of age
         value_life(t,c) value of a statisical life (mortality)
         value_year_morbidity(t,c) value of a year of morbidity
         total_deaths(t,c) total number of additional deaths associated with climate change
         total_deaths_pop_fraction(t,c) total additional deaths as a percentage of population
         total_health_damages(t,c) total monetary loss due to additional deaths associated with climate change
         total_health_damages_percentage(t,c) total monetary loss as a percentage of GDP

*DIARRHEA
         deaths_diarrhea(t,c) additional diarrheal deaths due to climate change
         change_diarrhea_rate(t,c) change in diarrhea mortality rate due to climate change (deaths per 1000)

*VECTOR BORNE
         deaths_vector_borne additional vector borone deaths due to climate change
         years_loss_vector_borne(t,c) years loss due to additional vector borne deaths due to climate change

         deaths_malaria(t,c) additional malaria deaths due to climate change
         years_loss_malaria(t,c) years loss due to additional malaria deaths due to climate change
         change_malaria_rate(t,c) change in malaria mortality rate due to climate change (deaths per 1000000)

         deaths_dengue(t,c) additional dengue fever deaths due to climate change
         years_loss_dengue(t,c) years loss due to additional dengue fever deaths due to climate change
         change_dengue_rate (t,c) change in dengue fever mortality rate due to climate change (deaths per 1000000)

         deaths_schistosomisis(t,c) additional schistosomiasis deaths due to climate change
         years_loss_schistosomisis(t,c) years loss due to additional schistosomiasis deaths due to climate change
         change_schistosomisis_rate(t,c) change in schistosomisis mortality rate due to climate change (deaths per 1000000)

*CARDIOVASCULAR
         deaths_cardiovascular(t,c) total additional cardiovascular deaths due to climate change
         years_loss_cardiovascular(t,c) years loss due to additional cardiovascular deaths due to climate change

         deaths_cardiovascular_heat(t,c) additional heat related cardiovascular deaths due to climate change
         years_loss_cardiovascular_heat(t,c) years loss due to additional heat related cardiovascular deaths due to climate change
         deaths_cardiovascular_heat_over65(t,c) additional heat related cardiovascular deaths over 65 due to climate change
         change_cardiovascular_hot_over65_rate(t,c) change in cardiovascular heat related over 65 mortality rate due to climate change (deaths per 100000)
         deaths_cardiovascular_heat_under65(t,c) additional heat related cardiovascular deaths under 65 due to climate change
         change_cardiovascular_hot_under65_rate(t,c) change in cardiovascular heat related under 65 mortality rate due to climate change (deaths per 100000)

         deaths_cardiovascular_cold(t,c) additional cold related cardiovascular deaths due to climate change
         years_loss_cardiovascular_cold(t,c) years loss due to additional cold related cardiovascular deaths due to climate change
         deaths_cardiovascular_cold_over65(t,c) additional cold related cardiovascular deaths over 65 due to climate change
         change_cardiovascular_cold_over65_rate(t,c) change in cardiovascular cold related over 65 mortality rate due to climate change (deaths per 100000)
         deaths_cardiovascular_cold_under65(t,c) additional cold related cardiovascular deaths under 65 due to climate change
         change_cardiovascular_cold_under65_rate(t,c) change in cardiovascular cold related under 65 mortality rate due to climate change (deaths per 100000)

*RESPIRATORY
         deaths_respiratory(t,c) additional respiratory deaths due to climate change
         years_loss_respiratory(t,c) years loss due to additional respiratory deaths due to climate change
         change_respiratory_rate(t,c) change in respiratatory mortality rate due to climate change (deaths per 100000)

*TOL PARAMETERS - REGIONL MAPPING
         Tol_heat_over65_1(c)
         Tol_heat_over65_2(c)
         Tol_heat_under65_1(c)
         Tol_heat_under65_2(c)
         Tol_cold_over65_1(c)
         Tol_cold_over65_2(c)
         Tol_cold_under65_1(c)
         Tol_cold_under65_2(c)
         Tol_respiratory_1(c)
         Tol_respiratory_2(c)
         Tol_morb_mort_ratio_malaria(c)
         Tol_morb_mort_ratio_schistosomisis(c)
         Tol_morb_mort_ratio_dengue(c)
         Tol_morb_mort_ratio_cardiovascular(c)
         Tol_morb_mort_ratio_respiratory(c)

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
                 "Tol_heat_over65_1"               -40.9953
                 "Tol_heat_over65_2"                5.6628
                 "Tol_heat_under65_1"              -1.4610
                 "Tol_heat_under65_2"               0.0941
                 "Tol_cold_over65_1"               -162.6459
                 "Tol_cold_over65_2"                5.6628
                 "Tol_cold_under65_1"              -2.9787
                 "Tol_cold_under65_2"               0.0946
                 "Tol_respiratory_1"               -17.9222
                 "Tol_respiratory_2"                0.8683
         /;

*HEALTH AND MORBIDITY/MORTALITY RELATED TABLES
table regional_health(r,*) various Tol regional parameters
$ondelim onlisting
$include 'regional_health.csv'
$offdelim offlisting
;

table country_rate(c,*) death rates per 100000
$ondelim onlisting
$include 'country_health.csv'
$offdelim offlisting
;

table pop_under65(t,c) population under 65 years of age
$ondelim onlisting
$include 'population_under65.csv'
$offdelim offlisting
;

*REGIONAL TO COUNTRY MAPPING
         Tol_heat_over65_1(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_1"));
         Tol_heat_over65_2(c) = sum(r$rcmap(r,c), regional_health(r,"heat_over65_2"));
         Tol_heat_under65_1(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_1"));
         Tol_heat_under65_2(c) = sum(r$rcmap(r,c), regional_health(r,"heat_under65_2"));
         Tol_cold_over65_1(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_1 "));
         Tol_cold_over65_2(c) = sum(r$rcmap(r,c), regional_health(r,"cold_over65_2"));
         Tol_cold_under65_1(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_1"));
         Tol_cold_under65_2(c) = sum(r$rcmap(r,c), regional_health(r,"cold_under65_2"));
         Tol_respiratory_1(c) = sum(r$rcmap(r,c), regional_health(r,"respiratory_1"));
         Tol_respiratory_2(c) = sum(r$rcmap(r,c), regional_health(r,"respiratory_2"));
         Tol_morb_mort_ratio_malaria(c) = sum(r$rcmap(r,c), regional_health(r,"morb_mort_ratio_malaria"));
         Tol_morb_mort_ratio_schistosomisis(c) = sum(r$rcmap(r,c), regional_health(r,"morb_mort_ratio_schis"));
         Tol_morb_mort_ratio_dengue(c) = sum(r$rcmap(r,c), regional_health(r,"morb_mort_ratio_dengue"));
         Tol_morb_mort_ratio_cardiovascular(c) = sum(r$rcmap(r,c), regional_health(r,"morb_mort_ratio_cardio"));
         Tol_morb_mort_ratio_respiratory(c) = sum(r$rcmap(r,c), regional_health(r,"morb_mort_ratio_resp"));
;
