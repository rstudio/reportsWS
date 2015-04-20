library(shiny)

server <- function(input, output) {
  output$plot <- renderPlot({
    hist(rnorm(input$num))
  })
}

ui <- fluidPage(
  sliderInput(inputId = "num", 
     label = "Choose a number", 
     value = 25, min = 1, max = 100),
  plotOutput("plot")
)

shinyApp(server = server, ui = ui)