test_that("only one line of svg is removed by clean_svg", {

  svg_name <- "test.svg"

  # create plot
  ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
    ggplot2::geom_point() #+
    #ggplot2::theme_bw()

  # save plot as svg
  ggplot2::ggsave(svg_name)

  # read original svg back in
  svg_in <- readLines(svg_name)
  svg_in_length <- length(svg_in)

  # edit svg file using clean_svg
  clean_svg(svg_name)

  # read editted svg back in
  svg_out <- readLines(svg_name)
  svg_out_length <- length(svg_out)

  expect_equal(svg_in_length, svg_out_length + 1)
})
