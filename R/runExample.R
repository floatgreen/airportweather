runExample <- function() {
  appDir <- system.file("shiny-examples", "myapp", package = "airportweather")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `airportweather`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
