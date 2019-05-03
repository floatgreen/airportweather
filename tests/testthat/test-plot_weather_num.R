context("test-plot_weather_num")

test_that("plot_weather_num failed to return proper plot ",{
  expect_equal(class(plot_weather_num(c("KAMW", "KAIO", "KCID", "KCNC"), "temp_f")),c("gg","ggplot"))
  expect_equal(class(plot_weather_num(c("KAMW", "KAIO", "KCID", "KCNC"), "temp_f", label = FALSE)),c("gg","ggplot"))
})

