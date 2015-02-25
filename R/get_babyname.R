#' Retrieve a name from the babynames data set
#'
#' The \link[babynames]{\code{babynames}} data set provides information
#' on names collected by the United States Social Security
#' Administration. The data describes how many children were given each
#' name for each year since 1880, as well as the proportion of children
#' given the name in a given year. The data is organized by year, name
#' and sex and includes an entry for each name used five or more times
#' in a single year.
#'
#' \code{get_babyname} returns all of the entries associated with a single name and sex.
#'
#' @param name A character string. The string should begin with a capital letter.
#' @param sex "M" for male, "F" for female
#'
#' @return A data frame with five variables: \code{year}, \code{sex},
#' \code{name}, \code{n}, and \code{prop} (\code{n} divided by the total
#' number of applicants that year)
#'
#' @export
get_babyname <- function(name, sex) {
  names <- babynames::babynames[
    babynames::babynames$name == name &
    babynames::babynames$sex == sex, ]
  span <- dplyr::data_frame(year = 1880:2013)
  dplyr::left_join(span, names, by = "year")
}
