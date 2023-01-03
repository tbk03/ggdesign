# ------------------------------------------------------------------------------
# Tests for theme_edit()
# ------------------------------------------------------------------------------

test_that("theme_edit() works for a simple scatterplot", {

  # create a basic plot to apply theme_edit() to
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
    ggplot2::geom_point() +
    theme_to_size(width = 500, height = 500, units = "mm")

  # check class of object once theme_edit() has been applied
  expect_s3_class(p, "ggplot")

  # output for manual inspection in vector design software
  ggplot2::ggsave("plots_for_manual_inspection/theme_to_size_scatter.svg",
                  p,
                  width = 500, height = 500, units = "mm")

})

test_that("theme_edit() works for a simple histogram", {

  # create a basic plot to apply theme_edit() to
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg)) +
    ggplot2::geom_histogram() +
    theme_to_size(width = 90, height = 60, units = "mm")

  # check class of object once theme_edit() has been applied
  expect_s3_class(p, "ggplot")

  # output for manual inspection in vector design software
  ggplot2::ggsave("plots_for_manual_inspection/theme_to_size_hist.svg",
                  p,
                  width = 90, height = 60, units = "mm")

})

test_that("theme_edit() works for a simple histogram", {

  # create a basic plot to apply theme_edit() to
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg)) +
    ggplot2::geom_histogram() +
    theme_to_size(width = 1000, height = 1000, units = "mm")

  # check class of object once theme_edit() has been applied
  expect_s3_class(p, "ggplot")

  # output for manual inspection in vector design software
  ggplot2::ggsave("plots_for_manual_inspection/theme_to_size_hist_large.svg",
                  p,
                  width = 1000, height = 1000, units = "mm")

})
