##' @name plot_position
##' @title Plot an Element of Selected Airports and Your location
##' @description This function plot an element of selected airport and your position.
##' @usage plot_position(id_vector, type, you.long, you.lat, number = T)
##' @param id_vector a vector of  multiple airport codes
##' @param type a vector of weather elements
##' @param you.long The longitude of your location
##' @param you.lat The latitude of your location
##' @details number = true: this element is numeric
##' @examples
##' plot_position(c("KAMW", "KAIO"),
##' type = "temp_f", you.long = -100, you.lat = 35,
##' number = T)
##' @import ggplot2
##' @export
##'
##'
plot_position <- function(id_vector, type, you.long, you.lat, number = T){
  data <- current_weather_more(id_vector, type)
  data <- na.omit(data)
  colnames(data)[6]<-"element"
  if (number == T){
    data$element <- as.numeric(as.character(data$element))
  }
  states <- map_data("state")
  ggplot(data = states) +
    geom_polygon(aes(x = long, y = lat, group = group),
                 color = "grey", alpha = 0.6) +
    geom_point(data = data,aes(x = longitude, y = latitude,
                               color = element)) +
    geom_point(aes(x= you.long, y=you.lat), colour="red") +
    geom_text(data = data,
              aes(x = longitude, y = latitude, label = station_id),
              size = 1.5)+
    geom_text(aes(x = you.long - 0.5, y = you.lat - 0.5, label = "You"),
              size = 2) +
    theme_bw() +
    labs(title = type,
         subtitle = as.character(data$observation_time[1]))+
    coord_fixed(1.3) +
    guides(fill = FALSE)
}


