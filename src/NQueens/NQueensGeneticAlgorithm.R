# install.packages("GA")
library(GA)

fitnessFunc<-function(combination){
  # there are only 2 fitness score - [0,1] 
  # if the combination is not a solution, return 0
  # if the combination is a solution, return 1
  
  # initialise killed as FALSE
  killed=FALSE
  for (row in 1:(length(combination)-1) ){
    # distance away from queen of current row which is being compared
    distance = 1
    for (col in (row+1):length(combination) ){
      # check if the queen of other row which is at different column attack each other
      if(abs(combination[row]-combination[col]) == distance){
        # set killed to TRUE if the queens attack each other
        killed=TRUE
      }
      # increment the distance by 1 to check the queen of current row against the queen from the next row   
      distance=distance + 1
    }
    # if queen is killed, return 0 (lowest fitness score)
    if(killed==TRUE){
      return(0)
    }
  }
  if (killed==FALSE){
    # if queen is not killed after checking all rows, return 1 (highest fitness score)
    # solution<-append(solution, combinations[i])
    return(1)
  }
}

# this is for 8-Queens, just change the upper boundary to 4/16/32 for different number of queens

# passing parameters
# 1 is the lower boundary for the permutation
# 8 is the higher boundary for the permutation
GA <- ga(type = "permutation", fitness = fitnessFunc, lower=1, upper=8, popSize = 500, elitism = 50)

#result
summary(GA, echo=TRUE)
plot(GA)
# GA@summary

