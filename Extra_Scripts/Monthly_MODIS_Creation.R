library(SouthAfricaDrought)
library(raster)
library(sf)
library(dplyr)


SA <- read_sf(dsn = "C:/Users/Emily/Documents/Fall_2020/Geospatial_R/SouthAfricaDrought/data-raw", layer = "SouthAfrica_Boundary")
crs(boundary)

fs <- dir("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/MODIS_Temp", pattern = "*mean*", full.names = TRUE)

l <- lapply(fs, raster)

s <- stack(l)

names(s) <- c("2019_11_mean_celsius", "2019_12_mean_celsius", "2020_01_mean_celsius", "2020_02_mean_celsius", "2020_03_mean_celsius")

writeRaster(s, "SA_MODIS_Monthly_Mean_Temp", format = "GTiff")
