
theme_edit <- function() {
  list(
    ggplot2::coord_cartesian(clip = "off"),
    ggplot2::theme_gray(),
    ggplot2::theme(
      panel.grid.major = element_line(colour = "red"),
      panel.grid.minor = element_line(colour = "blue"),
      axis.ticks = element_line(colour = "red"),
      axis.line = element_line(colour = "green"),
      plot.background = element_blank(),
      panel.background = element_blank(),
      plot.margin = margin(1, 1, 1, 1)
      # panel.ontop = TRUE
    )
  )
}
