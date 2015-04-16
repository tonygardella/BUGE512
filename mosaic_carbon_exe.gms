* DICE carbon cycle model
* Climate and carbon cycle
        MAT(t+1)    = MAT(t)*b11 + MU(t)*b21 + world_emissions(t)*(nyper/3.6660));
        ML(t+1)     = ML(t)*b33  + MU(t)*b23;
        FORC(t+1)   = fco22x * ((log((MAT(t+1)/588.000))/log(2))) + forcoth(t);
        MU(t+1)     = MAT(t)*b12 + MU(t)*b22 + ML(t)*b32;
        TATM(t+1)   = TATM(t) + c1 * ((FORC(t+1)-(fco22x/t2xco2)*TATM(t))-(c3*(TATM(t)-TOCEAN(t))));
        TOCEAN(t+1) = TOCEAN(t) + c4*(TATM(t)-TOCEAN(t));

*TEMPERATURE AND CO2

        temp(t)                                            = tempC_preind + TATM(t);
        temp_r(t,c)                                        = temp(t) * Country_Tol_regional_temp(c);
        temp_change_from_preind_national(t,c)              = TATM(t) * Country_Tol_regional_temp(c);

        CO2_ppm(t)                                         = (MAT(t)/2.13) + CO2_ppm_preind;
        temp_change_interannual(t)$(ord(t) > 1)            = temp(t)- temp(t-1);
        temp_change_interannual_national(t,c)$(ord(t) > 1) = temp_r(t,c) - temp_r(t-1,c);
        temp_change_from_2010(t)                           = temp(t) - temp("2010");
        temp_change_national_from_2010(t,c)                = temp_r(t,c) - temp_r("2010",c);
