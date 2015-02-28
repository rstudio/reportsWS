exercise <- function(number = 1) {
  if (!(number %in% 1:5)) stop("Unrecognized exercise number")

  filename <- switch(number,
    "1" = "exercise-1.R",
    "2" = "exercise-2.Rmd",
    "3" = "exercise-3.Rmd",
    "4" = "exercise-4.Rmd",
    "5" = "exercise-5.R")

  path <- system.file("exercises", filename, package = "reportsWS")
  newpath <- file.path(getwd(), filename)
  file.copy(path, newpath, copy.mode = FALSE)
  file.edit(newpath)
}

solution <- function(number = 1) {
  if (!(number %in% 1:5)) stop("Unrecognized solution number")

  filename <- switch(number,
    "1" = "solution-1.Rmd",
    "2" = "solution-2.Rmd",
    "3" = "solution-3.Rmd",
    "4" = "solution-4.R",
    "5" = "solution-5.R")

  path <- system.file("solutions", filename, package = "reportsWS")
  newpath <- file.path(getwd(), filename)
  file.copy(path, newpath, copy.mode = FALSE)
  file.edit(newpath)
}

demo <- function(number = 1) {
  if (!(number %in% 1:5)) stop("Unrecognized demo number")

  filename <- switch(number,
    "1" = "1-resume.Rmd")

  path <- system.file("demos", filename, package = "reportsWS")
  newpath <- file.path(getwd(), filename)
  file.copy(path, newpath, copy.mode = FALSE)
  file.edit(newpath)
}



