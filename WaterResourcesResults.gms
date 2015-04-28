file outfile1 /water_resources.txt/;
put outfile1;
outfile1.pc       =       6;

put "Damage to Water Resources (2005 US Dollar) by Country"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put WR(t,c);
         );
         put /;
);
put /;

put "Total Damage from Tropical Storms in 2005 US Dollars by Country"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put TD(t,c);
         );
         put /;
);
put /

put "Total Mortality from Tropical Storms in number of lives lost by Country "
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put TM(t,c);
         );
         put /;
);
put /;

put "Total Damage from ExtraTropical Storms in 2005 US Dollars by Country"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put ETD(t,c);
         );
         put /;
);
put /;


put "Total Mortality from ExtraTropical Storms in number of lives lost by Country"
put /;
put "";
loop(t,
         put t.tl;
);
put /;
loop(c,
         put c.tl;
         loop(t,
                 put ETM(t,c);
         );
         put /;
);
put /;

putclose outfile1;
