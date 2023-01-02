# define colour palette
colours <- c(blue2 = "#374E83",
             orange2 = "#D97A53",
             green2 = "#73BC9B")

#' Get the first n colours in the ggdesign palette
#'
#' @param n number of colours requested from the palette
#'
#' @return a vector of colours (as hexcodes)
#' @export
#'
#' @examples
#' get_colours(2)
#'
get_colours <- function(n = length(colours)) {

  # ----------------------------------------------------------------------------
  # error handling
  # ----------------------------------------------------------------------------

  # check argument is correct type
  if(!is.numeric(n)){

    rlang::abort("n is expected to be a positive integer")
  }

  if(n != round(n) | n < 0){
    rlang::abort("n is expected to be a positive integer")
  }

  # check there are at least n colours
  if (n > length(colours)) {

    warning(glue::glue("{n} colour requested, but only {length(colours)} colours
                     available in the ggdesign palette"))

    # return the maximum number of colours available
    n <- length(colours)
  }

  # ----------------------------------------------------------------------------
  # logic: return n (or maximum number available) colours
  # ----------------------------------------------------------------------------

  return(colours[1:n])
}
