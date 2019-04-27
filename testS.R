library(shiny)

data(package = "airportweather", "all_code")
codes <- all_code$Code

ui <- fluidPage(

  titlePanel("Plot Temperature History"),

  sidebarPanel(
    selectInput("code", "airport code", choices = codes  )
  ),

  mainPanel(

            plotOutput("plot_temp"),
            dataTableOutput("table")
  )
)


server <- function(input, output) {
  output$plot_temp <- renderPlot({
    plot_temp_history(input$code)
  })
  output$table <- renderDataTable( obhistory(input$code))
}


shinyApp(ui, server)

