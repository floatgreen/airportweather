##' @name plot_weather
##' @title Plot Weather Information on Map
##' @description plot an element of an weather informaton of multiple airports on map
##' @usage plot_weather(id_vector, type, label = TRUE, number = TRUE)
##' @param id_vector a vector of multiple airport codes
##' @param type a vector of weather elements
##' @param label lable= TRUE: label airport code on the plot
##' @param number number= TRUE: this element is numeric
##' @examples
##' plot_weather(c("KAMW", "KAIO", "KCID", "KCNC"),
##'            type = "weather",
##'            label = TRUE, number = FALSE)
##' @import ggplot2
##' @export

#dependence? ggmap maps mapdata

#Function3: plot an element
#label = true: label airport code on the plot
#number = true: this element is numeric
#plot one weather elements of several airport
plot_weather <- function(id_vector, type, label = TRUE, number = TRUE){
  data <- current_weather_more(id_vector, type)
  colnames(data)[6]<-"element"
  if (number == TRUE){
    data$element <- as.numeric(as.character(data$element))
  }
  states <- map_data("state")
  if(label == TRUE){
    ggplot(data = states) +
      geom_polygon(aes(x = long, y = lat, group = group),
                   color = "grey", alpha = 0.6) +
      geom_point(data = data,aes(x = longitude, y = latitude,
                                 color = element)) +
      geom_text(data = data,
                aes(x = longitude, y = latitude, label = station_id),
                size = 1.5)+
      theme_bw() +
      labs(title = type,
           subtitle = as.character(data$observation_time[1]))+
      coord_fixed(1.3) +
      guides(fill = FALSE)
  }else{
    ggplot(data = states) +
      geom_polygon(aes(x = long, y = lat, group = group),
                   color = "grey", alpha = 0.6) +
      geom_point(data = data,aes(x = longitude, y = latitude,
                                 color = element)) +
      theme_bw() +
      labs(title = type,
           subtitle = as.character(data$observation_time[1]))+
      coord_fixed(1.3) +
      guides(fill = FALSE)
  }
}




