library(ggplot2)
library(gridExtra)

source("slr.run.R")

# Common ggplot theme
theme.common <- theme_bw()
theme_set(theme.common)
ppng <- function(nm, h, ...) 
    png(nm, width=4, height=h, units="in", res=200, ...)

names(slr.us)
#  [1] "country"                     "year"                       
#  [3] "TATM"                        "SLR"                        
#  [5] "d_SLR"                       "Area"                       
#  [7] "pop"                         "P_dens"                     
#  [9] "P_growth"                    "y_net"                      
# [11] "y_pc"                        "y_pc_growth"                
# [13] "y_dens"                      "y_dens_growth"              
# [15] "CD_potential"                "D_potential"                
# [17] "D_actual"                    "CD_actual"                  
# [19] "VD"                          "pop_out"                    
# [21] "pop_in"                      "migration_impact"           
# [23] "W"                           "CW"                         
# [25] "W_size"                      "W_growth"                   
# [27] "VW"                          "consump_term"               
# [29] "NPVVP"                       "NPVVW"                      
# [31] "NPVVD"                       "Protection"                 
# [33] "area_2000"                   "area_r"                     
# [35] "area_frac"                   "coast_length"               
# [37] "coast_r"                     "coast_area_f"               
# [39] "dryland_loss"                "max_dryland_loss"           
# [41] "DEM"                         "land_value"                 
# [43] "wetland_loss_SLR"            "wetland_loss_coastalsqueeze"
# [45] "exposed_wetland"             "W_1990"                     
# [47] "coast_protection_cost"      

# Sea level rise (slr)
slr.us[year==2010, d_SLR := NA]
ppng("slr-figures/slr.png", 6)
p1 <- ggplot(slr.us) + aes(x=year, y=SLR) + geom_line() +
    ylab("SLR (m)") + 
    theme(axis.title.x = element_blank())
p2 <- ggplot(slr.us) + aes(x=year, y=d_SLR) + geom_line() +
    ylab("dSLR (m)") +
    theme(axis.title.x = element_blank())
p3 <- ggplot(slr.us) + aes(x=year, y=TATM) + geom_line() +
    xlab("Year") + ylab("T (deg C)")
grid.arrange(p1, p2, p3, nrow=3, ncol=1)
dev.off()

# Dryland (dryland)
#ppng("slr-figures/dryland.png", 8)
p1 <- ggplot(slr.cp) + aes(x=year, y=Protection) + geom_line() +
    facet_grid(country ~ ., scales="free_y")
plot(p1)
