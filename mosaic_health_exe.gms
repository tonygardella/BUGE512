*health

urbanization(t,c) = ((global_param_health("urbanization_param_1")*sqrt(y_pc(t,c)))
                  + (global_param_health("urbanization_param_2")*sqrt(P_dens(t,c))))/
                 (1 + global_param_health("urbanization_param_1")*sqrt(y_pc(t,c))
                  + (global_param_health("urbanization_param_2")*sqrt(P_dens(t,c))));

*DIARRHEA

change_diarrhea_rate(t,c) = (country_rate(c,"diarrhea") / 100) *
         (y_pc(t,c) / y_pc("2010",c))**
         global_param_health("income_elas_diarrhea_mort") *
         (temp_r(t,c) / (tempC_preind*Country_Tol_regional_temp(c)))**
         global_param_health("diarrhea_mort_response_warming");

deaths_diarrhea(t,c) = change_diarrhea_rate(t,c) * pop(t,c) / 1000;

*VECTOR BORNE

change_malaria_rate(t,c) = (country_rate(c,"malaria") * 10)
         * global_param_health("malaria_param") *
         temp_change_national_from_2010(t,c)**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_pc(t,c) / y_pc("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_malaria(t,c) = change_malaria_rate(t,c) * pop(t,c) / 1000000;

change_dengue_rate(t,c) = (country_rate(c,"dengue") * 10)
         * global_param_health("dengue_param") *
         temp_change_national_from_2010(t,c)**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_pc(t,c) / y_pc("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_dengue(t,c) = change_dengue_rate(t,c) * pop(t,c) / 1000000;

change_schistosomisis_rate(t,c) = (country_rate(c,"schistosomiasis") * 10)
         * global_param_health("schistosomiasis_param") *
         temp_change_national_from_2010(t,c)**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_pc(t,c) / y_pc("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_schistosomisis(t,c) = change_schistosomisis_rate(t,c) * pop(t,c) / 1000000;

deaths_vector_borne(t,c) = deaths_malaria(t,c) + deaths_dengue(t,c) + deaths_schistosomisis(t,c);

*CARDIOVASCULAR

change_cardiovascular_hot_over65_rate(t,c) = Tol_heat_over65_1(c) *
         temp_change_national_from_2010(t,c) + Tol_heat_over65_2(c) *
         temp_change_national_from_2010(t,c)** 2 ;

deaths_cardiovascular_heat_over65(t,c) = (change_cardiovascular_hot_over65_rate(t,c) *
         (pop(t,c) * (1-pop_under65(t,c))) / 100000) * urbanization(t,c) ;

change_cardiovascular_hot_under65_rate(t,c) = Tol_heat_under65_1(c) *
         temp_change_national_from_2010(t,c) + Tol_heat_under65_2(c) *
         temp_change_national_from_2010(t,c)** 2 ;

deaths_cardiovascular_heat_under65(t,c) = (change_cardiovascular_hot_under65_rate(t,c) *
         (pop(t,c) * pop_under65(t,c)) / 100000) * urbanization(t,c) ;

deaths_cardiovascular_heat(t,c) = deaths_cardiovascular_heat_over65(t,c) + deaths_cardiovascular_heat_under65(t,c) ;

change_cardiovascular_cold_over65_rate(t,c) = Tol_cold_over65_1(c) *
         temp_change_national_from_2010(t,c) + Tol_cold_over65_2(c) *
         temp_change_national_from_2010(t,c)**2 ;

deaths_cardiovascular_cold_over65(t,c) = change_cardiovascular_cold_over65_rate(t,c) *
         (pop(t,c) * (1 - pop_under65(t,c))) / 100000 ;

change_cardiovascular_cold_under65_rate(t,c) = Tol_cold_under65_1(c) *
         temp_change_national_from_2010(t,c) + Tol_cold_under65_2(c) *
         temp_change_national_from_2010(t,c)**2 ;

deaths_cardiovascular_cold_under65(t,c) = change_cardiovascular_cold_under65_rate(t,c) *
         (pop(t,c) * pop_under65(t,c)) / 100000 ;

deaths_cardiovascular_cold(t,c) = deaths_cardiovascular_cold_over65(t,c) + deaths_cardiovascular_cold_under65(t,c);

deaths_cardiovascular(t,c) = deaths_cardiovascular_heat(t,c) + deaths_cardiovascular_cold(t,c);

*RESPIRATORY

change_respiratory_rate(t,c)= Tol_respiratory_1(c) *
         temp_change_national_from_2010(t,c) + Tol_respiratory_2(c) *
         temp_change_national_from_2010(t,c)** 2 ;

deaths_respiratory(t,c) = change_respiratory_rate(t,c) * pop(t,c) / 100000;

*MORBIDITY AND MORTALITY

value_life(t,c) = (value_lift_baseline_USA_2010 / Y_gross("2010","USA")) * Y_net(t,c);

value_year_morbidity(t,c) = global_param_health("mort_morb_no_description_2") *
         (y_pc(t,c) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_year_morb");

*TOTAL DAMAGES LOST DUE TO CLIMATE CHANGE

total_deaths(t,c) = deaths_diarrhea(t,c) + deaths_vector_borne(t,c) +
         deaths_cardiovascular(t,c) + deaths_respiratory(t,c);

total_deaths_pop_fraction(t,c) = total_deaths(t,c) / pop(t,c) * 100;

total_health_damages(t,c) = total_deaths(t,c) * value_life(t,c);

total_health_damages_percentage(t,c) = total_health_damages(t,c) / Y_gross(t,c) * 100;


*DISPLAYS GROUPED BY SECTION
$ontext
*GENERAL
display urbanization;
display pop_under65;
display value_life;
display value_year_morbidity;

display total_deaths;
display total_deaths_pop_fraction;
display total_health_damages;
display total_health_damages_percentage;

*DIARRHEA
display deaths_diarrhea, change_diarrhea_rate;

*VECTOR BORNE
display deaths_vector_borne;

display deaths_malaria, change_malaria_rate;
display deaths_dengue, change_dengue_rate;
display deaths_schistosomisis, change_schistosomisis_rate;

*CARDIOVASCULAR
display deaths_cardiovascular;

display deaths_cardiovascular_heat;
display deaths_cardiovascular_heat_over65, change_cardiovascular_hot_over65_rate;
display deaths_cardiovascular_heat_under65, change_cardiovascular_hot_under65_rate;
display deaths_cardiovascular_cold;
display deaths_cardiovascular_cold_over65, change_cardiovascular_cold_over65_rate;
display deaths_cardiovascular_cold_under65, change_cardiovascular_cold_under65_rate;
display deaths_cardiovascular_heat;
display deaths_cardiovascular_cold;

*RESPIRATORY
display deaths_respiratory, change_respiratory_rate;
$offtext
