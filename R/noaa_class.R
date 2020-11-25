#' noaa_class function
#'
#' @description this function reclassifies a rasterstack produced from the noaa_drought function. It identifies area below 0.60 rainfall which is indicative of water stress
#' @param x rasterstack containing weekly precipitation data
#' @export
#' @examples
#' noaa_class(weekly_mean_precip)
#'
noaa_class <- function(x){
  
  m <- c(0, 0.6, 1,  0.6, Inf, NA)
  
  rclmat <- matrix(m, ncol=3, byrow=TRUE)
  
  rc <- reclassify(x, rclmat)
  
} 