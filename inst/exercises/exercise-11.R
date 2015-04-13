# Exercise 11 - shinyApp()
# 
# 
# The code below generates a histogram of 500 random standard normal values. Use the code to build a shiny app with shinyApp().
# 
# 1. Define a ui that splits the app into a sidebar and a main panel
# 2. Add an action button to the sidebar
# 3. Insert a rendered plot into the main panel
# 4. Write a server function that re-renders a histogram each time the action button is pressed
# 5. Ensure that the function saves the plot as an element of `output`
# 6. Assemble the components togther with `shinyApp()`
# 7. Run the code in the console window to verify that it works.


hist(rnorm(500), breaks = 30, col = "grey", border = "white",
  main = "500 random draws from a standard normal distribution")

