*GLOBAL Solow-Swan economic growth model

         pro(t,c)= a("2010",c) * exp(prodgr*ord(t)-1);

         a(t,c)= y_gross(t,c) / [ l(t,c)**lshr * k(t,c)**(1 - lshr)];

         y_gross(t,c)=pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);

* for now  y_gross=y_net

         y_net(t,c)= (1-omega) * y_gross(t,c);

         i(t,c)=s(c)*y_net(t,c)*nyper;

         k(t+1,c)=i(t,c)+(1-delta)**nyper *k(t,c);

         emiss_int(t,c)= eii("2010",c)*exp(- aeei(t,c)*ord(t)-1);

         emiss_count(t,c)=(ei(t,c) * y_net(t,c))/ 10**9;

         world_emissions(t)  =    sum( c, e(t,c));

         y_pc(t,c)   =   y_net(t,c)/pop(t,c)   ;
