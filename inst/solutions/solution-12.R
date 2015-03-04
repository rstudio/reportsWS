# Solution 12 - Navbar app
# 
# Notice that the app pictured above has a navigation bar at the top of the page with three different tabs. The first name on the navigation bar is "Random Generator". The remaining names are "Normal data", "Uniform data", "Chi Squared data".
# 
# 1. Modify the ui of the app below so it resembles the app pictured above. 
# 2. Then remove `eval = FALSE` and rerender the Study Guide.
# 
# _Note: the app won't look exactly the same while embedded in the Study Guide. If you prefer, launch the app from its own R Script._

# The app below generates three separate histograms with three separate buttons. Reorganize the app into three tabpanels connected by a navbar.
#
# 1. The title of the navbar page should be "Random Generator"
#    + which function will you use to create a navbar page?
#    + will you still need to use `fluidPage()`?
# 2. The first tab panel should have the tile "Normal Data"
#     + It should contain the action button and histogram that generate normal data.
# 3. The second tab panel should have the tile "Uniform Data"
#     + It should contain the action button and histogram that generate uniform data.
# 4. The third tab panel should have the tile "Chi Squared Data"
#     + It should contain the action button and histogram that generate chi squared data.
# 5. Run the finished code in the command line to launch the app and verify your work.

library(shiny)

serv <- function(input, output) {
  output$norm <- renderPlot({
    input$renorm
    hist(rnorm(500), breaks = 30, col = "grey", border = "white",
      main = "500 random draws from a standard normal distribution")
  })
  output$unif <- renderPlot({
    input$reunif
    hist(runif(500), breaks = 30, col = "grey", border = "white",
      main = "500 random draws from a standard uniform distribution")
  })
  output$chisq <- renderPlot({
    input$rechisq
    hist(rchisq(500, 2), breaks = 30, col = "grey", border = "white",
       main = "500 random draws from a Chi Square distribution with two degree of freedom")
  })
}

ui <- navbarPage(title = "Random generator",
  tabPanel(title = "Normal data",
    fluidRow(
      column(width = 2,
        wellPanel(actionButton("renorm", "Resample"))
      ),
      column(width = 10,
        plotOutput("norm")
      )
    )
  ),
  tabPanel(title = "Uniform data",
    fluidRow(
      column(width = 2,
        wellPanel(actionButton("reunif", "Resample"))
      ),
      column(width = 10,
        plotOutput("unif")
      )
    )
  ),
  tabPanel(title = "Uniform data",
    fluidRow(
      column(width = 2,
        wellPanel(actionButton("rechisq", "Resample"))
      ),
      column(width = 10,
        plotOutput("chisq")
      )
    )
  )
)

shinyApp(server = serv, ui = ui)