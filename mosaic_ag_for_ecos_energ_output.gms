*Country to region mapping

IAI_y_region(t,r)        =       sum(rcmap(c,r), IAI_y(t,c));
F_y_region(t,r)          =       sum(rcmap(c,r), F_y(t,c));
LE_y_region(t,r)         =       sum(rcmap(c,r), LE_y(t,c));
SH_y_region(t,r)         =       sum(rcmap(c,r), SH_y(t,c));
SC_y_region(t,r)         =       sum(rcmap(c,r), SC_y(t,c));

IAI_region(t,r)          =       sum(rcmap(c,r), IAI(t,c));
F_region(t,r)            =       sum(rcmap(c,r), F(t,c));
LE_region(t,r)           =       sum(rcmap(c,r), LE(t,c));
SH_region(t,r)           =       sum(rcmap(c,r), SH(t,c));
SC_region(t,r)           =       sum(rcmap(c,r), SC(t,c));

$ontext
*Put files by COUNTRY in USD
file out1 / ag_for_ecos_energ_COUNTRY_USD.csv /;
out.pc = 5;
out.nd = 7;
out.nr = 2;
put out1;
put "t" "c" "IAI" "LE" "F" "SH" "SC" /;
loop((t,c),
        put , t.tl, c.tl, IAI(t,c), LE(t,c), F(t,c), SH(t,c), SC(t,c) /;
        );
putclose;

*Put files by COUNTRY in fraction of GDP

file out2 / ag_for_ecos_energ_COUNTRY_FGDP.csv /;
out.pc = 5;
out.nd = 7;
out.nr = 2;
put out2;

put "t" "c" "IAI_y" "LE_y" "F_y" "SH_y" "SC_y" /;
loop((t,c),
        put , t.tl, c.tl, IAI_y(t,c), LE_y(t,c), F_y(t,c), SH_y(t,c), SC_y(t,c) /;
        );
putclose;

*Put files by REGION in USD

file out3 / ag_for_ecos_energ_REGION_USD.csv /;
out.pc = 5;
out.nd = 7;
out.nr = 2;
put out3;

put "t" "r" "IAI_region" "LE_region" "F_region" "SH_region" "SC_region" /;
loop((t,r),
        put , t.tl, r.tl, IAI_region(t,r), LE_region(t,r), F_region(t,r), SH_region(t,r), SC_region(t,r) /;
        );
putclose;

*Put files by REGION in fraction of GDP
file fileout / ag_for_ecos_energ_REGION_FGDP.csv /;
out.pc = 5;
out.nd = 7;
out.nr = 2;
put out4;

put "t" "r" "IAI_y_region" "LE_y_region" "F_y_region" "SH_y_region" "SC_y_region" /;
loop((t,r),
        put , t.tl, r.tl, IAI_y_region(t,r), LE_y_region(t,r), F_y_region(t,r), SH_y_region(t,r), SC_y_region(t,r) /;
        );
putclose;
$offtext
