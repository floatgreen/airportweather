context("test-obhistory")

test_that("return proper dataframe", {
  expect_equal(ncol(obhistory("KORD")),9)
})
