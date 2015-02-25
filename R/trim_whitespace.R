#' Remove trailing white spaces from a string
#'
#' \code{trim_whitespace} removes trailing white spaces from a character
#' string (or each string in a vector of character strings).
#' Non-trailing white spaces will be preserved.
#'
#' @param string A character string or vector of character strings
#' @return A character string or vector of character strings.
#'
#' @export
trim_whitespace <- function(string) {
  gsub(" +$", "", string)
}
