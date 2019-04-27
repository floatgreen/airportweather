server <- function(input, output) {
  d1<-reactive ({
    df<-current_weather_more(id_vector=input$code,type=input$feature) %>%
      mutate_if(is.factor,as.character) %>%
      unite("info",-c("location","latitude","longitude","observation_time"),sep = "<br/>",remove = FALSE)
    df
  })

  output$map <- leaflet::renderLeaflet({
    leaflet::leaflet(data = d1()) %>%
      leaflet::addTiles() %>%
      leaflet::addPopups(~ longitude, ~ latitude, ~info) %>%
      leaflet::addMarkers(~ longitude, ~ latitude, popup = ~info, label = ~location)
  })

  output$weather_info <- renderTable({
    d1()[,-2]
  })

  output$text <- renderText({
    if(length(input$code) == 1) return(NULL)
    return("Please only select one airport to get history information in this tab!")
  })

  output$plot_temp <- renderPlot({
    plot_temp_history(input$code)
  })

  output$history_info <- renderDataTable( obhistory(input$code))
}
