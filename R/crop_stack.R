#' Crop_stack
#'
#' @description This function allows you to search for raster files in a folder, crop them, and output the result as a new stacked file
#' @param x folder where data files are
#' @param y the pattern by which to search for files
#' @param boundary the vector file used to crop each raster file retrieved 
#' @param aa output file name
#' @export
#' @examples
#' crop_stack("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/Chirps", "2020_01.*\\.tif", SA, "2020_01_mean_temp.tif")
#' 
crop_stack <- function(x, y, boundary, aa){
  
  fs <- dir(x, pattern = y, full.names = TRUE)
  
  s <- fs %>% lapply(raster) %>% stack
  
  boundary <- st_transform(boundary, crs = st_crs(s[[1]]))
  
  new_s <- crop(s, boundary)
  
  writeRaster(new_s, filename = file.path(x, aa))
}