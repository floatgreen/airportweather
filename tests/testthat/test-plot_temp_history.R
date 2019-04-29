context("test-plot_temp_history")

test_that("return proper plot ",{
  expect_equal(class(plot_temp_history("KAMW")),c("gg","ggplot"))
})



