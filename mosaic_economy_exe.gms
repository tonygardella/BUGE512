*GLOBAL Solow-Swan economic growth model

         y_gross(t,c)=pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);

* for now  y_gross=y_net

         y_net(t,c)= (1-omega) * y_gross(t,c);

         i(t,c)=s(c)*y_net(t,c)*nyper;

         k(t+1,c)=i(t,c)+(1-delta)**nyper *k(t,c);

         emiss_count(t,c)=(emiss_int(t,c) * y_net(t,c))/ mt2gt;

         world_emissions(t)  =    sum( c, emiss_count(t,c));
