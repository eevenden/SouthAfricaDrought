#' deciles_class
#'
#' @description This function allows you to reclassify a raster stack according to values in the deciles dataframe.
#' @param x folder where data files are
#' @export
#' @examples
#' crop_stack("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/Chirps", "2020_01.*\\.tif", SA, "2020_01_mean_temp.tif")
#' 
decile_class <- function(df, short_term){
  
  x = 1
  
  while (x < (nlayers(short_term) + 1)) {
    
    m <- c(-Inf, df[x, 3], 1,
           df[x, 3], df[x, 5], 2, 
           df[x, 5], df[x, 7], 3, 
           df[x, 7], df[x, 9], 4,
           df[x, 9], Inf, 5)
    
    rclmat <- matrix(m, ncol=3, byrow=TRUE)
    
    rc <- reclassify(short_term[[x]], rclmat)
    
    list[[x]] <- rc
    
    x = x + 1
  }
  
  return(list)
}