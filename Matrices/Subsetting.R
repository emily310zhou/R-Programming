#THESE SUBSETS ARE MATRICES
#Get subset of Games matrix for first three players for the last 5 years
Games[1:3,6:10]

#compare first and last player across all years
Games[c(1,10),]

#compare players for 2008 and 2009
Games[,c("2008","2009")]


#NOT MATRICES BUT (named) VECTOR
Games[1,]
Games[1,5]

is.matrix(Games[1,])    #false
is.matrix(Games[1,5])   #false

is.vector(Games[1,])    #true
is.vector(Games[1,5])   #true

#Set drop = FALSE to retain subset as matrix
#in this case, it retains the row name
Games[1,,drop=F]
Games[1,5,drop=F]


#VISUALIZING SUBSETS

#for first 3 players across all years
Data <- MinutesPlayed[1:3,]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4,6), pch=15:18, horiz=F)

#for just Kobe Bryant
Kobe <- MinutesPlayed[1,,drop=F]
matplot(t(Kobe), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)


