#Encapsulate code to plot matrix
#set default values for parameters

myPlotFunction <- function(data,rows=1:10) {
  Data <- data[rows,,drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
  
}

#Salary
myPlotFunction(Salary)
myPlotFunction(Salary / Games)
myPlotFunction(Salary / FieldGoals)

#In-Game Metrics
myPlotFunction(MinutesPlayed)
myPlotFunction(Points)

#In-Game Metrics Normalized
myPlotFunction(FieldGoals / Games)
myPlotFunction(FieldGoals / FieldGoalAttemps)
myPlotFunction(FieldGoalAttempts / Games)
myPlotFunction(Points / Games)

#Interesting Observation
myPlotFunction(MinutesPlayed / Games)
myPlotFunction(Games)

#Time is valuable
myPlotFunction(FieldGoals / MinutesPlayed)

#Player Style
myPlotFunction(Points / FieldGoals)



