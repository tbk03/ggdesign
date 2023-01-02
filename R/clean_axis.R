
#' Cleans up the axis on a ggplot2 chart (ahead of export for editing in vector
#' design software)
#'
#' @param coord_system the ggplot2 coordinate system used in the chart (e.g.
#' ggplot2::coord_equal)
#'
#' @return an object to be added to chart using the ' '+' operator.
#' The object has the following classes: CoordCartesian, Coord, ggproto and gg.
#' @export
#'
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
#' ggplot2::geom_point() +
#' clean_axis()
#'
clean_axis <- function(coord_system = ggplot2::coord_cartesian) {
  # ----------------------------------------------------------------------------
  # error handling
  # ----------------------------------------------------------------------------

  # check coord_system is a function
  if (!methods::is(coord_system, "function")) {
    rlang::abort("a ggplot2 coordinate function is expected
                 e.g. coord_cartesian")
  }

  # check coord_system is the right kind of function
  # by looking at what it returns
  coord_system_return <- coord_system()

  if (!methods::is(coord_system_return, "Coord")) {
    rlang::abort("a ggplot2 coordinate function is expected
                 e.g. coord_cartesian")
  }

  # ----------------------------------------------------------------------------
  # logic: remove axis expansion and clipping mask to clean up axis
  # ----------------------------------------------------------------------------

  coord_system(expand = FALSE, clip = "off")
}
