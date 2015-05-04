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
                    "W", "CW", "W_growth", "W_size", "VW", 
                    "consump_term", "NPVVP", "NPVVW", "NPVVD", "Protection")
global.params <- c("TATM", "SLR", "world_emissions")

## Run gams
igdx("/opt/gams/gams24.4_linux_x64_64_sfx")
gams("SLR")

## Read input
slr.dat <- data.table(read.csv("output_sealevel.csv", header=TRUE))
slr.dat[, year := as.numeric(as.character(year))]

slr.country <- data.table(rgdx.param("SLR.gdx", "SLR_par_c"))
setnames(slr.country, c("i", "j"), c("country", "parameter"))
slr.country <- data.table(dcast(slr.country, country ~ parameter))


## Debugging
weird <- c("BEL", "BLZ", "BRN", "CYP", "ISL", "MLT", "IRL", "NLD", "NZL", "SUR", "URY")
setkey(slr.country, country)
slr.country[weird]
setkey(slr.dat, country)
slr.dat[weird, list(country, year, CD_actual, CD_potential, CW, Area)]
ggplot(slr.dat) + aes(x=year, y=migration_impact) + geom_line() + facet_wrap("country", scales="free_y")
