# replace ever library(reportsWS) call with ALL of this code

bind_as_xts <- function(ts, forecast) {
  startDate <- end(ts)[1] + 1
  cbind(
    x = xts::as.xts(ts),
    fitted = xts::as.xts(ts(forecast$mean,        start = startDate)),
    lower  = xts::as.xts(ts(forecast$lower[ , 1], start = startDate)),
    upper  = xts::as.xts(ts(forecast$upper[ , 1], start = startDate)))
}

get_babyname <- function(name, sex) {
  names <- babynames::babynames[
    babynames::babynames$name == name &
    babynames::babynames$sex == sex, ]
  span <- data.frame(year = 1880:2013)
  merge(span, names, by = "year", all = TRUE)
}

trim_whitespace <- function(string) {
  gsub(" +$", "", string)
}

