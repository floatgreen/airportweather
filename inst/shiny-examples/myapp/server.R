server <- function(input, output) {
  output$plot_map <- renderPlot({
    ggplot(data = map_data("state")) +
      geom_polygon(aes(x = long, y = lat, group = group),
                   color = "grey", alpha = 0.6) +
      geom_point(data = current_weather_more(input$code, type = NULL),aes(x = longitude, y = latitude),color="red") +
      geom_text(data = current_weather_more(input$code, type = NULL),
                aes(x = longitude, y = latitude, label = station_id),
                vjust=-1,
                size = 3)+
      theme_bw()
  })
  output$click_info <- renderTable({
    data <- current_weather_more(input$code,input$feature)
    subset(data,latitude >= input$plot_click$y-0.5 & latitude <= input$plot_click$y+0.5 &
             longitude >= input$plot_click$x-0.5 & longitude <= input$plot_click$x+0.5)
  })
}
