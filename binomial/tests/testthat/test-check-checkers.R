context("Check checkers arguments")

test_that("check the function check_prob", {
  expect_true(check_prob(0.4))
  expect_error(check_prob(1.2))
  expect_error(check_prob(-1.2))
  expect_length(check_prob(0.2),1)
})

test_that("check the function check_trials", {
  expect_true(check_trials(100))
  expect_error(check_trials(-111))
  expect_error(check_trials(3.45))
  expect_length(check_trials(200), 1)
})

test_that("check the function check_success", {
  expect_true(check_success(200, 400))
  expect_true(check_success(c(1,2,3),5))
  expect_error(check_success(c(6,3,2),4))
  expect_error(check_success(-100, 200))
  expect_error(check_success(-100, -200))
})

