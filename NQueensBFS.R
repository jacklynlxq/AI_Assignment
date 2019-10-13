# install.packages("rlist")
library(rlist)

# number of queens
N=4
# intialise list of combinations
comb<-list(1,2,3,4)
#initial numberOfNode is the number of queens
numberOfNode=N

checkKilled<-function(combination){
  # initialise killed as FALSE
  killed=FALSE
  for (row in 1:(length(combination)-1) ){
    # distance away from queen of current row which is being compared
    distance = 1
    for (col in (row+1):length(combination) ){
      # check if the queen of other row which is at different column attack each other
      if((abs(combination[row]-combination[col]) == distance)||combination[row]==combination[col]){
        # set killed to TRUE if the queens attack each other
        killed=TRUE
        break
      }
      # increment the distance by 1 to check the queen of current row against the queen from the next row   
      distance=distance + 1
    }
    # if queen is killed, return FALSE
    if(killed==TRUE){
      return(FALSE)
    }
  }
  if (killed==FALSE){
    # if queen is not killed after checking all rows, return TRUE
    return(TRUE)
  }
}

#loop through levels of tree
for(level in 1:N) {
  print(sprintf("Level %d",level))
  # loop through all nodes at the level
  for(node in 1:numberOfNode){
    # integer to be appended into possible combination 
    for(i in 1:N){
      # append i to existing combination 
      temp<-list.append(comb[[1]],i)
      # pass possible combination to the checkKilled function to check if the queens do not kill each other in the positions
      if(checkKilled(temp)){
        # if the combination works, append it to the combination list 
        comb<-list.append(comb,unique(temp))
        # increment the numberOfNode
        numberOfNode = numberOfNode + 1
      }
    }
    print(comb[1])
    # dequeue the list of combination
    comb[1]<-NULL
    # decrement the numberOfNode
    numberOfNode = numberOfNode - 1
    #rmb to update numberOfNode
  }
}