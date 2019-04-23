context("test-plot_position")

test_that("plot_position error warning failed", {
  expect_error(plot_position("KAMWT","temp_f",-100,30))
  expect_message(plot_position("KAMW",c("temp_f","haha"),-100,30),"Some of your types are not found! They are shown as NA!")
})

test_that("plot_position failed to return proper plot ",{
  expect_equal(class(plot_position(c("KAMW", "KAIO", "KCID", "KCNC"), "temp_f",-100,30)),c("gg","ggplot"))
})
