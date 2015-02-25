shiny_arima <- function(ts) {
  stopifnot(is.ts(ts))

  server <- function(input, output) {
    mod <- reactive({
      Arima(ts, order = c(input$p, input$d, input$q))
    })
    resids <- reactive(mod()$residuals)

    observe({
      if (input$stop > 0) stopApp(mod())
    })

    output$model <- renderText({
      paste0("ARIMA(", input$p, ", ", input$d, ", ", input$q, ")")
    })
    output$acf <- renderPlot({
      acf(resids(), na.action = na.pass, main = "ACF of residuals")
    })
    output$pacf <- renderPlot({
      pacf(resids(), na.action = na.pass, main = "PACF of residuals")
    })
    output$forecast <- renderDygraph({
      all <- bind_as_xts(ts, forecast::forecast(mod(), h = 12))
      dygraph(all) %>%
        dySeries(c("lower", "fitted", "upper"), label = "Predicted") %>%
        dyRangeSelector()
    })
  }

  ui <- fluidPage(
    titlePanel("Select an ARIMA(p,d,q) model"),
    fluidRow(column(11, dygraphs::dygraphOutput("forecast"))),
    br(),
    wellPanel(
      fluidRow(
        column(3,
          h3(textOutput("model")),
          sliderInput("p", "Select p", min = 0, max = 5,
                      value = 0, step = 1),
          sliderInput("d", "Select d", min = 0, max = 5,
                      value = 0, step = 1),
          sliderInput("q", "Select q", min = 0, max = 5,
                      value = 0, step = 1),
          actionButton("stop", "Return Model")),
      column(4, plotOutput("acf")),
      column(4, plotOutput("pacf"))))
  )

  runApp(shinyApp(server = server, ui = ui))
}

# Try shiny_arima with
# nbirths <- ts(subset(babynames::babynames, name == "Garrett" & sex == "M")$n)
# my_mod <- shiny_arima(nbirths)
# my_mod
