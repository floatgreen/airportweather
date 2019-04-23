context("test-plot_position")
test_that("plot_position failed to return proper ggplot elements", {
  p<-plot_position(c("KAMW", "KAIO"),type = "temp_f", you.long = -100, you.lat = 35,number = TRUE)
  vdiffr::expect_doppelganger("plot with known output", p)
})

