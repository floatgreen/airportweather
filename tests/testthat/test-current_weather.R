context("test-current_weather")

test_that("current_weather failed to return proper data frame ",{
  expect_equal(dim(current_weather("KAMW")),c(1,6))
  expect_equal(dim(current_weather("KAMW","temp_c")),c(1,6))
  expect_equal(dim(current_weather("KAMW", c("wind_mph", "temp_f"))),c(1,7))
})

