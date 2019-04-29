context("test-current_weather_input")

test_that("current_weather error warning failed", {
  expect_error(current_weather(2333,"temp_c"), "id is not a character")
  expect_error(current_weather("23333","temp_c"),"id is not an airport ID")
  expect_error(current_weather("AAAA","temp_c"),"url is not valid, maybe not a correct ID")
  expect_error(current_weather(c("KAMW","KAIO"),"temp_c"),"id is not an airport ID, if you want to get weather information from more than one airport, please use current_weather_more")
  expect_message(current_weather("KAMW","haha"),"Some of your types are not found! They are shown as NA!")
})
