library(reshape2)
library(data.table)
library(gdxrrw)

## Run gams
igdx("/opt/gams/gams24.4_linux_x64_64_sfx")
print(gams("SLR"))
slr.raw <- fread("output_sealevel.csv", header=TRUE, na.strings=c("UNDF"))
slr.dat <- slr.raw[, lapply(.SD, as.numeric), .SDcols=-2][, country := slr.raw[,country]]
setkey(slr.dat, country)
slr.country <- data.table(rgdx.param("SLR.gdx", "SLR_par_c"))
setnames(slr.country, c("i", "j"), c("country", "parameter"))
slr.country <- data.table(dcast(slr.country, country ~ parameter))
slr.full <- merge(slr.dat, slr.country, by = "country")
slr.dat <- slr.full[year > 2010]

# Subsets for quick plotting
slr.wet <- slr.dat[coast_length > 0]
setkey(slr.wet, country)
slr.us <- slr.dat["USA"]
cp <- c("USA", "CHN", "NZL", "IDN", "BRA", "NLD", "BRB", "NGA")
slr.cp <- slr.dat[cp]
setkey(slr.cp, country)

# Debug plot
p1 <- ggplot(slr.us) + aes(x=year, y=Protection) + geom_line()
p2 <- ggplot(slr.us) + aes(x=year, y=D_potential) + geom_line()
p3 <- ggplot(slr.us) + aes(x=year, y=D_actual) + geom_line()
p4 <- ggplot(slr.us) + aes(x=year, y=CD_actual) + geom_line()
p5 <- ggplot(slr.us) + aes(x=year, y=NPVVD) + geom_line()
p6 <- ggplot(slr.us) + aes(x=year, y=NPVVW) + geom_line()
grid.arrange(p1, p2, p3, p4, p5, p6, ncol=1)

p <- ggplot(slr.us) + aes(x=y_dens_growth, y=NPVVD/y_net) + geom_line() +
    geom_abline(slope=0, intercept=0)
plot(p)
