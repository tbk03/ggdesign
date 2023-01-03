# ------------------------------------------------------------------------------
# Tests for theme_to_size()
# ------------------------------------------------------------------------------

path_for_man_inspect <- "man_insp/theme_to_size"

# test function
theme_to_size_test_scatter <- function(width, height, units) {
  # create a basic plot
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
    ggplot2::geom_point() +
    theme_to_size(width = width, height = height, units = units)

  # check class of object once theme_edit() has been applied
  expect_s3_class(p, "ggplot")

  # output for manual inspection in vector design software
  ggplot2::ggsave(glue::glue("{path_for_man_inspect}/theme_to_size_scatter_{width}_{height}_{units}.svg"),
    p,
    width = width, height = height, units = units
  )
}

# ------------------------------------------------------------------------------
# Large plots
# ------------------------------------------------------------------------------

test_that("theme_to_size() works for a large scatterplot, units mm", {
  theme_to_size_test_scatter(width = 500, height = 500, units = "mm")
})

test_that("theme_to_size() works for a large scatterplot, units cm", {
  theme_to_size_test_scatter(width = 100, height = 100, units = "cm")
})

test_that("theme_to_size() works for a large scatterplot, units in", {
  theme_to_size_test_scatter(width = 36, height = 36, units = "in")
})

test_that("theme_to_size() works for a large scatterplot, units px", {
  theme_to_size_test_scatter(width = 2000, height = 2000, units = "px")
})

# ------------------------------------------------------------------------------
# Small plots
# ------------------------------------------------------------------------------

test_that("theme_to_size() works for a small scatterplot, units mm", {
  theme_to_size_test_scatter(width = 50, height = 50, units = "mm")
})

test_that("theme_to_size() works for a large scatterplot, units cm", {
  theme_to_size_test_scatter(width = 3, height = 2, units = "cm")
})

test_that("theme_to_size() works for a small scatterplot, units in", {
  theme_to_size_test_scatter(width = 3, height = 3, units = "in")
})

# ------------------------------------------------------------------------------
# Error
# ------------------------------------------------------------------------------
test_that("theme_to_size() errors with wrong units", {
  expect_error(theme_to_size(units = "incorrect_string"))
})

test_that("theme_to_size() errors with wrong units", {
  expect_error(theme_to_size(units = 1))
})

test_that("theme_to_size() errors with invalid width", {
  expect_error(theme_to_size(width = -1))
})

test_that("theme_to_size() errors with invalid height", {
  expect_error(theme_to_size(width = "invalid_arg"))
})
