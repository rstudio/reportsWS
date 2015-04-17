#' Open a solution
#'
#' \code{solution} opens a solution file in your RStudio scripts pane and saves a copy of the file in your working directory.
#'
#' @param number The number of solution to open. Solution numbers are paired with exercises.
#' @return NULL 
#'
#'@seealso \code{\link{exercise}}
#' @export
solution <- function(number = 1) {
  if (!(number %in% 1:16)) stop("Unrecognized solution number")

  filename <- switch(number,
    "1" = "solution-1.R",
    "2" = "solution-2.Rmd",
    "3" = "solution-3.Rmd",
    "4" = "solution-4.Rmd",
    "5" = "solution-5.Rmd",
    "6" = "solution-6.Rmd",
    "7" = "solution-7.Rmd",
    "8" = "solution-8.Rmd",
    "9" = "solution-9.Rmd",
    "10" = "solution-10.Rmd",
    "11" = "solution-11.R",
    "12" = "solution-12.R",
    "13" = "solution-13.R",
    "14" = "solution-14.Rmd",
    "15" = "solution-15.R",
    "16" = "solution-16.R",
    "17" = "solution-17.Rmd",
    "18" = "solution-18.Rmd",
    "19" = "solution-19.Rmd"
    )

  path <- system.file("solutions", filename, package = "reportsWS")
  newpath <- file.path(getwd(), filename)
  file.copy(path, newpath, copy.mode = FALSE)
  file.edit(newpath)
}
