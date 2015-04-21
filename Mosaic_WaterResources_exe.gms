*Water resources

W(t,c) = min(WR_par_cntry(c,"Alpha_water")*Y_pc("2010",c)* (1- Tau_water)**(t-2000)*(Y_pc(t,c)/Y_pc("2010",c))**Beta_water*(Pop(t,c)/Pop("2010", c)**N_water*(MAT(t)/1.0)**gamma_water)
                 , Y_pc(t,c)/10 );

*Tropical Storms

TD(t,c) = WR_par_cntry(c,"Alpha_tropstorm")* Y(t,c) * ((Y_pc(t,c)/Y_pc("2010",c))**epsilon_trop_storm) * [(1+ delta_trop_storm * CT(t))**gamma_trop_storm -1] ;

TM(t,c) = WR_par_cntry(c,"Beta_trop_storm")* P_dens(t,c) * ((Y_pc(t,c)/Y_pc("2010",c))**eta_trop_storm) * [(1+ delta_trop_storm * CT(t))**gamma_trop_storm -1] ;

*Etrop Storms

ETD(t,c) = WR_par_cntry(c,"alpha_etrop_storm") * Y(t,c) * ((Y_pc(t,c)/Y_pc("2010",c))**epsilon_etrop_storm) * WR_par_cntry(c,"delta_etrop_storm") * [(CO(t)/CO2_pre)**gamma_etrop_storm -1] ;

ETM(t,c) = WR_par_cntry(c,"beta_etrop_storm") * P_dens(t,c) * ((Y_pc(t,c)/Y_pc("2010",c))** psi_etrop_storm) * WR_par_cntry(c,"delta_etrop_storm") * [(CO(t)/CO2_pre)**gamma_etrop_storm -1]  ;