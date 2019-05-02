context("Check measures arguments")

test_that("check the function aux_mean", {
  expect_equal(aux_mean(3, 0.5), 1.5)
  expect_equal(aux_mean(100, 0.2), 20)
  expect_equal(aux_mean(1000, 0.1), 100)
})

test_that("check the function aux_variance", {
  expect_length(aux_variance(10, 0.3), 1)
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(20, 0.5), 5)
})

test_that("check the function aux_mode", {
  expect_length(aux_mode(10, 0.3), 1)
  expect_equal(aux_mode(10, 0.3), 3)
  expect_length(aux_mode(3, 0.5), 2)
})

test_that("check the function aux_skewness", {
  expect_length(aux_skewness(10, 0.3), 1)
  expect_equal(aux_skewness(10, 0.3),  0.2760262, tolerance=1e-7)
  expect_equal(aux_skewness(100, 0.4), 0.04082483)
})

test_that("check the function aux_kurtosis", {
  expect_length(aux_kurtosis(10, 0.3), 1)
  expect_equal(aux_kurtosis(10, 0.3), -0.1238095, tolerance = 1e-7)
  expect_equal(aux_kurtosis(100, 0.4),  -0.01833333)
})
