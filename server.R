
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("loader.R")
initialize()
#loadData()
  
  
  
  #pass parameters to the graphics device
  
  
shinyServer(function(input, output) {
  
  getModel <-reactive({
    
    predictPerformance(cyl = input$cyl, displacement = input$disp, predictBy = input$predictBy)  
    
  })
  inp <- reactive({
    if(input$predictBy == 1){
      return(input$cyl)
    }
    else if (input$predictBy == 2){
      return(input$disp)
    }
  })
  predictResults <- reactive({
    if(input$predictBy == 1){
      new.data.cyl = data.frame(cyl = c(inp()))  
      return(predict(model, new.data.cyl))
      #return(as.numeric(input$cyl))
      
    }
    else if (input$predictBy == 2){
      new.data.disp = data.frame(disp = c(inp())) 
      return(predict(model, new.data.disp))
    }
    #predict(model, new.data)
    #
    #1
  })
  
  output$prediction <- renderText({
    model <- getModel()
    
    #predictResults()
    paste(round(predictResults()), "hp", input$predictBy)
    
  })
  
  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2]
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    
    #plot(model)
    scatterplot(hp ~ disp | cyl, data=mtcars,
                xlab="Weight of Car", ylab="Miles Per Gallon",
                main="Car Performance",
                labels=row.names(mtcars)) 

  })

})
