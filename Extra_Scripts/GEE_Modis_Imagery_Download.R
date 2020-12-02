library(mapview)
library(rgee)
library(googledrive)
library(sf)

#Import SA boundary
boundary <- read_sf(dsn = "C:/Users/Emily/Documents/Fall_2020/Geospatial_R/SouthAfricaDrought/data-raw", layer = "SouthAfrica_Boundary")
#Retrieve bounding box coordinates
boundary

ee_Initialize(email = 'evendene@gwmail.gwu.edu', drive = TRUE)
#Create polygon using bounding box coordinates
polygon <- ee$Geometry$Polygon(list(c(16.45189, -34.83417), c(32.94498, -34.83417), c(32.94498, -22.12503), c(16.45189, -22.12503), c(16.45189, -22.12503)))



#Turn this polygon into a feature collection
fc <- ee$FeatureCollection(polygon)

#Filter imagery
collection <- ee$ImageCollection("MODIS/006/MOD11A1")$
  filterDate("2019-11-01", "2020-03-31")$
  filterBounds(polygon)$
  select('precipitation')
  
#See how many images are included in this collection
count <-  collection$size()$getInfo()
count
           
#Export  collection
downConfig = list(scale = 500, maxPixels = 1.0E13, driveFolder = 'SouthAfrica_Imagery')
img_lst = collection$toList(count)

usda_stars_time <- list()
for (index in seq_len(count)) {
  image = ee$Image(img_lst$get(index-1))
  name = image$get('system:index')$getInfo()
  print(name)
  usda_stars <- ee_as_stars(
    image = image,
    region = polygon,
    scale = downConfig$scale,
    maxPixels = downConfig$maxPixels,
    container = downConfig$driveFolder
  )
  names(usda_stars) <- name
  usda_stars[usda_stars==0] = NA
  usda_stars_time[[index]] <- usda_stars
}
usda_stars_mosaic <- do.call(st_mosaic, usda_stars_time)
