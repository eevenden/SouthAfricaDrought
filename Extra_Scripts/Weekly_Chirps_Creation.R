library(SouthAfricaDrought)
library(raster)
library(sf)
library(dplyr)


SA <- system.file("extdata/SouthAfrica_Boundary.shp",
                  package = "SouthAfricaDrought") %>% st_read()

fs <- dir("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/Chirps/SouthAfrica_Imagery/SouthAfrica_Imagery", pattern = "SA.*\\.tif", full.names = TRUE)
fs

weekly_s <- stack(lapply(fs, function(x) crop(raster(x), SA)))

names(weekly_s) <- c('week1_2019-10-27_2019-11-02',
              'week2_2019-11-17_2019-11-23',
              'week3_2019-11-24_2019-11-30',
              'week4_2019-12-01_2019-12-07',
              'week5_2019-12-08_2019-12-14',
              'week6_2019-12-15_2019-12-21',
              'week7_2019-12-22_2019-12-28',
              'week8_2019-12-29_2019-01-05',
              'week9_2019-01-06_2019-01-12',
              'week10_2019-01-13_2019-01-19',
              'week11_2019-01-20_2019-01-26',
              'week12_2019-01-27_2019-02-02',
              'week13_2019-02-03_2019-02-09',
              'week14_2019-02-10_2019-02-16',
              'week15_2019-02-17_2019-02-23',
              'week16_2019-02-24_2019-03-02',
              'week17_2019-03-10_2019-03-16',
              'week18_2019-03-17_2019-02-23',
              'week19_2019-03-24_2019-03-30',
              'week20_2019-03-31_2019-04-06',
              'week21_2019-04-07_2019-04-13',
              'week22_2019-04-14_2019-04-20',
              'week23_2019-02-21_2019-02-27')

writeRaster(weekly_s, "SA_Chirps_Weekly_Mean_Precip", format = "GTiff")
