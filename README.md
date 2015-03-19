# Naming conventions

## General naming:
* `t` -- Time (year)
* `r` -- Region
* `s` -- Sector ???

## Common Parameters:
* `tol_param(r, s, "description")`
* `temp(t)` -- Global mean temperature at time `t`
* `RF(t)` -- Radiative forcing at time `t`
* `SL(t)` -- Sea level at time `t`
* `SLR(t)` -- Sea level rise at time `t`
* `Y(t,r)` -- Income in region `r` at time `t`
* `Y_pc(t, r)` -- Per capita income in region `r` at time `t`
* `Y_pc_growth(t,r)` -- Growth rate of per-capita income of region `r` at time `t`
* `A(t,r)` -- Area of region `r` at time `t`
* `P_dens(t,r)` -- Population density of region `r` at time `t`
* `P_growth(t,r)` -- Population growth of region `r` at time `t`
* `CO2(t)` -- CO2 atmospheric concentration at time `t`

## Aggregate states:
* Region (`r`) -- `"world"`
* Sector (`s`) -- `"all"`

* E.g., a parameter that is region specific but encompasses all sectors: `tol_param(r, "all", "elevation")`
* Or, a parameter that is not region or sector specific: `tol_param("world", "all", "income_elasticity")`

## Other conventions:
* For recursive processes, use `t`, `t-1`, `t-2`... syntax (rather than ...`t+2`, `t+1`, `t`).
