# Exercise 16 

# The app below lets users manipulate the parameters of an ARIMA(p, d, q) model and instantly see the results, as well as an ACF and PACF plot (two tools for diagnosing the correct parameters).
#
# Try it out, then turn the app into a function named shiny_arima that takes an argument, ts (a time series to model), launches the app and then returns the ARIMA model object that the user builds with the Shiny app. To do this you will need to

# 1. wrap the app in function() and save it as shiny_arima
# 2. turn ts into a parameter/function argument
# 3. Add an actionButton() that the user can click to stop the app
# 4. Arrange for the app to call stopApp() and return mod()
#    when the user clicks the action button
# 5. wrap shinyApp() with runApp()

library(shiny)
library(dygraphs)
library(forecast)
library(reportsWS)

server <- function(input, output) {

  ts <- ts(subset(babynames::babynames,
        name == "Garrett" & sex == "M")$n)

  # reactive expressions
  mod <- reactive({
    Arima(ts, order = c(input$p, input$d, input$q))
  })
  resids <- reactive(mod()$residuals)

  # rendered output to display
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
          value = 0, step = 1)),
      column(4, plotOutput("acf")),
      column(4, plotOutput("pacf"))))
)

shinyApp(server = server, ui = ui)
