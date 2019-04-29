##' @name current_weather
##' @title Read the Data of One Airport Location
##' @description This function read the the weather information of a airport from the website of NOAA's National Weather Service.
##' @usage current_weather(id,type)
##' @param id one 4 digits code of the airport
##' @param type a vector of weather elements
# what types can we choose from?
##' @return a data frame of the weather information
##' @examples
##' current_weather("KAMW", c("wind_mph", "temp_f", "haha"))
##' current_weather("KAMW", "temp_c")
##' @import xml2
##' @importFrom  assertthat assert_that
##' @import testthat
##' @export

#Function1:read the data of one location
#id is one code of airport，type is a vector of weather elements.
#this function can read several weather elements of one location.
current_weather <- function(id=NULL, type=NULL){
  assertthat::assert_that(is.character(id) ,msg = "id is not a character")
  assertthat::assert_that(length(id)==1,
                          msg = "id is not an airport ID, if you want to get weather information from more than one airport, please use current_weather_more")
  assertthat::assert_that(stringr::str_length(id) == 4,msg = "id is not an airport ID")
  url <- paste("https://w1.weather.gov/xml/current_obs/", id, ".xml", sep = "")
  assertthat::assert_that(!(httr::http_error(httr::GET(url))),
                          msg = "url is not valid, maybe not a correct ID")
  a <- xml2::read_xml(url)
  b <- xml2::xml_children(a)
  name <- xml2::xml_name(b)
  text <- xml2::xml_text(b)
  location <- NA
  station_id <- NA
  latitude <- NA
  longitude <- NA
  n <- length(name)
  m <- length(type)
  observation_time <- NA
  data <- rep(NA, m)
  mark <- rep(0, m)
  if (m==0){
    for (i in 1:n){
      if(name[i] == "location")
        location <- text[i]
      else if(name[i] == "station_id")
        station_id <- id
      else if(name[i] == "latitude")
        latitude <- as.numeric(text[i])
      else if(name[i] == "longitude")
        longitude  <- as.numeric(text[i])
      else if(name[i] == "observation_time")
        observation_time <- text[i]
      else if(name[i] == "weather"){
        weather <- text[i]
        mark <- 1
      }

    }
    obs <- data.frame(location, station_id, latitude, longitude, observation_time,
                      weather)
  }
  if (m == 1){
    for (i in 1:n){
      if(name[i] == "location")
        location <- text[i]
      else if(name[i] == "station_id")
        station_id <- id
      else if(name[i] == "latitude")
        latitude <- as.numeric(text[i])
      else if(name[i] == "longitude")
        longitude  <- as.numeric(text[i])
      else if(name[i] == "observation_time")
        observation_time <- text[i]
      else if(name[i] == type){
        data <- text[i]
        mark <- 1
      }

    }
    obs <- data.frame(location, station_id, latitude, longitude, observation_time,
                      data)
    colnames(obs)[6] <- type
  }
  if (m > 1){
    for (i in 1:n){
      if(name[i] == "location")
        location <- text[i]
      else if(name[i] == "station_id")
        station_id <- id
      else if(name[i] == "latitude")
        latitude <- as.numeric(text[i])
      else if(name[i] == "longitude")
        longitude  <- as.numeric(text[i])
      else if(name[i] == "observation_time")
        observation_time <- text[i]
      else {
        for (k in 1:m){
          if(name[i] == type[k]){
            data[k] <- text[i]
            mark[k] <- 1
          }
        }
      }
    }
    obs <- data.frame(location, station_id, latitude, longitude, observation_time)
    for (i in 1:m)
      obs <- cbind(obs, data[i])
    names(obs)[6:(6+m-1)] <- type
  }
  if(sum(mark) < m)
    message("Some of your types are not found! They are shown as NA!")
  assertthat::assert_that(is.data.frame(obs))
  return(obs)
}


