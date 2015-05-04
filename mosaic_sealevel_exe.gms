* FUND Sea level rise
* AUTHOR: Alexey Shiklomanov

* Derived economic quantities
        P_dens(t,c)                   =     pop(t,c) / Area(t,c);
        P_growth(t,c)$(ord(t)>1)      =     pop(t,c) / pop(t-1,c);
        y_pc(t,c)                     =     y_net(t,c) / pop(t,c);
        Y_pc_growth(t,c)$(ord(t)>1)   =     y_pc(t,c) / y_pc(t-1,c) - 1;
        Y_dens(t,c)                   =     y_net(t,c) / Area(t,c);
        Y_dens_growth(t,c)$(ord(t)>1) =     y_dens(t,c) / y_dens(t-1,c) - 1;

*** Sea level equations ***
* NOTE: Adjusted for 5 year time step (nyper)
* NOTE: I think original equation was in cm (based on results),
*   so I divided second term by 100. This gives more reasonable
*   results (~ 1 m SLR by 2100)
        SLR(t)$(ord(t)>1)             =     ((1 - 1/(SLR_par_gl("SL_eft")))**nyper) * SLR(t-1) +
                                                (SLR_par_gl("SL_temp_sensitivity") * TATM(t));

*** Dryland ***
        CD_potential(t,cwet)$(ord(t)>1)  =     min(SLR_par_c(cwet, "dryland_loss") * SLR(t)**(SLR_par_c(cwet, "DEM")), 
                                                SLR_par_c(cwet, "max_dryland_loss"));
        D_potential(t,cwet)$(ord(t)>1)   =     CD_potential(t,cwet) - CD_actual(t-1,cwet);
        D_actual(t,cwet)$(ord(t)>1)      =     (1 - Protection(t,cwet)) * D_potential(t,cwet);
        CD_actual(t,cwet)$(ord(t)>1)     =     CD_actual(t-1,cwet) + D_actual(t,cwet);
        VD(t,c)                       =     SLR_par_gl("land_value") *
                                                (Y_dens(t,c) / SLR_par_gl("income_density")) ** 
                                                    SLR_par_gl("land_value_elasticity");

*** Migration ***
        pop_out(t,c) = P_dens(t,c) * D_actual(t,c);
        pop_in(t,c) = sum(c2, migration(c, c2) * pop_out(t,c2));
        migration_impact(t,c) = SLR_par_gl("migrant_out") * pop_out(t,c) * Y_pc(t,c) -
                                    SLR_par_gl("migrant_in") * pop_in(t,c) * Y_pc(t,c);

*** Wetland ***
        W(t,cwet)$(ord(t)>1)             =     SLR_par_c(cwet, "wetland_loss_SLR") * SLR(t) +
                                                SLR_par_c(cwet, "wetland_loss_coastalsqueeze") * Protection(t, cwet) * SLR(t);
        CW(t,cwet)$(ord(t)>1)            =     min(CW(t-1,cwet) + W(t,cwet), SLR_par_c(cwet, "exposed_wetland"));
        W_size(t,cwet)                  =  SLR_par_c(cwet, "W_1990") - CW(t,cwet);
        W_growth(t,cwet)$(ord(t)>1)     =   W_size(t,cwet)/W_size(t-1,cwet) - 1;
        VW(t,c)                       =     21 * SLR_par_gl("W_service_value") *
                                                (Y_pc(t,c)/SLR_par_gl("W_income_normalization")) ** 
                                                    SLR_par_gl("WV_income_elasticity") *
                                                (P_dens(t,c)/SLR_par_gl("W_popdens_normalization")) ** 
                                                    SLR_par_gl("WV_popdens_elasticity") *
                                                (1 - CW(t,c)/SLR_par_c(c, "W_1990")) **
                                                    SLR_par_gl("WV_size_elasticity");

*** Protection costs ***
        consump_term(t,c)             =     RHO + ETA * Y_pc_growth(t,c);
        NPVVP(t,c)                    =     (1 + consump_term(t,c)) / consump_term(t,c)
                                                * SLR_par_c(c, "coast_protection_cost") * SLR(t);
        NPVVW(t,c)                    =     W(t,c) * VW(t,c) * (1 + consump_term(t,c)) /
                                                (consump_term(t,c) -
                                                    SLR_par_gl("WV_income_elasticity") * Y_pc_growth(t,c) -
                                                    SLR_par_gl("WV_popdens_elasticity") * P_growth(t,c) -
                                                    SLR_par_gl("WV_size_elasticity") * W_growth(t,c)
                                        );
        NPVVD(t,c)                    =     D_potential(t,c) * VD(t,c) *
                                                (1 + consump_term(t,c)) /
                                                (consump_term(t,c) - SLR_par_gl("DV_income_elasticity") * Y_dens_growth(t,c));
        Protection(t+1,cwet)             =     min(max(0, 1 - 0.5 * (NPVVP(t,cwet) + NPVVW(t,cwet))/NPVVD(t,cwet)), 1);

*** Calculate next year's area
        Area(t+1,cwet)                   =     max(Area("2010",cwet) - CW(t,cwet) - CD_actual(t,cwet), 1);

