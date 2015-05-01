library(ggplot2)
library(reshape2)
library(data.table)
library(gdxrrw)

### Available parameters
country.params <- c("y_gross", "y_net", "emiss_count",
                    "P_dens", "P_growth", "y_pc", "y_pc_growth",
                    "y_dens", "y_dens_growth", "Area",
                    "CD_potential", "D_potential", "D_actual", "CD_actual", "VD",
                    "pop_out", "pop_in", "migration_impact",
                    "W", "CW", "VW", "consump_term", "NPVVP", "NPVVW", "NPVVD", "Protection")

global.params <- c("TATM", "SLR", "world_emissions")
country.only <- c("CDmax", "CWmax", "Area_frac")

## Run gams
igdx("/opt/gams/gams24.4_linux_x64_64_sfx")
gams("SLR")

## Read input
slr.dat <- data.table(rgdx.param("SLR.gdx", country.params[1]))
setnames(slr.dat, c("i", "j", "value"), c("year", "country", country.params[1]))
slr.dat[, year := as.numeric(as.character(year))]
for(p in country.params[-1]){
    newdat <- data.table(rgdx.param("SLR.gdx", p))
    setnames(newdat, c("i", "j", "value"), c("year", "country", p))
    newdat[, year := as.numeric(as.character(year))]
    slr.dat <- merge(slr.dat, newdat, by=c("year", "country"))
}

slr.global.dat <- data.table(rgdx.param("SLR.gdx", global.params[1]))
setnames(slr.global.dat, c("i", "value"), c("year", global.params[1]))
slr.global.dat[, year := as.numeric(as.character(year))]
for(p in global.params[-1]){
    newdat <- data.table(rgdx.param("SLR.gdx", p))
    setnames(newdat, c("i", "value"), c("year", p))
    newdat[, year := as.numeric(as.character(year))]
    slr.global.dat <- merge(slr.global.dat, newdat, by="year")
}

slr.country <- data.table(rgdx.param("SLR.gdx", country.only[1]))
setnames(slr.country, c("i", "value"), c("country", country.only[1]))
for(p in country.only[-1]){
    newdat <- data.table(rgdx.param("SLR.gdx", p))
    setnames(newdat, c("i", "value"), c("country", p))
    slr.country <- merge(slr.country, newdat, by="country")
}

slr.par.c <- data.table(rgdx.param("SLR.gdx", "SLR_par_c"))
setnames(slr.par.c, c("i", "j"), c("country", "parameter"))
slr.par.c2 <- dcast(slr.par.c, country ~ parameter)
slr.country <- merge(slr.country, slr.par.c2, by="country")


## Debugging
weird <- c("BRN", "MLT", "SGP")
setkey(slr.country, country)
slr.country[weird]
setkey(slr.dat, country)
slr.dat[weird, list(country, year, CD_actual, CD_potential, CW, Area)]
ggplot(slr.dat) + aes(x=year, y=y_pc) + geom_line() + facet_wrap("country", scales="free_y")
