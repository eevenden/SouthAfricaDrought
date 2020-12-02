library(SouthAfricaDrought)
library(raster)
library(sf)
library(dplyr)


SA_new <- system.file("extdata/SouthAfrica_Boundary.shp", package = "SouthAfricaDrought") %>% st_read()
SA_new

fs <- dir("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/Chirps/LT", pattern = "*LT.*\\.tif", full.names = TRUE)
fs

l <- lapply(fs, raster)
plot(l[[1]])

lt_stack <- stack(lapply(fs, function(x) crop(raster(x), SA_new)))

names(s) <- c("Nov_LT", "Dec_LT", "Jan_LT", "Feb_LT", "March_LT")

writeRaster(s, "SA_LT_Mean_Precip", format = "GTiff")
