*REGIONL SUMMATION
pop_region(t,r) = sum(rcmap(r,c), pop(t,c));
total_deaths_region(t,r)= sum(rcmap(r,c),total_deaths(t,c));
total_deaths_percentage_region(t,r) = total_deaths_region(t,r) / pop_region(t,r) * 100;
total_health_damages_region(t,r) = sum(rcmap(r,c),total_health_damages(t,c));
total_health_damages_percentage_region(t,r) = total_health_damages_region(t,r) / y_region(t,r) * 100;
deaths_diarrhea_region(t,r) = sum(rcmap(r,c), deaths_diarrhea(t,c));
change_diarrhea_rate_region(t,r) = sum(rcmap(r,c), change_diarrhea_rate(t,c));
damages_diarrhea_region(t,r) = sum(rcmap(r,c), damages_diarrhea(t,c));
deaths_vector_borne_region(t,r) = sum(rcmap(r,c), deaths_vector_borne(t,c));
change_vector_borne_rate_region(t,r) = sum(rcmap(r,c), change_vector_borne_rate(t,c));
damages_vector_borne_region(t,r) = sum(rcmap(r,c), damages_vector_borne(t,c));
deaths_malaria_region(t,r) = sum(rcmap(r,c), deaths_malaria(t,c));
change_malaria_rate_region(t,r) = sum(rcmap(r,c), change_malaria_rate(t,c));
damages_malaria_region(t,r) = sum(rcmap(r,c), damages_malaria(t,c));
deaths_dengue_region(t,r) = sum(rcmap(r,c), deaths_dengue(t,c));
change_dengue_rate_region(t,r) = sum(rcmap(r,c), change_dengue_rate(t,c));
damages_dengue_region(t,r) = sum(rcmap(r,c), damages_dengue(t,c));
deaths_schistosomiasis_region(t,r) = sum(rcmap(r,c), deaths_schistosomiasis(t,c));
change_schistosomiasis_rate_region(t,r) = sum(rcmap(r,c), change_schistosomiasis_rate(t,c));
damages_schistosomiasis_region(t,r) = sum(rcmap(r,c), damages_schistosomiasis(t,c));
deaths_cardiovascular_region(t,r) = sum(rcmap(r,c), deaths_cardiovascular(t,c));
change_cardiovascular_rate_region(t,r) = sum(rcmap(r,c), change_cardiovascular_rate(t,c));
damages_cardiovascular_region(t,r) = sum(rcmap(r,c), damages_cardiovascular(t,c));
deaths_cardiovascular_heat_region(t,r) = sum(rcmap(r,c), deaths_cardiovascular_heat(t,c));
change_cardiovascular_heat_rate_region(t,r) = sum(rcmap(r,c), change_cardiovascular_heat_rate(t,c));
damages_cardiovascular_heat_region(t,r) = sum(rcmap(r,c), damages_cardiovascular_heat(t,c));
deaths_cardiovascular_heat_over65_region(t,r) = sum(rcmap(r,c), deaths_cardiovascular_heat_over65(t,c));
change_cardiovascular_heat_over65_rate_region(t,r) = sum(rcmap(r,c), change_cardiovascular_heat_over65_rate(t,c));
damages_cardiovascular_heat_over65_region(t,r) = sum(rcmap(r,c), damages_cardiovascular_heat_over65(t,c));
deaths_cardiovascular_heat_under65_region(t,r) = sum(rcmap(r,c), deaths_cardiovascular_heat_under65(t,c));
change_cardiovascular_heat_under65_rate_region(t,r) = sum(rcmap(r,c), change_cardiovascular_heat_under65_rate(t,c));
damages_cardiovascular_heat_under65_region(t,r) = sum(rcmap(r,c), damages_cardiovascular_heat_under65(t,c));
deaths_cardiovascular_cold_region(t,r) = sum(rcmap(r,c), deaths_cardiovascular_cold(t,c));
change_cardiovascular_cold_rate_region(t,r) = sum(rcmap(r,c), change_cardiovascular_cold_rate(t,c));
damages_cardiovascular_cold_region(t,r) = sum(rcmap(r,c), damages_cardiovascular_cold(t,c));
deaths_cardiovascular_cold_over65_region(t,r) = sum(rcmap(r,c), deaths_cardiovascular_cold_over65(t,c));
change_cardiovascular_cold_over65_rate_region(t,r) = sum(rcmap(r,c), change_cardiovascular_cold_over65_rate(t,c));
damages_cardiovascular_cold_over65_region(t,r) = sum(rcmap(r,c), damages_cardiovascular_cold_over65(t,c));
deaths_cardiovascular_cold_under65_region(t,r) = sum(rcmap(r,c), deaths_cardiovascular_cold_under65(t,c));
change_cardiovascular_cold_under65_rate_region(t,r) = sum(rcmap(r,c), change_cardiovascular_cold_under65_rate(t,c));
damages_cardiovascular_cold_under65_region(t,r) = sum(rcmap(r,c), damages_cardiovascular_cold_under65(t,c));
deaths_respiratory_region(t,r) = sum(rcmap(r,c), deaths_respiratory(t,c));
change_respiratory_rate_region(t,r) = sum(rcmap(r,c), change_respiratory_rate(t,c));
damages_respiratory_region(t,r) = sum(rcmap(r,c), damages_respiratory(t,c));

*DECOMPOSITION PARAMETERS MAPPING

X(t,c,"death_diarrhea") = deaths_diarrhea(t,c);
d(t,c,"death_diarrhea") =  damages_diarrhea(t,c);
d_y_x(t,c,"death_diarrhea") = (d(t,c,"death_diarrhea") * y_net(t,c)) / X(t,c,"death_diarrhea");
x_t(t,c,"death_diarrhea") = X(t,c,"death_diarrhea") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_diarrhea") = (d(t,c,"death_diarrhea") * y_net(t,c)) / temp_change_from_preind_national(t,c);

X(t,c,"death_malaria") = deaths_malaria(t,c);
d(t,c,"death_malaria") =  damages_malaria(t,c);
d_y_x(t,c,"death_malaria") = (d(t,c,"death_malaria") * y_net(t,c)) / X(t,c,"death_malaria");
x_t(t,c,"death_malaria") = X(t,c,"death_malaria") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_malaria") = (d(t,c,"death_malaria") * y_net(t,c)) / temp_change_from_preind_national(t,c);

X(t,c,"death_dengue") = deaths_dengue(t,c);
d(t,c,"death_dengue") =  damages_dengue(t,c);
d_y_x(t,c,"death_dengue") = (d(t,c,"death_dengue") * y_net(t,c)) / X(t,c,"death_dengue");
x_t(t,c,"death_dengue") = X(t,c,"death_dengue") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_dengue") = (d(t,c,"death_dengue") * y_net(t,c)) / temp_change_from_preind_national(t,c);

X(t,c,"death_schistosomiasis") = deaths_schistosomiasis(t,c);
d(t,c,"death_schistosomiasis") =  damages_schistosomiasis(t,c);
d_y_x(t,c,"death_schistosomiasis") = (d(t,c,"death_schistosomiasis") * y_net(t,c)) / X(t,c,"death_schistosomiasis");
x_t(t,c,"death_schistosomiasis") = X(t,c,"death_schistosomiasis") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_schistosomiasis") = (d(t,c,"death_schistosomiasis") * y_net(t,c)) / temp_change_from_preind_national(t,c);

X(t,c,"death_heat_o65") = deaths_cardiovascular_heat_over65 (t,c);
d(t,c,"death_heat_o65") =  damages_cardiovascular_heat_over65 (t,c);
d_y_x(t,c,"death_heat_o65") = (d(t,c,"death_heat_o65") * y_net(t,c)) / X(t,c,"death_heat_o65");
x_t(t,c,"death_heat_o65") = X(t,c,"death_heat_o65") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_heat_o65") = (d(t,c,"death_heat_o65") * y_net(t,c)) / temp_change_from_preind_national(t,c);

X(t,c,"death_heat_u65") = deaths_cardiovascular_heat_under65 (t,c);
d(t,c,"death_heat_u65") =  damages_cardiovascular_heat_under65 (t,c);
d_y_x(t,c,"death_heat_u65") = (d(t,c,"death_heat_u65") * y_net(t,c)) / X(t,c,"death_heat_u65");
x_t(t,c,"death_heat_u65") = X(t,c,"death_heat_u65") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_heat_u65") = (d(t,c,"death_heat_u65") * y_net(t,c)) / temp_change_from_preind_national(t,c);

X(t,c,"death_cold_o65") = deaths_cardiovascular_cold_over65 (t,c);
d(t,c,"death_cold_o65") =  damages_cardiovascular_cold_over65 (t,c);
d_y_x(t,c,"death_cold_o65") = (d(t,c,"death_cold_o65") * y_net(t,c)) / X(t,c,"death_cold_o65");
x_t(t,c,"death_cold_o65") = X(t,c,"death_cold_o65") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_cold_o65") = (d(t,c,"death_cold_o65") * y_net(t,c)) / temp_change_from_preind_national(t,c);

X(t,c,"death_cold_u65") = deaths_cardiovascular_cold_under65 (t,c);
d(t,c,"death_cold_u65") =  damages_cardiovascular_cold_under65 (t,c);
d_y_x(t,c,"death_cold_u65") = (d(t,c,"death_cold_u65") * y_net(t,c)) / X(t,c,"death_cold_u65");
x_t(t,c,"death_cold_u65") = X(t,c,"death_cold_u65") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_cold_u65") = (d(t,c,"death_cold_u65") * y_net(t,c)) / temp_change_from_preind_national(t,c);

X(t,c,"death_respiratory") = deaths_respiratory(t,c);
d(t,c,"death_respiratory") =  damages_respiratory(t,c);
d_y_x(t,c,"death_respiratory") = (d(t,c,"death_respiratory") * y_net(t,c)) / X(t,c,"death_respiratory");
x_t(t,c,"death_respiratory") = X(t,c,"death_respiratory") / temp_change_from_preind_national(t,c);
smallphi(t,c,"death_respiratory") = (d(t,c,"death_respiratory") * y_net(t,c)) / temp_change_from_preind_national(t,c);

* OUTPUT REGIONL HEALTH RESULTS IN TXT FILE
file resultfileregion /HealthResultsRegion.txt/;
put resultfileregion;
resultfileregion.pc       =       6;

put "Total Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put total_deaths_region(t,r);
         );
         put /;
);
put /;

put "Total Deaths due to Climate Change (percentage of population by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put total_deaths_percentage_region(t,r);
         );
         put /;
);
put /;

put "Total Health Damages due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put total_health_damages_region(t,r);
         );
         put /;
);
put /;

put "Total Health Damages due to Climate Change (percentage of GDP by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put total_health_damages_percentage_region(t,r);
         );
         put /;
);
put /;

put "Diarrheal Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_diarrhea_region(t,r);
         );
         put /;
);
put /;

put "Change in Diarrheal Death Rate per 1000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_diarrhea_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Diarrheal Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_diarrhea_region(t,r);
         );
         put /;
);
put /;

put "Total Vector Borne Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_vector_borne_region(t,r);
         );
         put /;
);
put /;
put "Change in Vector-Borne Death Rate per 1,000,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_vector_borne_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Vector-Borne Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_vector_borne_region(t,r);
         );
         put /;
);
put /;

put "Malaria Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_malaria_region(t,r);
         );
         put /;
);
put /;

put "Change in Malaria Death Rate per 1,000,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_malaria_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Malaria Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_malaria_region(t,r);
         );
         put /;
);
put /;

put "Dengue Fever Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_dengue_region(t,r);
         );
         put /;
);
put /;

put "Change in Dengue Death Rate per 1,000,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_dengue_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Dengue Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_dengue_region(t,r);
         );
         put /;
);
put /;

put "Schistosomiasis Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_schistosomiasis_region(t,r);
         );
         put /;
);
put /;

put "Change in Schistosomiasis Death Rate per 1000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_schistosomiasis_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Schistosomiasis Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_schistosomiasis_region(t,r);
         );
         put /;
);
put /;

put "Total Cardiovascular Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_cardiovascular_region(t,r);
         );
         put /;
);
put /;

put "Change in Total Cardiovascular Death Rate per 100,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_cardiovascular_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Cardiovascular Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_cardiovascular_region(t,r);
         );
         put /;
);
put /;

put "Heat Related Cardiovascular Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_cardiovascular_heat_region(t,r);
         );
         put /;
);
put /;

put "Change in Heat Related Cardiovascular Death Rate per 100,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_cardiovascular_heat_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Heat Related Cardiovascular Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_cardiovascular_heat_region(t,r);
         );
         put /;
);
put /;

put "Heat Related Cardiovascular Over 65 Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_cardiovascular_heat_over65_region(t,r);
         );
         put /;
);
put /;

put "Change in Heat Related Cardiovascular Over 65 Death Rate per 100,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_cardiovascular_heat_over65_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Heat Related Cardiovascular Over 65 Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_cardiovascular_heat_over65_region(t,r);
         );
         put /;
);
put /;

put "Heat Related Cardiovascular Under 65 Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_cardiovascular_heat_under65_region(t,r);
         );
         put /;
);
put /;

put "Change in Heat Related Cardiovascular Under 65 Death Rate per 100,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_cardiovascular_heat_under65_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Heat Related Cardiovascular Under 65 Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_cardiovascular_heat_under65_region(t,r);
         );
         put /;
);
put /;

put "Cold Related Cardiovascular Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_cardiovascular_cold_region(t,r);
         );
         put /;
);
put /;

put "Change in Cold Related Cardiovascular Death Rate per 100,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_cardiovascular_cold_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Cold Related Cardiovascular Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_cardiovascular_cold_region(t,r);
         );
         put /;
);
put /;

put "Cold Related Cardiovascular Over 65 Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_cardiovascular_cold_over65_region(t,r);
         );
         put /;
);
put /;

put "Change in Cold Related Cardiovascular Over 65 Death Rate per 100,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_cardiovascular_cold_over65_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Cold Related Cardiovascular Over 65 Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_cardiovascular_cold_over65_region(t,r);
         );
         put /;
);
put /;

put "Cold Related Cardiovascular Under 65 Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_cardiovascular_cold_under65_region(t,r);
         );
         put /;
);
put /;

put "Change in Cold Related Cardiovascular Under 65 Death Rate per 100,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_cardiovascular_cold_under65_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Cold Related Cardiovascular Under 65 Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_cardiovascular_cold_under65_region(t,r);
         );
         put /;
);
put /;

put "Respiratory Deaths due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put deaths_respiratory_region(t,r);
         );
         put /;
);
put /;

put "Change in Respiratory Death Rate per 100,000 due to Climate Change (by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put change_respiratory_rate_region(t,r);
         );
         put /;
);
put /;

put "Damages from Respiratory Deaths due to Climate Change (2005$ USD by region)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put damages_respiratory_region(t,r);
         );
         put /;
);
put /;

* OUTPUT COUNTRY HEALTH RESULTS IN TXT FILE
file resultfilecountry /HealthResultsCountry.txt/;
put resultfilecountry;
resultfilecountry.pc       =       6;

put "Total Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put total_deaths(t,c);
         );
         put /;
);
put /;

put "Total Deaths due to Climate Change (percentage of population by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put total_deaths_percentage(t,c);
         );
         put /;
);
put /;

put "Total Health Damages due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put total_health_damages(t,c);
         );
         put /;
);
put /;

put "Total Health Damages due to Climate Change (percentage of GDP by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put total_health_damages_percentage(t,c);
         );
         put /;
);
put /;


put "Value of Statisical Life (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put value_life(t,c);
         );
         put /;
);
put /;

put "Diarrheal Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_diarrhea(t,c);
         );
         put /;
);
put /;

put "Change in Diarrheal Death Rate per 1000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_diarrhea_rate (t,c);
         );
         put /;
);
put /;

put "Damages from Diarrheal Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_diarrhea (t,c);
         );
         put /;
);
put /;

put "Total Vector Borne Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_vector_borne(t,c);
         );
         put /;
);
put /;
put "Change in Vector-Borne Death Rate per 1,000,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_vector_borne_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Vector-Borne Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_vector_borne(t,c);
         );
         put /;
);
put /;

put "Malaria Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_malaria(t,c);
         );
         put /;
);
put /;

put "Change in Malaria Death Rate per 1,000,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_malaria_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Malaria Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_malaria (t,c);
         );
         put /;
);
put /;

put "Dengue Fever Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_dengue(t,c);
         );
         put /;
);
put /;

put "Change in Dengue Death Rate per 1,000,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_dengue_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Dengue Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_dengue(t,c);
         );
         put /;
);
put /;

put "Schistosomiasis Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_schistosomiasis(t,c);
         );
         put /;
);
put /;

put "Change in Schistosomiasis Death Rate per 1000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_schistosomiasis_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Schistosomiasis Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_schistosomiasis(t,c);
         );
         put /;
);
put /;

put "Total Cardiovascular Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_cardiovascular(t,c);
         );
         put /;
);
put /;

put "Change in Total Cardiovascular Death Rate per 100,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_cardiovascular_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Cardiovascular Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_cardiovascular(t,c);
         );
         put /;
);
put /;

put "Heat Related Cardiovascular Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_cardiovascular_heat(t,c);
         );
         put /;
);
put /;

put "Change in Heat Related Cardiovascular Death Rate per 100,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_cardiovascular_heat_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Heat Related Cardiovascular Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_cardiovascular_heat(t,c);
         );
         put /;
);
put /;

put "Heat Related Cardiovascular Over 65 Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_cardiovascular_heat_over65(t,c);
         );
         put /;
);
put /;

put "Change in Heat Related Cardiovascular Over 65 Death Rate per 100,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_cardiovascular_heat_over65_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Heat Related Cardiovascular Over 65 Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_cardiovascular_heat_over65(t,c);
         );
         put /;
);
put /;

put "Heat Related Cardiovascular Under 65 Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_cardiovascular_heat_under65(t,c);
         );
         put /;
);
put /;

put "Change in Heat Related Cardiovascular Under 65 Death Rate per 100,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_cardiovascular_heat_under65_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Heat Related Cardiovascular Under 65 Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_cardiovascular_heat_under65(t,c);
         );
         put /;
);
put /;

put "Cold Related Cardiovascular Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_cardiovascular_cold(t,c);
         );
         put /;
);
put /;

put "Change in Cold Related Cardiovascular Death Rate per 100,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_cardiovascular_cold_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Cold Related Cardiovascular Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_cardiovascular_cold(t,c);
         );
         put /;
);
put /;

put "Cold Related Cardiovascular Over 65 Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_cardiovascular_cold_over65(t,c);
         );
         put /;
);
put /;

put "Change in Cold Related Cardiovascular Over 65 Death Rate per 100,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_cardiovascular_cold_over65_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Cold Related Cardiovascular Over 65 Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_cardiovascular_cold_over65(t,c);
         );
         put /;
);
put /;

put "Cold Related Cardiovascular Under 65 Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_cardiovascular_cold_under65(t,c);
         );
         put /;
);
put /;

put "Change in Cold Related Cardiovascular Under 65 Death Rate per 100,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_cardiovascular_cold_under65_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Cold Related Cardiovascular Under 65 Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_cardiovascular_cold_under65(t,c);
         );
         put /;
);
put /;

put "Respiratory Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_respiratory(t,c);
         );
         put /;
);
put /;

put "Change in Respiratory Death Rate per 100,000 due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put change_respiratory_rate(t,c);
         );
         put /;
);
put /;

put "Damages from Respiratory Deaths due to Climate Change (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put damages_respiratory(t,c);
         );
         put /;
);
put /;
