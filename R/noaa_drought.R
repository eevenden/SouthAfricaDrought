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
  
  while (x < (nlayers(weekly_prec)+1)) {
    
    eightweek <- weekly_prec[[ i:(i + 8) ]]
    
    present <- weekly_prec[[(i + 9)]]
    
    mean_eightweek <- calc(eightweek, fun = mean)
    
    noaa <- (present / mean_eightweek)
    plot(noaa)
    
    list[[i]] <- noaa
    
    i = i + 1
    x = x + 1
  }
  return(list)

}
