#plot transposed matrix (transposed meaning rows and cols switch places on matrix)
#transpose using t(matrixName)

FieldGoals
t(FieldGoals)

#How many goals over seasons
?matplot()
matplot(t(FieldGoals), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

#Accuracy of shots
matplot(t(FieldGoals / FieldGoalAttempts), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)
