context("test-plot_position")

test_that("plot_position failed to return proper plot ",{
  expect_equal(class(plot_position(c("KAMW", "KAIO", "KCID", "KCNC"), "temp_f",-100,30)),c("gg","ggplot"))
})
