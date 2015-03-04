demo <- function(number = 1) {
  if (!(number %in% 1:5)) stop("Unrecognized demo number")

  filename <- switch(number,
    "1" = "1-resume.Rmd")

  path <- system.file("demos", filename, package = "reportsWS")
  newpath <- file.path(getwd(), filename)
  file.copy(path, newpath, copy.mode = FALSE)
  file.edit(newpath)
}



