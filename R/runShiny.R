##' @name runShiny
##' @title Run shiny app
##' @description Run shiny app to show the weather information.
##' @usage runShiny()
##' @return a shiny app
##' @examples
##' runShiny()
##' @export

runShiny <- function() {
  appDir <- system.file("shiny-examples", "myapp", package = "airportweather")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `airportweather`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
