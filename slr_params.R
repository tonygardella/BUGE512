# Script to generate correct data file
library(data.table)
np1 <- fread("SLR_national_pars_csv.csv", header=TRUE)

# Compute regional area and coast, and fractions
np1[, area_r := sum(area_2000), by=Region]
np1[, coast_r := sum(coast_length), by=Region]
np1[, coast_rm := mean(coast_length), by=Region]
np1[, area_frac := area_2000 / area_r]
np1[, coast_frac := coast_length / coast_r]
np1[, coast_meanrat := coast_length / coast_rm]

# Copy regional parameters
np1[, dryland_loss_r := dryland_loss]
np1[, wetland_loss_SLR_r := wetland_loss_SLR]
np1[, wetland_loss_coastalsqueeze_r := wetland_loss_coastalsqueeze]
np1[, exposed_wetland_r := exposed_wetland]
np1[, W_1990_r := W_1990]
np1[, coast_protection_cost_r := coast_protection_cost]

# Disaggregate parameters
np1[, dryland_loss := dryland_loss_r * area_frac * coast_meanrat]
np1[, wetland_loss_SLR := wetland_loss_SLR_r * area_frac * coast_meanrat]
np1[, wetland_loss_coastalsqueeze := wetland_loss_coastalsqueeze_r * area_frac * coast_meanrat]
np1[, exposed_wetland := exposed_wetland_r * area_frac * coast_meanrat]
#np1[, exposed_wetland := min(exposed_wetland, 0.4*area_2000)]
np1[, W_1990 := W_1990_r * area_frac * coast_meanrat]
#np1[, W_1990 := min()]
np1[, coast_protection_cost := coast_protection_cost_r * coast_meanrat]

# Set maximums
np1[, max_dryland_loss := area_2000 - exposed_wetland - 10]

# Print results
#print(np1[, list(INDEX, max_dryland_loss/area_2000, exposed_wetland/area_2000, W_1990/area_2000)], nrow=200)

# Write to file
np.out <- np1[, list(INDEX, area_2000, area_r, area_frac,
                  coast_length, coast_r, coast_meanrat,
                  dryland_loss, max_dryland_loss, DEM, land_value,
                  wetland_loss_SLR, wetland_loss_coastalsqueeze, 
                  exposed_wetland, W_1990, coast_protection_cost)]
write.csv(np.out, file="SLR_national_pars.csv", row.names=FALSE, quote=FALSE)

