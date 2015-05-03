* Results of sea level rise code
file output_sealevel /output_sealevel.csv/
put output_sealevel;
output_sealevel.pc  = 5;
put "year", "country", "Area", "CD_potential", "D_potential", "D_actual", "CD_actual",
"VD", "pop_out", "pop_in", "migration_impact", "W", "CW", "W_size", "W_growth",
"consump_term", "NPVVP", "NPVVW", "NPVVD", "Protection"
put /;
loop(t,
loop(c,
put t.tl, c.tl, Area(t,c), CD_potential(t,c), D_potential(t,c), D_actual(t,c),
VD(t,c), pop_out(t,c), pop_in(t,c), migration_impact(t,c), W(t,c), CW(t,c),
W_size(t,c), W_growth(t,c), consump_term(t,c), NPVVP(t,c), NPVVD(t,c),
Protection(t,c);
put /;
));
putclose output_sealevel;

