*health

         y_percapita(t,c) = y_net(t,c) / pop(t,c);
         reg_temp(t,c) = (preindustrial_temp + TATM(t)) * Country_Tol_regional_temp(c);
         reg_temp_dif(t,c) = TATM(t) * Country_Tol_regional_temp(c);

         area(c) = country_rate(c,"area");
         P_dens(t,c) = (pop(t,c) * 1000) / area(c);

         urbanization(t,c) = ((global_param_health("urbanization_param_1")*sqrt(y_percapita(t,c)))
                  + (global_param_health("urbanization_param_2")*sqrt(P_dens(t,c))))/
                 (1 + global_param_health("urbanization_param_1")*sqrt(y_percapita(t,c))
                  + (global_param_health("urbanization_param_2")*sqrt(P_dens(t,c))));

*DIARRHEA

deaths_diarrhea(t,c) = (country_rate(c,"diarrhea")/1000) *
         pop(t,c) * (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_diarrhea_mort") *
         (reg_temp(t,c) / preindustrial_temp)**
         global_param_health("diarrhea_mort_response_warming");

*VECTOR BORNE

deaths_vector_malaria_rate(t,c) = (country_rate(c,"malaria")*10)
         * global_param_health("malaria_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_dengue_rate(t,c) = (country_rate(c,"dengue")*10)
         * global_param_health("dengue_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_schis_rate(t,c) = (country_rate(c,"schistosomiasis")*10)
         * global_param_health("schistosomiasis_param") *
         (reg_temp(t,c) - reg_temp("2010",c))**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (y_percapita(t,c) / y_percapita("2010",c))**
         global_param_health("income_elas_vector_mort");

deaths_vector_malaria(t,c) = deaths_vector_malaria_rate(t,c) * pop(t,c) / 1000;

deaths_vector_dengue(t,c) = deaths_vector_dengue_rate(t,c) * pop(t,c) / 1000;

deaths_vector_schis(t,c) = deaths_vector_schis_rate(t,c) * pop(t,c) / 1000;

deaths_vector(t,c) = deaths_vector_malaria(t,c) + deaths_vector_dengue(t,c)+
         deaths_vector_schis(t,c);

*CARDIOVASCULAR AND RESPIRATORY

change_cardio_res_hot_over65(t,c) = (Country_Tol_heat_over65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_heat_over65_2(c) * reg_temp_dif(t,c)** 2)* pop(t,c) / 100 ;

change_cardio_res_hot_under65(t,c) = (Country_Tol_heat_under65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_heat_under65_2(c) * (reg_temp_dif(t,c))** 2) * pop(t,c) / 100 ;

deaths_cardio_res_heat(t,c) = (change_cardio_res_hot_over65(t,c) + change_cardio_res_hot_under65(t,c)) * urbanization(t,c);

change_cardio_res_cold_over65(t,c) = (Country_Tol_cold_over65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_cold_over65_2(c) * reg_temp_dif(t,c)**2) * pop(t,c) / 100;

change_cardio_res_cold_under65(t,c) = (Country_Tol_cold_under65_1(c) *
         reg_temp_dif(t,c) + Country_Tol_cold_under65_2(c) * reg_temp_dif(t,c)**2) * pop(t,c) / 100;

deaths_cardio_res_cold(t,c) = change_cardio_res_cold_over65(t,c) + change_cardio_res_cold_under65(t,c);

*MORBIDITY AND MORTALITY

value_life(t,c) = global_param_health("mort_morb_no_description_1") *
         (y_percapita(t,c) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_life");

value_year_morb(t,c) = global_param_health("mort_morb_no_description_2") *
         (y_percapita(t,c) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_year_morb");

*TOTAL DAMAGES LOST DUE TO CLIMATE CHANGE

total_loss_health(t,c) = (deaths_diarrhea(t,c) + deaths_vector(t,c) +
         deaths_cardio_res_heat(t,c) + deaths_cardio_res_cold(t,c)) *
         value_life(t,c);