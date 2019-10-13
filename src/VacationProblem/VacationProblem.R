setwd('D:/Document/MMU Sem 6/AI/Assignment')
#install.packages("GA")
library(GA)


#creating price quotation
#user can read from .csv file as well
priceQuotation = data.frame(
  Code = c(1:5),
  Hotel = c(50,100,200,400,800),
  Food = seq(100,500,by=100),
  TouristSpot = seq(50,250,by=50),
  KindOfTransportation = c(10,20,30,40,120)
)
View(priceQuotation)

#define amount of money willing to be spent for the vacation by user
amountOfMoney = 20000 


fitnessFunc <- function(x){
  #the values in the list of combination passed to the function are floored to create integer values  
  floor(x)
  #sums up amount
  val = priceQuotation$Hotel[x[1]] + priceQuotation$Food[x[2]] + priceQuotation$TouristSpot[x[3]] + priceQuotation$KindOfTransportation[x[4]]
  if(val > amountOfMoney)
    return(0)
  else
    return(val)
}


#passing parameters
#lower boundary sets the values in the list to be not lower than 1.
#higher boundary sets the values in the list to be not higher than (4,6,6,6). -which is [3,5,5,5]
GA <- ga(type = "real-valued", fitness = fitnessFunc, lower=c(1,1,1,1), upper=c(4,6,6,6), popSize = 500)

#result
summary(GA, echo=TRUE)
plot(GA)
floor(GA@solution[1,])
GA@summary

#amount of days available with the amount of money and the best combination
#Due to the "real-valued" nature of the numbers, the numbers come with decimal points.
#However, all the solutions in the list of best solutions return the same combination 
#due to the flooring method in the fitness function . 
bestVal = priceQuotation$Hotel[GA@solution[1,1]] + priceQuotation$Food[GA@solution[1,2]] + priceQuotation$TouristSpot[GA@solution[1,3]] + priceQuotation$KindOfTransportation[GA@solution[1,4]]

#divide the amount of money set by the user by the amount added from the best solution and floor it
numberOfDaysOfVacation = amountOfMoney%/%bestVal
numberOfDaysOfVacation

