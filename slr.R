library(ggplot2)
library(reshape2)
library(data.table)
library(gdxrrw)

### Available parameters
paramlist <- c("P_dens", "P_growth", "y_pc", "y_pc_growth",
               "y_dens", "y_dens_growth", "Area",
               "CD_potential", "D_potential", "D_actual", "CD_actual", "VD",
               "pop_out", "pop_in", "migration_impact",
               "W", "CW", "VW", "consump_term", "NPVVP", "NPVVW", "NPVVD", "Protection")

## Run gams
igdx("/opt/gams/gams24.4_linux_x64_64_sfx")
gams("SLR")

## Read input
slr.dat <- data.table(rgdx.param("SLR.gdx", "P_dens"))
setnames(slr.dat, c("i", "j", "value"), c("year", "country", "P_dens"))
slr.dat[, year := as.numeric(as.character(year))]
for(p in paramlist[-1]){
    newdat <- data.table(rgdx.param("SLR.gdx", p))
    setnames(newdat, c("i", "j", "value"), c("year", "country", p))
    newdat[, year := as.numeric(as.character(year))]
    slr.dat <- merge(slr.dat, newdat, by=c("year", "country"))
}

