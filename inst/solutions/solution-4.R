library(reportsWS)
library(forecast)
library(dygraphs)
library(shiny)

# server object
server <- function(input, output){

  # build reactives
  names <- reactive(get_babyname(input$name, input$sex))
  nbirths <- reactive(ts(names()$n, start = 1880))
  pred <- reactive({
    mod <- auto.arima(nbirths())
    forecast(mod, h = 12) # 12 for 2025
  })

  # build outputs
  output$sum <- renderText(sum(nbirths(), na.rm = TRUE))
  output$sum_text <- renderText(paste("children have had the name",
    input$name, "since 1880."))
  output$prediction <- renderText(round(last(pred()$mean)))
  output$prediction_text <- renderText(paste(
    "children will have the name in 2025 according to an",
    trim_whitespace(pred()$method), "model."))
  output$plot <- renderDygraph({
    title <- paste0("Number of children named ", input$name)
    all <- bind_as_xts(nbirths(), pred())

    dygraph(all, main = title) %>%
      dySeries("x", label = "n children") %>%
      dySeries(c("lower", "fitted", "upper"), label = "Predicted") %>%
      dyRangeSelector()
  })
  output$data <- renderDataTable(names())
}

# ui object
ui <- navbarPage("What's in a Name?",    # tabs connected by a navbar

  # the first tab
  tabPanel("Home",

    # The first row will have 3 equally spaced columns
    fluidRow(

      # first column contains input widgets
      column(4,
        wellPanel(
          textInput(inputId = "name", label = "Type a name",
             value = "Garrett"),
          radioButtons(inputId = "sex", label = "Choose gender",
             choices = c("M", "F"), inline = TRUE))),

      # second column displays total
      column(4,
        wellPanel(
          h1(textOutput("sum")),
          textOutput("sum_text"))),

      # third column displays the model results
      column(4,
        wellPanel(
          h1(textOutput("prediction")),
          textOutput("prediction_text")))),

    # The second row has a single column
    # as a result, the dygraph will span the page
    fluidRow(column(10, offset = 1, dygraphs::dygraphOutput("plot")))),

  # the second tab
  tabPanel("Raw Data", dataTableOutput("data"))
)

# shinyApp assembles the server and ui objects into a finished app
shinyApp(server = server, ui = ui)

