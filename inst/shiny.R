library(shiny)

ui <- fluidPage(
  tags$style(type="text/css",
             ".shiny-output-error { visibility: hidden; }",
             ".shiny-output-error:before { visibility: hidden; }"
  ),
  fluidRow(
    column(width = 5, wellPanel(
      selectizeInput(inputId = "code", label = "Choose the airport code",
                     ###Read airpor code data from your computer
                     ###Will change the path in the package
                     choices=read.table("data/airportCode")[,2],
                     selected=NULL,
                     multiple=T)
    )),
    column(width = 5, wellPanel(
      checkboxGroupInput(inputId = "feature", label = "Choose the weather feature",
                         choices=c("weather","temp_f","wind_mph","wind_dir","relative_humidity","pressure_in","visibility_mi","dewpoint_f"),
                         selected=NULL)
    ))
  ),

  plotOutput("plot_map", height = 800, click = clickOpts(id = "plot_click")),
  tableOutput("click_info")

)


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

shinyApp(ui = ui, server = server)
