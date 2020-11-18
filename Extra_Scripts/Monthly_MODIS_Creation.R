library(SouthAfricaDrought)
library(raster)
library(sf)
library(dplyr)


SA <- read_sf(dsn = "C:/Users/Emily/Documents/Fall_2020/Geospatial_R/SouthAfricaDrought", layer = "SouthAfrica_Boundary")
crs(SA)

fs <- dir("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/Chirps", pattern = "*Prec*", full.names = TRUE)

l <- lapply(fs, raster)

month1 <- crop(l[[1]], SA)
month2 <- crop(l[[2]], SA)
month3 <- crop(l[[3]], SA)
month4 <- crop(l[[4]], SA)
month5 <- crop(l[[5]], SA)

s <- stack(c(month1, month2, month3, month4, month5))
  
names(s) <- c("2019_11_mean_celsius", "2019_12_mean_celsius", "2020_01_mean_celsius", "2020_02_mean_celsius", "2020_03_mean_celsius")

writeRaster(s, "SA_MODIS_Monthly_Mean_Temp", format = "GTiff")
