##' @name current_weather_more
##' @title Read the Data of Multiple Airport Location
##' @description This function read the the weather information of Multiple airport from the website of NOAA's National Weather Service.
##' @usage current_weather_more(id_vector, type)
##' @param id_vector a vector of  multiple airport codes
##' @param type a vector of weather elements
##' @return a data frame of the weather information
##' @examples
##' current_weather_more(c("KAMW", "KAIO", "KCID", "KCNC"), c("temp_f"))
##' @import xml2 assertthat

#Function2:read the data of several different locations
#id is a vector of the codes of airports，type is a vector of weather elements.
#this function can read several weather elements of several locations.
current_weather_more <- function(id_vector, type){
  n <- length(id_vector)
  obs <- NULL
  for (i in 1:n){
    obs <- rbind(obs, current_weather(id_vector[i], type))
  }
  assertthat::assert_that(is.data.frame(obs))
  obs
}
