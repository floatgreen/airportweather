context("test-plot_weather")

test_that("plot_weather failed to return proper plot ",{
  expect_equal(class(plot_weather(c("KAMW", "KAIO", "KCID", "KCNC"), "temp_f")),c("gg","ggplot"))
  expect_equal(class(plot_weather(c("KAMW", "KAIO", "KCID", "KCNC"), "temp_f", label = FALSE)),c("gg","ggplot"))
})

