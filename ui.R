#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that shows the car for mpg comsumption
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Sergio Ortiz Egea presents..."),
  
  headerPanel("...Car for mpg consumption"),
  
  # slider bar for  entering the mpg range 
  h5(
    "Please select the range of mpg"
    ),
  sliderInput(
    "mpg", "Selection of the mpg range:", min = 10, max = 34, value = c(10,34)
    ),
    
    # Show a plot of the generated distribution
  mainPanel(
    h3("Selection of cars by mpg"),
    dataTableOutput('data')
    
  )
)
)

