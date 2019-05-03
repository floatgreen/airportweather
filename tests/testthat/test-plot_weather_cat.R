context("test-plot_weather_cat")

test_that("plot_weather_cat failed to return proper plot ",{
  expect_equal(class(plot_weather_cat(c("KAMW", "KAIO", "KCID", "KCNC"), "weather")),c("gg","ggplot"))
  expect_equal(class(plot_weather_cat(c("KAMW", "KAIO", "KCID", "KCNC"), "weather", label = FALSE)),c("gg","ggplot"))
})
