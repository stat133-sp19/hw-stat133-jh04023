context("Check binomial functions")

test_that("check the function bin_choose", {
  expect_length(bin_choose(5, 2), 1)
  expect_equal(bin_choose(5, 2), 10)
  expect_error(bin_choose(5, 7))
})

test_that("check the function bin_probability", {
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_length(bin_probability(0:2, 5, 0.5), 3)
  expect_error(bin_probability(0:6, 5, 0.5))
})

test_that("check the function bin_distribution", {
  expect_equal(nrow(bin_distribution(5, 0.5)), 6)
  expect_equal(ncol(bin_distribution(5, 0.5)), 2)
  expect_error(bin_distribution(5, 1.5))
})

test_that("check the function bin_cumulative", {
  expect_equal(nrow(bin_cumulative(5, 0.5)), 6)
  expect_equal(ncol(bin_cumulative(5, 0.5)), 3)
  expect_equal(bin_cumulative(5,0.5)$cumulative[6], 1)
})
