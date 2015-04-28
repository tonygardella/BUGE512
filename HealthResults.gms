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

put "Schistosomisis Deaths due to Climate Change (by country)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put deaths_schistosomisis(t,c);
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
                 put value_year_morbidity(t,c);
         );
         put /;
);
put /;


execute_unload;
