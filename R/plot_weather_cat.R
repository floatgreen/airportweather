##' @name plot_weather_cat
##' @title Plot Weather Information on Map
##' @description plot a categorical element of an weather informaton of multiple airports on map
##' @usage plot_weather_cat(id_vector, type, label = TRUE)
##' @param id_vector a vector of multiple airport codes
##' @param type a character of one categorical weather element
##' @param label lable= TRUE: label airport code on the plot
##' @examples
##' plot_weather_cat(c("KAMW", "KAIO", "KCID", "KCNC"),
##'            type = "weather",
##'            label = TRUE)
##' @import ggplot2
##' @export

#dependence? ggmap maps mapdata

#Function3: plot a categorical element
#label = true: label airport code on the plot
#plot one weather elements of several airport
plot_weather_cat <- function(id_vector, type, label = TRUE){
  data <- current_weather_more(id_vector, type)
  colnames(data)[6]<-"element"
  data$element <- as.factor(data$element)
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




