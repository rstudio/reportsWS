#' Create an xts time series object
#'
#' \code{bind_as_xts} combines a time series with the output of \link[forecast]{\code{forecast}} of the forecast package to create an \link[xts]{\code{xts}} object. This is a helper function that makes it easier to model data in the \link{\code{ts}} format and then plot the results in the \link[xts]{\code{xts}} format.
#'
#' @param ts A time series with class "ts"
#' @param forecast An object with class "forecast" created by \link[forecast]{\code{forecast}}
#'
#' @return A time series with class "xts". The series will contain four
#' columns, x (the original time series), fitted (the future predictions),
#' lower, and upper (the lower and upper bounds of an 80% prediction
#' interval for the predictions)
#' @export
bind_as_xts <- function(ts, forecast) {
  startDate <- end(ts)[1] + 1
  cbind(
    x = xts::as.xts(ts),
    fitted = xts::as.xts(ts(forecast$mean,        start = startDate)),
    lower  = xts::as.xts(ts(forecast$lower[ , 1], start = startDate)),
    upper  = xts::as.xts(ts(forecast$upper[ , 1], start = startDate)))
}
