file outputecon /SolowSwanResult.txt/;
put outputecon;
outputecon.pc       =       6;
put "GDP by Region (2005 US dollars)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put y_region(t,r);
         );
         put /;
);
put /;

put "Emissions by Region (Mt CO2)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put emiss_region(t,r);
         );
         put /;
);
put /;

put "GDP per capita by Region (2005 US dollars)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(r,
         put r.tl;
         loop(t,
                 put y_percapita_region(t,r);
         );
         put /;
);
put /;

put "GDP by Country (2005 US dollars)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put y_net(t,c);
         );
         put /;
);
put /;

put "Emissions by Country (Mt CO2)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put emiss_count(t,c);
         );
         put /;
);
put /;

put "GDP per capita by country (2005 US dollars)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put y_pc(t,c);
         );
         put /;
);
put /;

put "GDP of World (2005 US dollars)"
put /;
put "";
loop(t,
         put t.tl;

);
put /;
put "World";
loop(t,

         put y_world(t);

);
put /;

put "Emissions of World (Gt CO2)"
put /;
put "";
loop(t,
         put t.tl;

);
put /;
put "World";
loop(t,

         put world_emissions(t);

);
put /;

put "GDP per capita of the world (2005 US dollars)"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
put "World";
loop(t,
         put y_percapita_world(t);

);
put /;
putclose outputecon;
