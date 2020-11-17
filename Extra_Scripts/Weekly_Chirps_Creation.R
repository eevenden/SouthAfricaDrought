library(SouthAfricaDrought)
library(raster)
library(sf)
library(dplyr)


SA <- system.file("extdata/SouthAfrica_Boundary.shp",
                  package = "SouthAfricaDrought") %>% st_read()

fs <- dir("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/Chirps/SouthAfrica_Imagery/SouthAfrica_Imagery", pattern = "SA.*\\.tif", full.names = TRUE)
fs

l <- lapply(fs, raster)

week1 <- crop(l[[1]], SA)
week2 <- crop(l[[2]], SA)
week3 <- crop(l[[3]], SA)
week4 <- crop(l[[4]], SA)
week5 <- crop(l[[5]], SA)
week6 <- crop(l[[6]], SA)
week7 <- crop(l[[7]], SA)
week8 <- crop(l[[8]], SA)
week9 <- crop(l[[9]], SA)
week10 <- crop(l[[10]], SA)
week11 <- crop(l[[11]], SA)
week12 <- crop(l[[12]], SA)
week13 <- crop(l[[13]], SA)
week14 <- crop(l[[14]], SA)
week15 <- crop(l[[15]], SA)
week16 <- crop(l[[16]], SA)
week17 <- crop(l[[17]], SA)
week18 <- crop(l[[18]], SA)
week19 <- crop(l[[19]], SA)
week20 <- crop(l[[20]], SA)
week21 <- crop(l[[21]], SA)
week22 <- crop(l[[22]], SA)
week23 <- crop(l[[23]], SA)

weekly_s <- raster::stack(week1, week2, week3, week4, week5, week6, week7, week8, week9, week10, week11, week12, week13, week14, week15, week16, week17, week18, week19, week20, week21, week22, week23)

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
