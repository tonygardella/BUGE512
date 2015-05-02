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

* OUTPUT HEALTH RESULTS IN TXT FILE
file resultfile /HealthResults.txt/;
put resultfile;
resultfile.pc       =       6;

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
                 put total_deaths_pop_fraction(t,c);
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

put "Value of Year of Morbidity (2005$ USD by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put value_year_morbidity(t,c);
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

put "Total Vector Borne Deaths due to Climate Change(by country)"
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

put "Malaria Deaths due to Climate Change(by country)"
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

