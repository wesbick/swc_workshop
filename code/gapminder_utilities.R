calcGDP <- function(data, year=NULL, country=NULL){
  if(!is.null(year)){
    data <- data[data$year == year, ]
  }
  
  if(!is.null(country)){
    data <- data[data$country == country, ]
  }
  
  gdp <- data$pop * data$gdpPercap
  new_data <- cbind(data, gdp)
  return(new_data)
}