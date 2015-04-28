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

