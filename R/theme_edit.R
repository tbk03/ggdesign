
#' Style a ggplot chart to make it easier to edit in vector design software
#'
#' @return an object with classes gg and theme which applies styling to a ggplot
#' object
#' @export
#'
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
#' ggplot2::geom_point() +
#' theme_edit()
#'

theme_edit <- function() {

  # get ggdesign colours for use in this theme
  colours <- ggdesign::get_colours()

  # ---------------------------------------------------------------------------
  # return multiple ggplot2 functions so they can executed in sequence
  # ---------------------------------------------------------------------------
  list(

    # start with default ggplot2 theme
    # because it produces fewer svg artifacts than other themes
    ggplot2::theme_gray(),

    # overwrite parameters in default theme
    ggplot2::theme(

      # distinct styling for major and minor gridlines
      panel.grid.major = ggplot2::element_line(colour = colours[1]),
      panel.grid.minor = ggplot2::element_line(colour = colours[2]),

      # match styling of axis ticks to styling of major gridlines
      axis.ticks = ggplot2::element_line(colour = colours[1]),

      # distinct styling for axis lines
      axis.line = ggplot2::element_line(colour = colours[3]),

      # remove unnecessary plot elements
      # (backgrounds better dealt with in vector editting software)
      plot.background = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank()
    )
  )
}
