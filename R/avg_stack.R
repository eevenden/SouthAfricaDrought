#' Avg_stack function
#'
#' @description This function allows you to search for raster files in a folder, crop them, average them, and output the result as a new file
#' @param x folder where data files are
#' @param y the pattern by which to search for files
#' @param boundary the vector file used to crop each raster file retrieved 
#' @param aa output file name
#' @export
#' @examples
#' monthly_temp("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/MODIS_Temp", "2020_01.*\\.tif", SA, "2020_01_mean_temp.tif")
#' 
avg_stack <- function(x, y, boundary, aa){
  
  fs <- dir(x, pattern = y, full.names = TRUE)
  
  s <- fs %>% lapply(raster) %>% stack
  
  boundary <- st_transform(boundary, crs = st_crs(s[[1]]))
  
  new_s <- crop(s, boundary) %>% calc(., function(x) (x * 0.02)-273)
  
  temp_zmu <- calc(x = new_s, fun = mean, na.rm = TRUE)
  
  writeRaster(temp_zmu, filename = file.path(x, aa))
}