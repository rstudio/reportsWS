#' Open an exercise
#'
#' \code{exercise} opens an exercise file in your RStudio scripts pane and saves a copy of the file in your working directory.
#'
#' @param number The number of exercise to open.
#' @return NULL 
#'
#' @export
exercise <- function(number = 1) {
  if (!(number %in% 1:20)) stop("Unrecognized exercise number")

  filename <- switch(number,
    "1" = "exercise-1.R",
    "2" = "exercise-2.Rmd",
    "3" = "exercise-3.Rmd",
    "4" = "exercise-4.Rmd",
    "5" = "exercise-5.Rmd",
    "6" = "exercise-6.Rmd",
    "7" = "exercise-7.Rmd",
    "8" = "exercise-8.Rmd",
    "9" = "exercise-9.Rmd",
    "10" = "exercise-10.Rmd",
    "11" = "exercise-11.R",
    "12" = "exercise-12.R",
    "13" = "exercise-13.R",
    "14" = "exercise-14.Rmd",
    "15" = "exercise-15.R",
    "16" = "exercise-16.R",
    "17" = "exercise-17.Rmd",
    "18" = "exercise-18.Rmd",
    "19" = "exercise-19.R",
    "20" = "exercise-20.R"
    )

  path <- system.file("exercises", filename, package = "reportsWS")
  newpath <- file.path(getwd(), filename)
  file.copy(path, newpath, copy.mode = FALSE)
  file.edit(newpath)
  
  if (number == 2) {
    img <- system.file("exercises", "orb.png", package = "reportsWS")
    file.copy(img, newpath, copy.mode = FALSE)
  }
}
