#' Pollution data
#'
#' Pollution data from the WHO, 2014. This dataset contains
#' a subset of data from the Ambient Air Pollution Database, 
#' WHO, May 2014.
#'
#' @format A data frame with variables:
#' \describe{
#' \item{amount}{The mean annual concentration of particles in milligrams per meter cubed (ug/m3)}
#' \item{city}{Name of city: New York, London, or Beijing}
#' \item{size}{Size of air particulate measured. Fine suspended particles smaller than 10 microns in diameter (\code{large}) and 2.5 microns in diameter (\code{small}).}

#' }
#'
#' @source \url{http://www.who.int/phe/health_topics/outdoorair/databases/cities/en/}
#'
"pollution"

#' Hurricane data
#'
#' Wind speed data for six hurricanes, collected from 
#' National Hurricane Center's archive of Tropical Cyclone 
#' Reports.
#'
#' @format A data frame with variables:
#' \describe{
#' \item{storm}{Name of hurricane: Alberto, Alex, Allison, Ana, Arlene, Arthur.}
#' \item{wind}{Maximum wind speed measured for each hurricane (in miles per hour).}
#' \item{pressure}{Air pressure in the storm's center (in millibars).}
#' \item{date}{Date maximum wind speed was observed.}
#' }
#'
#' @source \url{http://www.nhc.noaa.gov/}
#'
"storms"

#' TB cases in USA, Germany, and France
#'
#' A subset of data from the World Health Organization Global 
#' Tuberculosis Report.
#'
#' @format A dataset with the estimated number of TB cases in 
#' France, Germany, and the United States for 2011, 2012, and 
#' 2013. 
#' 
#' @source \url{http://www.who.int/tb/country/data/download/en/}
#'
"cases"


#' Names of musicians
#'
#' A simple data set of musicians and the instruments they played.
#'
"artists"

#' Names of songs
#'
#' A simple list of pop songs and their authors
#'
"songs"


#' Baby names.
#'
#' Full baby name data provided by the SSA. This includes all names with at
#' least 5 uses. This data set is a reformatted version of the \code{babynames} 
#' data set in the \code{babynames} package.
#'
#' @format A data frame with four variables: \code{year}, \code{sex},
#'   \code{name}, and \code{prop}.
"bnames"

#' Births
#'
#' Live births data from census.gov.
#'
#' @format A data frame:
#' \describe{
#' \item{year}{Year}
#' \item{sex}{Sex}
#' \item{births}{Number of live births, rounded to nearest 1000}}
"births"

#' bnames2
#' 
#' A subset of the \code{bnames} data set.
#' 
"bnames2"

