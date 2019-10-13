# AI_Assignment
Consists of my solution for N-Queens Problem which utilises BFS and Vacation Problem which utilises Genetic Algorithm

## N-Queens Problem
### Bread First Search Solution
• In the BFS solution, a queue is implemented using a list. \
• First, the queue is initialised with N number of lists as the possible
positions of the queens at the first row. \
• The queue is then enqueued with the next possible positions which
includes the positions of the queens on the subsequent row. \
• The same step is performed until it reaches the last level and the last
number of node available at the last level. 

### Genetic Algorithm Solution
• The fitness function only returns 2 possible scores namely 0 and 1. \
• If the combination is not a solution, the fitness function returns 0. If the combination is a solution, the fitness function returns 1. \
• The combination is checked for solution by making sure the queens do not attack each other by diagonal attacks. \
• Row attack is non-existent in the combination due to the unique number in the combination (i.e., the column each queen occupies on each row). \
• Column attack is also non-existent in the combination due to every number in the combination represents the position of the queen on different rows.

#### Checking for diagonal attacks (Fitness Function):
• If any of the queens in the combination is diagonal to each other, the fitness
function returns 0. \
• Diagonal attack checking is done row by row (d). \
• Thus, the time complexity is O(n^2)\
![NQueensGAFitnessFunction](https://github.com/jacklynlxq/AI_Assignment/blob/master/images/NQueenFitnessFunction.PNG)

## Vacation Problem

In this section, we are expected to solve a vacation planning problem using Genetic Algorithm using the following
criteria. The goal is to optimize your vacation experience with fixed amount of money.\
(i) you have a fixed amount of money. You can define your own limit.\
(ii) you can stay in hotels with any star.\
(iii) you can eat food of any price.\
(iv) you can visit as many tourist spots as you want.\
(v) you can travel in any kind of transportation you preferred.\

In the program, the user can load a dataframe which consists of the package of the offered options.\

The following is an example of an expected user input.\

Data frame loaded (per day):
![vacationProblemDataframe](https://github.com/jacklynlxq/AI_Assignment/blob/master/images/vacationProblemDataframe.PNG)

Amount of money: 20,000\
Lower boundary of combination = (1,1,1,1)\
(i.e.: Hotel: 50 bucks, Food: 100 bucks, TouristSpot: 100 bucks, KindOfTransportation: 10 bucks)\
Upper boundary of combination = (4,6,6,6) - User wants to pay less for hotel\
(i.e.: Hotel: 400 bucks, Food: 500 bucks, TouristSpot: 250 bucks, KindOfTransportation: 50 bucks)\
Population Size = 500\

The following shows the summary of the result of the genetic algorithm\
![vacationProblemGAExample](https://github.com/jacklynlxq/AI_Assignment/blob/master/images/vacationProblemGAExample.PNG)

The best solution found is a combination of [3, 5, 5, 5]. \
(i.e.: Hotel: 200 bucks, Food: 500 bucks, TouristSpot: 250 bucks, KindOfTransportation: 50 bucks)\
The amount added from this combination is 1070, which is the highest possible amount closest to 20,000. \
The possible number of vacation days according to this combination is 18 as returned by the program.\
The following graph shows the fitness value of the generated solutions each generation
![vacationProblemGAResult](https://github.com/jacklynlxq/AI_Assignment/blob/master/images/vacationProblemGAResult.PNG)
