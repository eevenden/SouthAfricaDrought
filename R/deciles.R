#' deciles function
#'
#' @description a function which calculates the deciles for each layer of a raster stack and returns the results as a dataframe
#' @param input rasterstack containing long-term precipitation data
#' @export
#' @examples
#' deciles(lt_prec)
#'
deciles <- function(input){
  
  output <- quantile(input, c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1), na.rm=TRUE) %>% as.data.frame()
  
  return(output)
  
}