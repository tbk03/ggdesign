# ------------------------------------------------------------------------------
# Tests for theme_edit()
# ------------------------------------------------------------------------------

test_that("theme_edit() works for a simple scatterplot", {

  # create a basic plot to apply theme_edit() to
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
    ggplot2::geom_point() +
    theme_edit()

  # check class of object once theme_edit() has been applied
  expect_s3_class(p, "ggplot")

  # output for manual inspection in vector design software
  ggplot2::ggsave("plots_for_manual_inspection/theme_edit_scatter.svg", p)

})

test_that("theme_edit() works for a simple histogram", {

  # create a basic plot to apply theme_edit() to
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg)) +
    ggplot2::geom_histogram() +
    theme_edit()

  # check class of object once theme_edit() has been applied
  expect_s3_class(p, "ggplot")

  # output for manual inspection in vector design software
  ggplot2::ggsave("plots_for_manual_inspection/theme_edit_hist.svg", p)

})
