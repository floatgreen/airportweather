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
                     choices=read.table(system.file("exdata", "airportCode", package = "airportweather"))[,2],
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
