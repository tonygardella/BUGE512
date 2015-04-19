*GLOBAL Solow-Swan economic growth model
         y_gross(t,c)=pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);

         y_net(t,c)= (1-omega) * y_gross(t,c);

         i(t,c)=s(c)*y_net(t,c)*nyper;

         k(t+1,c)=i(t,c)+(1-delta(c))**nyper *k(t,c);

         emiss_count(t,c)=(emiss_int(t,c) * y_net(t,c))/t2mt;

         world_emissions(t)  =    sum( c, emiss_count(t,c))/mt2gt;

         y_pc(t,c)   =   y_gross(t,c)/pop(t,c)  ;