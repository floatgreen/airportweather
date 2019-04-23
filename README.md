# airportweather

The goal of airportweather is to read the current weather component(s) from "https://w1.weather.gov/xml/current_obs/" and record the information as data frame or plot it on an US map.

## Installation

You can download the package "airportweather" from [github](https://github.com/floatgreen/airportweather), then install (build) it with ctrl+shift+B.

## Example

Followings are some examples which shows you how to use this package:  
1. Read the data of one airport.  
If the components' names do not exist or the data is missing, the result data frame shows NA(s).

``` r
current_weather("KAMW", c("wind_mph", "temp_f", "haha"))
current_weather("KAMW", "temp_c")
```

2. Read the data of many airports.

``` r
current_weather_more(c("KAMW", "KAIO", "KCID", "KCNC"), c("temp_f"))
current_weather_more(c("KAMW", "KAIO", "KCID", "KCNC"), c("temp_f", "wind_mph"))
```

3. Plot one component of several airports on the map of US.

``` r
plot_weather(c("KAMW", "KAIO", "KCID", "KCNC"),
            type = "weather",
            label = TRUE, number = FALSE)
            
plot_weather(c("KAMW", "KAIO", "KCID", "KCNC"),
            type = "temp_f",
            label = TRUE, number = TRUE)
```

4. Plot one component of the airports chosen by user and the user's position on the map of US.

``` r
plot_position(c("KAMW", "KAIO"), type = "temp_f", you.long = -100, you.lat = 35,number = TRUE)
```

5. Plot one component of all airports and the user's position on the map of US with contour lines. It takes a couple of seconds to run. The component has to be continues.

``` r
plot_weather_us(type = "temp_c",you.long = -100, you.lat = 35,bin = 0.5)
```
