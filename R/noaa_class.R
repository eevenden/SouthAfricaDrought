#' noaa_class function
#'
#' @description this function reclassifies a rasterstack produced from the noaa_drought function. It identifies area below 0.60 rainfall which is indicative of water stress
#' @param x rasterstack containing weekly precipitation data
#' @export
#' @examples
#' water_stress(weekly_mean_precip)
#'
water_stress <- function(x){
  
  m <- c(0, 0.6, NA,  0.6, Inf, 1)
  
  rclmat <- matrix(m, ncol=3, byrow=TRUE)
  
  rc <- reclassify(x, rclmat)
  
  return(stack(lapply(1:nlayers(x), function(i){water_stress(x[[i]])})))
} 