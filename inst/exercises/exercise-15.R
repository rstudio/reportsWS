# Exercise 15 - A shiny function
#
#
# Parameterize the function below. Notice that the function 
# uses `faithful`, a data set that comes with base R.
# 
# 1. Define an argument named `vec` for the function.
#     + `vec` should take a vector of numbers
# 2. Modify the histogram call so that it plots a histogram of `vec` instead of `faithful$eruptions`
# 3. Run the function definition at the command line. Then try running
#     + `myShinyFun(vec = rnorm(500))`
#     + `myShinyFun(vec = faithful$eruptions)`
#     + `myShinyFun(vec = iris$Sepal.Length)`


myShinyFun <- function() {
  server <- function(input, output) {
    output$hist <- renderPlot({
      hist(faithful$eruptions, breaks = input$n_breaks,
        probability = TRUE, xlab = "Duration (minutes)", 
        main = "Geyser eruption duration")
    })
  }
  ui <- fluidPage(
    sidebarLayout(
      sidebarPanel(
        sliderInput("n_breaks", label = "Number of bins:", 
          min = 10, max = 50, value = 25)
      ),
      mainPanel(plotOutput("hist"))
    )
  )
  shinyApp(server = server, ui = ui)
}
