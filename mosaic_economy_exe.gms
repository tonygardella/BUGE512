*GLOBAL Solow-Swan economic growth model

         pro(t,c)= a("2010",c) * exp(prodgr*ord(t)-1);

         a(t,c)= y_gross(t,c) / [ l(t,c)**lshr * k(t,c)**(1 - lshr)];

         y_gross(t,c)=pro(t,c)*l(t,c)**(lshr) * k(t,c)**(1-lshr);

* for now  y_gross=y_net

         y_net(t,c)= y_gross(t,c);

         i(t,c)=s(c)*y_net(t,c)*nyper;

         k(t+1,c)=i(t,c)+(1-delta)**nyper *k(t,c);

         ei(t,c)= eii("2010",c)*exp(- aeei(t,c)*ord(t)-1);

         e(t,c)=(ei(t,c) * y_net(t,c))/ 10**9;

         te(t)       =    sum( c, e(t,c));
