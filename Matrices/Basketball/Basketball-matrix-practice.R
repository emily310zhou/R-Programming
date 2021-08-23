#Create matrix using matrix()
#bends vector into matrix in specified orientation
my_data <- 1:20
A <- matrix(my_data, 4, 5)     #bend by col
A
A[2,3]

B <- matrix(my_data, 4, 5, byrow=TRUE)     #bend by row
B
B[2,5]


#Create matrix using rbing()
#binds vectors row by row
r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1,2,3)

C <- rbind(r1,r2,r3)
C

#1,2,3 gets turned into char b/c you can't mix data types in matrix (like in vectors)
#can turn numbers into strings but not vice versa

#Create matrix using cbing()
#binds vectors col by col
D <- cbind(r1,r2,r3)
D
