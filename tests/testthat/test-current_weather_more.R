context("test-current_weather_more")

test_that("current_weather_more failed to return list with proper dimension", {
  expect_equal(dim(current_weather_more("KAMW", "temp_f")), c(1,6))
  expect_equal(dim(current_weather_more(c("KAMW", "KAIO", "KCID", "KCNC"), c("temp_f"))), c(4,6))
})
