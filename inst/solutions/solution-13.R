# Solution 13 - HTML formatting

# Format each line below with a `tags` function to display what the line describes. Then launch the app. 

library(shiny)

ui <- fluidPage(
  title = "You can use HTML tags to indicate",
  fluidRow(h1("A first level header")), 
  fluidRow(h2("A second level header")),  
  fluidRow(h3("A third level header")), 
  fluidRow(h4("A fourth level header")),  
  fluidRow(h5("A fifth level header")),  
  fluidRow(h6("A sixth level header")),  

  fluidRow(tags$block("A block quote")),  
  fluidRow(strong("bold text")),  
  fluidRow(em("italic text")),  
  fluidRow(code("Monospaced text (e.g., code)")),   

  fluidRow(a("A hyperlink", href='shiny.rstudio.com')),  
  fluidRow("A horizontal rule", hr()),  

  fluidRow("An unordered list:", 
           tags$ul(
             tags$li("Item 1"), 
             tags$li("Item 2"),
             tags$ul(
               tags$li("sub-item 1"), 
               tags$li("sub-item 2")))),  

  fluidRow("An Ordered list:", 
           tags$ol(
             tags$li("Item 1"), 
             tags$li("Item 2"),
             tags$ol(
               tags$li("sub-item 1"), 
               tags$li("sub-item 2")))) 
)

shinyApp(server = function(input, output){}, ui = ui)
