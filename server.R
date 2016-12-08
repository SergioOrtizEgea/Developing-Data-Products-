#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

data_mtcars <- mtcars;
data_mtcars <- cbind(rownames(mtcars),data_mtcars)
colnames(data_mtcars)[1] <- "car model"
data_mtcars[c(3,9:12)] <-as.data.frame(lapply(data_mtcars[c(3,9:12)],as.factor))
levels(data_mtcars$am) <- c('Automatic','Manual')


# Define server logic required to look for the cars
shinyServer(function(input, output) {
   
  
  # Selecting the range of mpg
  mpg_selection <- reactive({
    #paste(data[data$mpg > input$mpg[1] && data$mpg < input$mpg[2],])
    paste0("data_mtcars[data_mtcars$mpg > ", input$mpg[1], " & data_mtcars$mpg < ", input$mpg[2], ",  ]" )
  })
           
  # Data corresponding to the mpg selection
  output$data <- renderDataTable({
    eval(parse(text = mpg_selection()))
  })
  

  })
  

