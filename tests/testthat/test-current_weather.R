context("test-current_weather")

test_that("current_weather error warning failed", {
  expect_error(current_weather(2333,"tomato"), "id is not a character")
  expect_error(current_weather("23333","tomato"),"id is not an airport ID")
  expect_error(current_weather(c("abcd","edfg"),"tomato"),"id is not an airport ID, if you want to get weather information from more than one airport, please use current_weather_more")
  expect_message(current_weather("KAMW","haha"),"Some of your types are not found! They are shown as NA!")
})

test_that("current_weather failed to return proper data frame ",{
  expect_equal(dim(current_weather("KAMW","temp_c")),c(1,6))
  expect_equal(colnames(current_weather("KAMW")),c("location","station_id","latitude","longitude","observation_time","weather"))
  expect_equal(colnames(current_weather("KAMW","temp_c")),c("location","station_id","latitude","longitude","observation_time","temp_c"))
  expect_equal(colnames(current_weather("KAMW", c("wind_mph", "temp_f"))),c("location","station_id","latitude","longitude","observation_time","wind_mph", "temp_f"))
})

