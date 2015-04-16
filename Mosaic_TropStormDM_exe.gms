
TD(t+1,c) = alpha_trop_storm(c)* Y(t,c) * ((Y_pc(t,c)/Y_pc("2010",c))**epsilon_trop_storm) * [(1+ delta_trop_storm * Temp(t))**gamma_trop_storm -1] ;

TM(t+1,c) = beta_trop_storm(c)* P_dens(t,c) * ((Y_pc(t,c)/Y_pc("2010",c))**eta_trop_storm) * [(1+ delta_trop_storm * Temp(t))**gamma_trop_storm -1] ;