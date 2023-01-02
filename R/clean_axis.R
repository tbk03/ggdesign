
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
