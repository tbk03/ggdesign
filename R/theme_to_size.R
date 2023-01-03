
#' Style a ggplot chart to make it easier to edit in vector design software
#'
#' @param width
#' @param height
#' @param units
#'
#' @return an object with classes gg and theme which applies styling to a ggplot
#' object
#' @export
#'
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
#' ggplot2::geom_point() +
#' theme_to_size()
#'

theme_to_size <- function(width = 90, height = 60, units = "mm") {

  # error handling

  # convert inches to mm

  # convert px to mm

  # calculate area
  area <- width * height
  sqrt_area <- sqrt(area)

  # set scale from area to font size

  sqrt_max_area <- sqrt(1000 * 1000) # 1m by 1m = 1m2
  domain <- c(0, sqrt_max_area)
  range <- c(0,62)

  font_size <- scales::rescale(sqrt_area, from = domain, to = range)
  print(font_size)
  #browser()

  # set scale from area to heaviest line weight

  # estimate font size

  # estimate line weights

  # ---------------------------------------------------------------------------
  # apply element sizing
  # ---------------------------------------------------------------------------
  list(

    # start with default ggplot2 theme
    # because it produces fewer svg artifacts than other themes
    ggplot2::theme_gray(base_size = font_size)#,

    # # overwrite parameters in default theme
    # ggplot2::theme(
    #
    #   # distinct styling for major and minor gridlines
    #   panel.grid.major = ggplot2::element_line(colour = colours[1]),
    #   panel.grid.minor = ggplot2::element_line(colour = colours[2]),
    #
    #   # match styling of axis ticks to styling of major gridlines
    #   axis.ticks = ggplot2::element_line(colour = colours[1]),
    #
    #   # distinct styling for axis lines
    #   axis.line = ggplot2::element_line(colour = colours[3]),
    #
    #   # remove unnecessary plot elements
    #   # (backgrounds better dealt with in vector editting software)
    #   plot.background = ggplot2::element_blank(),
    #   panel.background = ggplot2::element_blank()
    # )
  )
}
