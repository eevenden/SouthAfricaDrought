#' noaa_drought function
#'
#' @description 
#' @param weekly_prec rasterstack containing weekly precipitation data
#' @param list the name of a list created outside of this function
#' @export
#' @examples
#' noaa_drought(weekly_mean_precip, new_list)
#'
noaa_drought <- function(weekly_prec, list){
  
  x = 0
  
  i= 1
  
  while (x < (nlayers(weekly_prec) - 8)) {
    
    eightweek <- weekly_prec[[ i:(i + 7) ]]
    
    present <- weekly_prec[[(i + 8)]]
    
    mean_eightweek <- calc(eightweek, fun = mean)
    
    noaa <- (present / mean_eightweek)
    
    list[[i]] <- noaa
    
    i = i + 1
    x = x + 1
  }
  
  return(list)
}
