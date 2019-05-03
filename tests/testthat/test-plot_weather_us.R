context("test-plot_weather_us")

test_that("plot_weather_us failed to return proper plot ",{
  expect_equal(class(plot_weather_us("temp_f", 0.5)),c("gg","ggplot"))
})
