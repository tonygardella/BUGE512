*AGRICULTURE
Ar(t,c)$(ord(t) > 1)     =       ag_par_cntry(c,"alpha") * (temp_change_interannual_national(t,c)/0.04)**ag_par_glob("B") + (1-(1/ag_par_glob("p"))) * Ar(t-1,c);
Al(t,c)                  =       ag_par_cntry(c,"deltal") * temp_change_national_from_2010(t,c) + ag_par_cntry(c,"deltaq") * (temp_change_national_from_2010(t,c)**2);
Af(t,c)                  =       ag_par_cntry(c,"gamma") * log(CO(t)/275);
IA(t,c)                  =       Ar(t,c) + Al(t,c) + Af(t,c);

sa(t,c)                  =       shr_ag(c,"share") * (Y_pc("2010",c)/Y_pc(t,c))**ag_par_glob("epsilon");
IAI(t,c)                 =       (IA(t,c) * sa(t,c))/100;

*ECOSYSTEMS
B(t)$(ord(t) > 1)        =       max(ecos_par_glob("Bo")/100,
                                 B(t-1)*(1-ecos_par_glob("rho")-ecos_par_glob("gamma") * (temp_change_interannual(t)**2/ecos_par_glob("tau")**2)));

LE(t, c)                 =       ecos_par_glob("alpha") * pop(t,c) *
                                 ((Y_pc(t,c)/ecos_par_glob("yb")) / 1+(Y_pc(t,c)/ecos_par_glob("yb"))) *
                                 ((temp_change_interannual(t)/ecos_par_glob("tau")) / 1+(temp_change_interannual(t)/ecos_par_glob("tau"))) *
                                 (1-ecos_par_glob("sigma") + ecos_par_glob("sigma") * (ecos_par_glob("Bo")/B(t)));

*FORESTRY
F(t,c)                   =       for_par_cntry(c,"alpha") * (Y_pc(t,c)/Y_pc("2010",c))**for_par_glob("epsilon") *
                                 (0.5 * temp(t)**for_par_glob("beta") + 0.5 * for_par_glob("gamma") * log(CO(t)/275));

*ENERGY
*This equation has a divide by zero error in exec. time, caused by missing countries in the pop table.
energ_term(t,c)          =       ((Y_pc(t,c)/Y_pc("2010",c))**energ_par_glob("epsilon") *
                                 (pop(t,c)/pop("2010",c))) / aeei_cntry(t,c);

*SH is going up and SC is going down, but equations are correct.
SH(t,c)                  =        energ_par_cntry(c,"aheat") * Y_gross("2010",c) * (arctan(temp_change_from_2010(t))/arctan(1)) * energ_term(t,c);
SC(t,c)                  =        energ_par_cntry(c,"acool") * Y_gross("2010",c) * (temp_change_from_2010(t))**energ_par_glob("beta") * energ_term(t,c);

