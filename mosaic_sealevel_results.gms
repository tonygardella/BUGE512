* Results of sea level rise code
file output_sealevel /output_sealevel.csv/
put output_sealevel;
output_sealevel.pc  = 5;
output_sealevel.nd = 10;
output_sealevel.nr = 2;
output_sealevel.nz = 1.0e-10;
output_sealevel.nw = 24;
output_sealevel.pw = 32767;
put "year", "country", "SLR", "d_SLR", "Area", "CD_potential", "D_potential", "D_actual", "CD_actual",
"VD", "pop_out", "pop_in", "migration_impact", "W", "CW", "W_size", "W_growth", "VW",
"consump_term", "NPVVP", "NPVVW", "NPVVD", "Protection"
put /;
loop(t,
loop(c,
put t.tl, c.tl, SLR(t), d_SLR(t), Area(t,c), CD_potential(t,c), D_potential(t,c), D_actual(t,c), CD_actual(t,c),
VD(t,c), pop_out(t,c), pop_in(t,c), migration_impact(t,c), W(t,c), CW(t,c), W_size(t,c), W_growth(t,c), VW(t,c),
consump_term(t,c), NPVVP(t,c), NPVVW(t,c), NPVVD(t,c), Protection(t,c);
put /;
));
putclose output_sealevel;

