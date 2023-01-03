
#' Resizes chart structure (lines width and text size) based on the size of the
#' chart
#'
#' @param width Width of plot to be exported
#' @param height Height of plot to be exported
#' @param units Units for height and width ("in", "cm", "mm", or "px").
#'
#' @return an object with classes gg and theme which applies theme styling to a
#' ggplot object
#' @export
#'
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
#'   ggplot2::geom_point() +
#'   theme_to_size(width = 90, height = 60, units = "mm")
#'
theme_to_size <- function(width = 90, height = 60, units = "mm") {
  # maximum width or height of plot in mm
  # needed to scale between width/height and text size
  max_dim <- 1000

  # ----------------------------------------------------------------------------
  # error handling
  # ----------------------------------------------------------------------------
  assertthat::assert_that(is.numeric(width) & is.numeric(height),
    msg = "in theme_to_size - `height` and `width` are expected to be numbers"
  )
  assertthat::assert_that(units %in% c("in", "cm", "mm", "px"),
    msg = "in theme_to_size - `units` is expected to be one of in, cm, mm, or px"
  )


  # ----------------------------------------------------------------------------
  # convert units for height and width
  # ----------------------------------------------------------------------------
  # convert cm to mm
  if (units == "cm") {
    height <- height * 10
    width <- width * 10
  }

  # convert inches to mm
  if (units == "in") {
    height <- height * 25.4
    width <- width * 25.4
  }

  # convert px to mm (assume 96 dpi for calculation)
  if (units == "px") {
    height <- height * 25.4 / 96
    width <- width * 25.4 / 96
  }

  # ----------------------------------------------------------------------------
  # more error handling after unit conversion
  # ----------------------------------------------------------------------------
  assertthat::assert_that(width >= 0 & height >= 0,
    msg = "in theme_to_size - `height` and `width` are expected to be positive numbers"
  )
  assertthat::assert_that(width <= max_dim & height <= max_dim,
    msg = glue::glue("in theme_to_size - `height` and `width` are expected to be less than {max_dim} mm")
  )

  # ----------------------------------------------------------------------------
  # function logic - scale from chart area to a text size
  # ----------------------------------------------------------------------------

  # calculate area of chart
  area <- width * height
  sqrt_area <- sqrt(area)

  # create scale from area to font size
  sqrt_max_area <- sqrt(max_dim * max_dim) # 1m by 1m = 1m2
  domain <- c(0, sqrt_max_area)
  range <- c(0, 62)

  # the weight of chart structure lines is calculated within theme() based
  # on tge font size used
  font_size <- scales::rescale(sqrt_area, from = domain, to = range)


  # ---------------------------------------------------------------------------
  # apply element sizing and return
  # ---------------------------------------------------------------------------
  list(

    # start with default ggplot2 theme
    # because it produces fewer svg artifacts than other themes
    ggplot2::theme_gray(base_size = font_size),

    # overwrite parameters in default theme
    ggplot2::theme(

      # distinct styling for major and minor gridlines
      panel.grid.major = ggplot2::element_line(colour = "#7A7174"),
      panel.grid.minor = ggplot2::element_line(colour = "#A7A0A2"),

      # match styling of axis ticks to styling of major gridlines
      axis.ticks = ggplot2::element_line(colour = "#7A7174"),

      # distinct styling for axis lines
      axis.line = ggplot2::element_line(colour = "#2C3130"),

      # remove unnecessary plot elements
      # (backgrounds better dealt with in vector editting software)
      plot.background = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank()
    )
  )
}
