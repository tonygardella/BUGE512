* DICE carbon cycle model
* Climate and carbon cycle
        MAT(t+1)                 =     MAT(t)*b11 + MU(t)*b21 + (sum(c, e(t,c))*(5/3.666/1000));
        ML(t+1)                  =     ML(t)*b33  + MU(t)*b23;
        FORC(t+1)                =     fco22x * ((log((MAT(t+1)/588.000))/log(2))) + forcoth(t);
        MU(t+1)                  =     MAT(t)*b12 + MU(t)*b22 + ML(t)*b32;
        TATM(t+1)                =     TATM(t) + c1 * ((FORC(t+1)-(fco22x/t2xco2)*TATM(t))-(c3*(TATM(t)-TOCEAN(t))));
        TOCEAN(t+1)              =     TOCEAN(t) + c4*(TATM(t)-TOCEAN(t));

