*Country to region mapping

IAI_y_region(t,r)        =       sum(rcmap(r,c), IAI_y(t,c));
F_y_region(t,r)          =       sum(rcmap(r,c), F_y(t,c));
LE_y_region(t,r)         =       sum(rcmap(r,c), LE_y(t,c));
SH_y_region(t,r)         =       sum(rcmap(r,c), SH_y(t,c));
SC_y_region(t,r)         =       sum(rcmap(r,c), SC_y(t,c));

IAI_region(t,r)          =       sum(rcmap(r,c), IAI(t,c));
F_region(t,r)            =       sum(rcmap(r,c), F(t,c));
LE_region(t,r)           =       sum(rcmap(r,c), LE(t,c));
SH_region(t,r)           =       sum(rcmap(r,c), SH(t,c));
SC_region(t,r)           =       sum(rcmap(r,c), SC(t,c));

*Put files by COUNTRY in USD
file out / ag_for_ecos_energ_COUNTRY_USD.csv /;
out.pc = 5;
out.nd = 7;
out.nr = 2;
put out;
put "t" "c" "IAI" "LE" "F" "SH" "SC" /;
loop((t,c),
        put , t.tl, c.tl, IAI(t,c), LE(t,c), F(t,c), SH(t,c), SC(t,c) /;
        );
putclose;

*Put files by COUNTRY in fraction of GDP
file out / ag_for_ecos_energ_COUNTRY_FGDP.csv /;
out.pc = 5;
out.nd = 7;
out.nr = 2;
put out;
put "t" "c" "IAI_y" "LE_y" "F_y" "SH_y" "SC_y" /;
loop((t,c),
        put , t.tl, c.tl, IAI_y(t,c), LE_y(t,c), F_y(t,c), SH_y(t,c), SC_y(t,c) /;
        );
putclose;

*Put files by REGION in USD
file out / ag_for_ecos_energ_REGION_USD.csv /;
out.pc = 5;
out.nd = 7;
out.nr = 2;
put out;
put "t" "c" "IAI_region" "LE_region" "F_region" "SH_region" "SC_region" /;
loop((t,c),
        put , t.tl, c.tl, IAI_region(t,c), LE_region(t,c), F_region(t,c), SH_region(t,c), SC_region(t,c) /;
        );
putclose;

*Put files by REGION in fraction of GDP
file out / ag_for_ecos_energ_REGION_FGDP.csv /;
out.pc = 5;
out.nd = 7;
out.nr = 2;
put out;
put "t" "c" "IAI_y_region" "LE_y_region" "F_y_region" "SH_y_region" "SC_y_region" /;
loop((t,c),
        put , t.tl, c.tl, IAI_y_region(t,c), LE_y_region(t,c), F_y_region(t,c), SH_y_region(t,c), SC_y_region(t,c) /;
        );
putclose;
