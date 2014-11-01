library(dplyr)
initialize <- function(){
  library(ggplot2)
}

predictPerformance <- function(cyl = 4, displacement = 100, predictBy = 2){
  
#   if( is.null(cyl) && is.null(displacement))
#     return NULL
  if(predictBy == 1){
    model <- lm(hp~factor(cyl), data = mtcars)  
  }
  else if (predictBy == 2){
    model <- lm(hp~disp, data = mtcars)  
  }

  model
}

