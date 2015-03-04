# Exercise 13 - HTML formatting

# Format each line below with a `tags` function to display what the line describes. Then launch the app. 

library(shiny)

ui <- fluidPage(
  title = "You can use HTML tags to indicate",
  fluidRow("A first level header"), 
  fluidRow("A second level header"),  
  fluidRow("A third level header"), 
  fluidRow("A fourth level header"),  
  fluidRow("A fifth level header"),  
  fluidRow("A sixth level header"),  

  fluidRow("A block quote"),  
  fluidRow("bold text"),  
  fluidRow("italic text"),  
  fluidRow("Monospaced text (e.g., code)"),   

  fluidRow("A hyperlink (to href='shiny.rstudio.com')"),  
  fluidRow("A horizontal rule"),  

  fluidRow("An unordered list:", "Item 1", "Item 2", 
           "sub-item 1", "sub-item 2"),  

  fluidRow("An ordered list:", "Item 1", "Item 2", 
           "sub-item 1", "sub-item 2")
)

shinyApp(server = function(input, output){}, ui = ui)