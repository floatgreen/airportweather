data(package = "airportweather", "all_code")
Code <- tidyr::unite(all_code,"Info",c("State","Code","Name"),sep = " | ", remove = F)
ui <- fluidPage(
  tags$style(type="text/css",
             ".shiny-output-error { visibility: hidden; }",
             ".shiny-output-error:before { visibility: hidden; }"
  ),
  fluidRow(
    column(width = 5, wellPanel(
      selectizeInput(inputId = "code", label = "Choose the airport code",
                     choices=Code$Info,
                     selected=NULL,
                     multiple=T)
    )),
    column(width = 5, wellPanel(
      checkboxGroupInput(inputId = "feature", label = "Choose the weather feature",
                         choices=c("weather","temp_f","wind_mph","wind_dir","relative_humidity","pressure_in","visibility_mi","dewpoint_f"),
                         selected=NULL)
    ))
  ),

  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Weather information on map", leaflet::leafletOutput("map"), tableOutput("weather_info")),
                tabPanel("History weather at one location", h3(textOutput("text")), plotOutput("plot_temp"), dataTableOutput("history_info"))
    )
  )

)
