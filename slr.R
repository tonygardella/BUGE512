library(ggplot2)
library(reshape2)
library(data.table)
library(gdxrrw)

## Run gams
igdx("/opt/gams/gams24.4_linux_x64_64_sfx")
gams("SLR")
slr.raw <- fread("output_sealevel.csv", header=TRUE, na.strings=c("UNDF"))
slr.dat <- slr.raw[, lapply(.SD, as.numeric), .SDcols=-2][, country := slr.raw[,country]]
setkey(slr.dat, country)
slr.country <- data.table(rgdx.param("SLR.gdx", "SLR_par_c"))
setnames(slr.country, c("i", "j"), c("country", "parameter"))
slr.country <- data.table(dcast(slr.country, country ~ parameter))
slr.dat <- merge(slr.dat, slr.country, by = "country")
slr.wet <- slr.dat[coast_length > 0]
setkey(slr.wet, country)

ggplot(slr.wet) + aes(x=year, y=Protection) + geom_line() + facet_wrap("country", scales="free_y")



## Debugging
weird <- c("BEL", "BLZ", "BRN", "CYP", "ISL", "MLT", "IRL", "NLD", "NZL", "SUR", "URY")
setkey(slr.country, country)
slr.country[weird]
setkey(slr.dat, country)
slr.dat[weird, list(country, year, CD_actual, CD_potential, CW, Area)]
ggplot(slr.dat) + aes(x=year, y=W_size) + geom_line() + facet_wrap("country", scales="free_y")
