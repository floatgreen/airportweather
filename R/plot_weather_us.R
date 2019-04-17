#Function4: plot an numeric element of all US airport in contour lines
#plot = "point": point plot; you can change it to "contour" if number = true
#you.long: your longitude
#you.lat: your latitude
#bin: the binwidth of the contour lines
#plot one weather elements of all US airport 
plot_weather_us <- function(type, you.long, you.lat, bin){
  id <- c("KBHM", "KDHN", "KHSV", "KMOB", "KMGM", "KIFP", "KFLG", "KGCN", "KIWA",
          "KPGA", "KPHX", "KTUS", "KNYL", "KXNA", "KFSM", "KLIT", "KTXK", "KACV",
          "KBFL", "KBUR", "KFAT", "KLGB", "KLAX", "KMMH", "KMRY", "KOAK", "KONT",
          "KPSP", "KRDD", "KSMF", "KSAN", "KSFO", "KSJC", "KSBP", "KSNA", "KSBA",
          "KSMX", "KSTS", "KSCK", "KASE", "KCOS", "KDEN", "KDRO", "KEGE", "KGJT",
          "KGUC", "KHDN", "KMTJ", "KBDL", "KHVN", "KILG", "KDAB", "KFLL", "KRSW",
          "KGNV", "KJAX", "KEYW", "KMLB", "KMIA", "KMCO", "KSFB", "KECP", "KPNS",
          "KPGD", "KSRQ", "KSGJ", "KPIE", "KTLH", "KTPA", "KVPS", "KPBI", "KABY",
          "KATL", "KAGS", "KBQK", "KCSG", "KSAV", "KVLD", "KBOI", "KSUN", "KIDA", 
          "KLWS", "KPIH",
          "KTWF", "KBLV", "KBMI", "KCMI", "KORD", "KMDW", "KMWA", "KMLI", "KPIA",
          "KUIN", "KRFD", "KSPI", "KEVV", "KFWA", "KIND", "KSBN", "KCID", "KDSM",
          "KDBQ", "KSUX", "KALO", "KGCK", "KMHK", "KFOE", "KICT", "KCVG", "KLEX",
          "KSDF", "KOWB", "KPAH", "KAEX", "KBTR", "KLFT", "KLCH", "KMLU", "KMSY",
          "KSHV", "KBGR", "KPWM", "KPQI", "KRKD", "KBWI", "KHGR", "KSBY", "KBOS",
          "KHYA", "KACK", "KPVC", "KMVY", "KORH", "KAPN", "KDTW", "KESC", "KFNT",
          "KGRR", "KCMX", "KIMT", "KAZO", "KLAN", "KSAW", "KMKG", "KPLN", "KMBS",
          "KCIU", "KTVC", "KBJI", "KBRD", "KDLH", "KHIB", "KINL", "KMSP", "KRST",
          "KSTC", "KGTR", "KGPT", "KJAN", "KCOU", "KJLN", "KMCI", "KSGF", "KSTL",
          "KBIL", "KBZN", "KBTM", "KGTF", "KHLN", "KGPI", "KMSO", "KSDY", "KGRI",
          "KLNK", "KOMA", "KBVU", "KEKO", "KLAS", "KVGT", "KRNO", "KLEB", "KMHT",
          "KPSM", "KACY", "KTTN", "KEWR", "KABQ", "KHOB", "KROW", "KSAF", "KALB",
          "KBGM", "KBUF", "KELM", "KFRG", "KISP", "KITH", "KJFK", "KLGA", "KSWF",
          "KIAG", "KPBG", "KROC", "KSYR", "KART", "KHPN", "KAVL", "KCLT", "KJQF",
          "KFAY", "KGSO", "KPGV", "KOAJ", "KEWN", "KRDU", "KILM", "KBIS", "KDIK",
          "KFAR", "KGFK", "KMOT", "KISN", "KCAK", "KLUK", "KCLE", "KCMH", "KLCK",
          "KDAY", "KTOL", "KYNG", "KLAW", "KOKC", "KTUL", "KEUG", "KMFR", "KOTH",
          "KPDX", "KRDM", "KABE", "KERI", "KMDT", "KLBE", "KPHL", "KPIT", "KUNV",
          "KAVP", "KIPT", "KBID", "KPVD", "KWST", "KCHS", "KCAE", "KFLO", "KGSP",
          "KHXD", "KMYR", "KABR", "KRAP", "KFSD", "KTRI", "KCHA", "KTYS", "KMEM",
          "KBNA", "KABI", "KAMA", "KAUS", "KBPT", "KBRO", "KCLL", "KCRP", "KDAL",
          "KDFW", "KELP", "KGRK", "KHRL", "KIAH", "KHOU", "KLRD", "KGGG", "KLBB",
          "KMFE", "KMAF", "KSJT", "KSAT", "KTYR", "KACT", "KSPS", "KCDC", "KOGD",
          "KPVU", "KSLC", "KSGU", "KBTV", "KCHO", "KLYH", "KPHF", "KORF", "KRIC",
          "KROA", "KDCA", "KIAD", "KBLI", "KFHR", "KPSC", "KPUW", "KBFI", "KSEA",
          "KGEG", "KALW", "KEAT", "KYKM", "KCRW", "KCKB", "KHTS", "KMGW", "KATW",
          "KEAU", "KGRB", "KLSE", "KMSN", "KMKE", "KCWA", "KRHI", "KCPR", "KCOD",
          "KGCC", "KJAC", "KLAR", "KRKS")
  data <- current_weather_more(id, type)
  data <- na.omit(data)
  colnames(data)[6]<-"element"
  data$element <- as.numeric(as.character(data$element))
  states <- map_data("state")
  m <- loess(element~longitude*latitude, data = data)
  xgrid <- seq(min(data$longitude), max(data$longitude), 0.01)
  ygrid <- seq(min(data$latitude), max(data$latitude), 0.01)
  data.fit <- expand.grid(longitude = xgrid, latitude = ygrid)
  result <- predict(m, newdata = data.fit)
  mtrx.melt <- melt(result, id.vars=c('longitude','latitude'),measure.vars = 'element')
  colnames(mtrx.melt)[3]<-"element"
  mtrx.melt$longitude <- as.numeric(str_sub(mtrx.melt$longitude, str_locate(mtrx.melt$longitude, '=')[1,1] + 1))
  mtrx.melt$latitude <- as.numeric(str_sub(mtrx.melt$latitude, str_locate(mtrx.melt$latitude, '=')[1,1] + 1))
  ggplot(data = states) + 
    geom_polygon(aes(x = long, y = lat, group = group),
                 color = "grey", alpha = 0.6) + 
    geom_contour(data = mtrx.melt, binwidth = bin,
                 aes(x = longitude, y = latitude, z = element,colour = ..level..)) +
    geom_point(aes(x= you.long, y=you.lat), colour="red") +
    geom_text(aes(x = you.long - 0.5, y = you.lat - 0.5, label = "You"),size = 2) +
    theme_bw() +
    labs(title = type, 
         subtitle = as.character(data$observation_time[1]))+
    coord_fixed(1.3) +
    guides(fill = FALSE)
}

#example
plot_weather_us(type = "temp_c",
                you.long = -100, you.lat = 35,
                bin = 0.5)
