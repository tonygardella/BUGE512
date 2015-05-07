*** FUND Health Parameters ***

parameters
*GENERAL
         urbanization(t,c) percentage of population living in cities
         pop_under65(t,c) proportion of population under 65 years of age
         value_life(t,c) value of a statisical life (mortality)
         value_life_baseline_USA_2010 value of life in baseline year 2010 for USA        /2000000/
         total_deaths(t,c) total number of additional deaths associated with climate change
         total_deaths_percentage(t,c) total additional deaths as a percentage of population
         total_health_damages(t,c) total monetary loss due to additional deaths associated with climate change
         total_health_damages_percentage(t,c) total monetary loss as a percentage of GDP

*DIARRHEA
         deaths_diarrhea(t,c) additional diarrheal deaths due to climate change
         change_diarrhea_rate(t,c) change in diarrhea mortality rate due to climate change (deaths per 1000)
         damages_diarrhea(t,c) monetary damages from diarrhea deaths ($)

*VECTOR BORNE -  broken into Malaria, Dengue Fever and Schistosomiasis
         deaths_vector_borne(t,c) additional vector borne deaths due to climate change
         change_vector_borne_rate(t,c) change in vector borne mortality rate due to climate change (deaths per 1000000)
         damages_vector_borne(t,c) monetary damages from vector borne deaths ($)

         deaths_malaria(t,c) additional malaria deaths due to climate change
         change_malaria_rate(t,c) change in malaria mortality rate due to climate change (deaths per 1000000)
         damages_malaria(t,c) monetary damages from malaria deaths ($)

         deaths_dengue(t,c) additional dengue fever deaths due to climate change
         change_dengue_rate (t,c) change in dengue fever mortality rate due to climate change (deaths per 1000000)
         damages_dengue(t,c) monetary damages from dengue fever deaths ($)

         deaths_schistosomiasis(t,c) additional schistosomiasis deaths due to climate change
         change_schistosomiasis_rate(t,c) change in schistosomiasis mortality rate due to climate change (deaths per 1000000)
         damages_schistosomiasis(t,c) monetary damages from schistosomiasis deaths ($)

*CARDIOVASCULAR
         deaths_cardiovascular(t,c) total additional cardiovascular deaths due to climate change
         change_cardiovascular_rate(t,c) change in cardiovascular mortality rate due to climate change (deaths per 100000)
         damages_cardiovascular(t,c) monetary damages from cardiovascular deaths ($)

         deaths_cardiovascular_heat(t,c) additional heat related cardiovascular deaths due to climate change
         change_cardiovascular_heat_rate(t,c) change in heat related cardiovascular mortality rate due to climate change (deaths per 100000)
         damages_cardiovascular_heat(t,c) monetary damages from heat related cardiovascular deaths ($)
         deaths_cardiovascular_heat_over65(t,c) additional heat related cardiovascular deaths over 65 due to climate change
         change_cardiovascular_heat_over65_rate(t,c) change in cardiovascular heat related over 65 mortality rate due to climate change (deaths per 100000)
         damages_cardiovascular_heat_over65(t,c) monetary damages from heat related over 65 cardiovascular deaths ($)
         deaths_cardiovascular_heat_under65(t,c) additional heat related cardiovascular deaths under 65 due to climate change
         change_cardiovascular_heat_under65_rate(t,c) change in cardiovascular heat related under 65 mortality rate due to climate change (deaths per 100000)
         damages_cardiovascular_heat_under65(t,c) monetary damages from heat related under 65 cardiovascular deaths ($)

         deaths_cardiovascular_cold(t,c) additional cold related cardiovascular deaths due to climate change
         change_cardiovascular_cold_rate(t,c) change in cold related cardiovascular mortality rate due to climate change (deaths per 100000)
         damages_cardiovascular_cold(t,c) monetary damages from cold related cardiovascular deaths ($)
         deaths_cardiovascular_cold_over65(t,c) additional cold related cardiovascular deaths over 65 due to climate change
         damages_cardiovascular_cold_over65(t,c) monetary damages from cold related over 65 cardiovascular deaths ($)
         change_cardiovascular_cold_over65_rate(t,c) change in cardiovascular cold related over 65 mortality rate due to climate change (deaths per 100000)
         deaths_cardiovascular_cold_under65(t,c) additional cold related cardiovascular deaths under 65 due to climate change
         damages_cardiovascular_cold_under65(t,c) monetary damages from cold related under 65 cardiovascular deaths ($)
         change_cardiovascular_cold_under65_rate(t,c) change in cardiovascular cold related under 65 mortality rate due to climate change (deaths per 100000)

*RESPIRATORY
         deaths_respiratory(t,c) additional respiratory deaths due to climate change
         change_respiratory_rate(t,c) change in respiratatory mortality rate due to climate change (deaths per 100000)
         damages_respiratory(t,c) monetary damages from respiratory deaths ($)


*REGIONAL SUMMATION
         pop_region(t,r)
         total_deaths_region(t,r)
         total_deaths_percentage_region(t,r)
         total_health_damages_region(t,r)
         total_health_damages_percentage_region(t,r)
         deaths_diarrhea_region(t,r)
         change_diarrhea_rate_region(t,r)
         damages_diarrhea_region(t,r)
         deaths_vector_borne_region(t,r)
         change_vector_borne_rate_region(t,r)
         damages_vector_borne_region(t,r)
         deaths_malaria_region(t,r)
         change_malaria_rate_region(t,r)
         damages_malaria_region(t,r)
         deaths_dengue_region(t,r)
         change_dengue_rate_region(t,r)
         damages_dengue_region(t,r)
         deaths_schistosomiasis_region(t,r)
         change_schistosomiasis_rate_region(t,r)
         damages_schistosomiasis_region(t,r)
         deaths_cardiovascular_region(t,r)
         change_cardiovascular_rate_region(t,r)
         damages_cardiovascular_region(t,r)
         deaths_cardiovascular_heat_region(t,r)
         change_cardiovascular_heat_rate_region(t,r)
         damages_cardiovascular_heat_region(t,r)
         deaths_cardiovascular_heat_over65_region(t,r)
         change_cardiovascular_heat_over65_rate_region(t,r)
         damages_cardiovascular_heat_over65_region(t,r)
         deaths_cardiovascular_heat_under65_region(t,r)
         change_cardiovascular_heat_under65_rate_region(t,r)
         damages_cardiovascular_heat_under65_region(t,r)
         deaths_cardiovascular_cold_region(t,r)
         change_cardiovascular_cold_rate_region(t,r)
         damages_cardiovascular_cold_region(t,r)
         deaths_cardiovascular_cold_over65_region(t,r)
         change_cardiovascular_cold_over65_rate_region(t,r)
         damages_cardiovascular_cold_over65_region(t,r)
         deaths_cardiovascular_cold_under65_region(t,r)
         change_cardiovascular_cold_under65_rate_region(t,r)
         damages_cardiovascular_cold_under65_region(t,r)
         deaths_respiratory_region(t,r)
         change_respiratory_rate_region(t,r)
         damages_respiratory_region(t,r)

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

         global_param_health(*)  Tol parameters /
                 "income_elas_diarrhea_mort"               -1.58
                 "diarrhea_mort_response_warming"           1.14
                 "deg_nonlinearity_mortality_in_warming"    1.00
                 "income_elas_vector_mort"                 -2.65
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

;
