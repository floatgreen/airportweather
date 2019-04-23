context("test-plot_weather")

test_that("plot_weather error warning failed", {
  expect_error(plot_weather("KAMWT","temp_f"))
  expect_message(plot_weather("KAMW",c("temp_f","haha")),"Some of your types are not found! They are shown as NA!")
})

test_that("plot_weather failed to return proper plot ",{
  expect_equal(class(plot_weather(c("KAMW", "KAIO", "KCID", "KCNC"), "temp_f")),c("gg","ggplot"))
})
