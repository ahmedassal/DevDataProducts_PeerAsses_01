library(dplyr)
initialize <- function(){
  library(ggplot2)
}

predictPerformance <- function(cyl = 4, disp = 100, predictBy = 2){
  
#   if( is.null(cyl) && is.null(displacement))
#     return NULL
  if(predictBy == 1){
    model <- lm(hp~ cyl , data = mtcars)  
  }
  else if (predictBy == 2){
    model <- lm(hp~ disp, data = mtcars)  
  }
  if (!is.null(model)){
    model  
  }
  else{
    null
  }
  
}

