# Solution 12 - Navbar app

library(shiny)

server <- function(input, output) {
  
  rv <- reactiveValues(
    norm = rnorm(500), 
    unif = runif(500),
    chisq = rchisq(500, 2))
  
  observeEvent(input$renorm, { rv$norm <- rnorm(500) })
  observeEvent(input$reunif, { rv$unif <- runif(500) })
  observeEvent(input$rechisq, { rv$chisq <- rchisq(500, 2) })
  
  output$norm <- renderPlot({
    hist(rv$norm, breaks = 30, col = "grey", border = "white",
      main = "500 random draws from a standard normal distribution")
  })
  output$unif <- renderPlot({
    hist(rv$unif, breaks = 30, col = "grey", border = "white",
      main = "500 random draws from a standard uniform distribution")
  })
  output$chisq <- renderPlot({
    hist(rv$chisq, breaks = 30, col = "grey", border = "white",
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

shinyApp(server = server, ui = ui)