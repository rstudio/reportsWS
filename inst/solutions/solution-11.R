# Solution 11 - shinyApp()
# 
# 
# The code below generates a histogram of 500 random standard normal values. Use the code to build a shiny app with shinyApp().
# 
# 1. Define a ui that splits the app into a sidebar and a main panel
# 2. Add an action button to the sidebar
# 3. Insert a rendered plot into the main panel
# 4. Write a server function that re-renders a histogram each time the action button is pressed
#     + Note: the value of an action button increases by one (i.e., it changes) each time it is pressed.
# 5. Ensure that the function saves the plot as an element of `output`
# 6. Assemble the components togther with `shinyApp()`
# 7. Run the code in the console window to verify that it works.

library(shiny)

server <- function(input, output) {
  
  rv <- reactiveValues(data = rnorm(500))
  
  observeEvent(input$click, { 
    rv$data <- rnorm(500) 
  })
  
  output$hist <- renderPlot({
    hist(rv$data, breaks = 30, probability = TRUE, 
       main = "500 random draws from a standard normal distribution")
  })
}

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(actionButton("click", "Resample")),
    mainPanel(plotOutput("hist"))
  )
)

shinyApp(server = server, ui = ui)

