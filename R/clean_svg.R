#-------------------------------------------------------------------------------
# MAY RETURN TO THIS FUNCTION IN THE FUTURE
#-------------------------------------------------------------------------------

#' Cleans an svg file (created by ggsave) for use in vector design software
#'
#' @param file_path the location of the svg file to be cleaned
#'
#' @return nothing - executed for side effects (edits on an svg file)
#' @export
#'
#' @examples
#'
#' svg_name <- "test.svg" # define file name
#'
#' # create plot
#' ggplot(mtcars, aes(mpg, wt)) +
#' geom_point()
#'
#'# save plot as svg file
#' ggsave(svg_name)
#' # clean up the svg file
#' clean_svg(svg_name)
#'

# clean_svg <- function(file_path) {
#   # read in svg as text
#   svg_text <- readLines(file_path)
#
#   # identify an unnecessary, black rectangle that obscures the plot
#   selector <- stringr::str_detect(svg_text, "^<rect") &
#     !stringr::str_detect(svg_text, "fill")
#
#   # write out the svg without the unnecessary, black rectangle
#   writeLines(
#     svg_text[!selector],
#     stringr::str_c("out_", file_path)
#   )
# }
