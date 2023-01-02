# ------------------------------------------------------------------------------
# Tests which require some manual checks for clean_axis()
# ------------------------------------------------------------------------------

test_that("clean_axis() works with default arguments", {
  # create a basic plot to apply clean_axis() to
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
    ggplot2::geom_point() +
    clean_axis()

  # check class of object once clean_axis() has been applied
  expect_s3_class(p, "ggplot")

  # output for manual inspection in vector design software
  ggplot2::ggsave("plots_for_manual_inspection/clean_axis_1_scatter.svg", p)
})

test_that("clean_axis() works with a passed coord_system argument", {
  # create a basic plot to apply clean_axis() to
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
    ggplot2::geom_point() +
    clean_axis(coord_system = ggplot2::coord_equal)

  # check class of object once clean_axis() has been applied
  expect_s3_class(p, "ggplot")

  # output for manual inspection in vector design software
  ggplot2::ggsave("plots_for_manual_inspection/clean_axis_2_scatter.svg", p)
})

# ------------------------------------------------------------------------------
# Error handling tests for clean_axis()
# ------------------------------------------------------------------------------

test_that("clean_axis() issues errors when something other than a function is
          passed", {
  expect_error(clean_axis("a string"))
})

test_that("clean_axis() issues errors when the wrong kind of function is
          passed", {
  expect_error(clean_axis(ggplot2::theme_bw))
})
