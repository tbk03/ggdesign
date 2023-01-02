# ------------------------------------------------------------------------------
# Functional tests for get_colours()
# ------------------------------------------------------------------------------

test_that("get_colours returns expected number of colours", {
  expect_equal(length(get_colours(2)), 2)
})

test_that("get_colours returns expected number of colours", {
  expect_equal(length(get_colours(3)), 3)
})

# ------------------------------------------------------------------------------
# Error handling tests for get_colours()
# ------------------------------------------------------------------------------

test_that("get_colours issues warnings", {
  expect_warning(get_colours(5))
})

test_that("get_colours issues warnings", {
  expect_warning(get_colours(5))
})

test_that("get_colours issues errors", {
  expect_error(get_colours("a string"))
})

test_that("get_colours issues errors", {
  expect_error(get_colours(-1))
})
