% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/current_weather_more.R
\name{current_weather_more}
\alias{current_weather_more}
\title{Read the Data of Multiple Airport Location}
\usage{
current_weather_more(id_vector, type)
}
\arguments{
\item{id_vector}{a vector of  multiple airport codes}

\item{type}{a vector of weather elements}
}
\value{
a data frame of the weather information
}
\description{
This function read the the weather information of Multiple airport from the website of NOAA's National Weather Service.
}
\examples{
current_weather_more(c("KAMW", "KAIO", "KCID", "KCNC"), c("temp_f"))
}
