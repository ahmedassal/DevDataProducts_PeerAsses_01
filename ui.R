
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Car Perfromance Predictor"),
  
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(position = "right",
    
    sidebarPanel(
      radioButtons("predictBy",label = h4("Predict by:"),
                   choices = list("Cylinders" = 1, 
                                  "Displacement" = 2),
                   selected = 1),
      
      radioButtons("cyl",label = h4("Number of Cylinders:"),
                  choices = list("4 Cylinders" = 4, 
                                 "6 Cylinders" = 6, 
                                 "8 Cylinders" = 8),
                  selected = 4),
      
#       numericInput('cyl', "Number of Cylinders:", 4, min = 4, max = 8, step = 2),
      
      numericInput('disp', 'Displacement (cubic inches)', 1300, min = 100, max = 7000, step = 100),
      submitButton('Submit'),
      tags$br(),
      tags$br()
      
      
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      img(src="http://www.infinitegarage.com/wp-content/uploads/2013/07/hot-rod-engine.jpg"),
      tabsetPanel(
        tabPanel("Plot", 
                 plotOutput("distPlot")
            ), 
        tabPanel("Results",
                  h3('Results of prediction'),
                  h4('You entered'),
                  verbatimTextOutput('disp'),
                  h4('Which resulted in a prediction of the following horsepower:'),
                  textOutput("prediction")
               
            ), 
        tabPanel("Table", 
                 tableOutput("table")
            )
          ),
                

        a("https://github.com/ahmedassal/DevDataProducts_PeerAsses_01")
      
      )
    )
))
