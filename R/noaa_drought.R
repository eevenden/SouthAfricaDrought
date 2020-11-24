#' noaa_drought function
#'
#' @description 
#' @param weekly_prec rasterstack containing weekly precipitation data
#' @param list the name of a list creatd outside of this function
#' @export
#' @examples
#' avg_stack("C:/Users/Emily/Documents/Fall_2020/Geospatial_R/MODIS_Temp", "2020_01.*\\.tif", SA, "2020_01_mean_temp.tif")
#'
noaa_drought <- function(weekly_prec, list){
  
  while (x < nlayers(weekly_prec)) {
    
    eightweek <- weekly_prec[[ i:(i + 8) ]]
    
    present <- weekly_prec[[(i + 9)]]
    
    mean_eightweek <- calc(eightweek, fun = mean)
    
    noaa <- (present/mean_eightweek)
    plot(noaa)
    
    list[[i]] <- noaa
    
    i = i+1
    x = x+1
  }

}
