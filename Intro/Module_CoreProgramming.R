##### DATA TYPES #######

#integer
x <- 3L
#double
y <- 2.5
#complex
z <- 3 + 2i
#character 
k <- "h"
#logical
d <- TRUE


##### USING VARIABLES #####
A <- 10
B <- 5
C <- A + B

var1 <- 2.5
var2 <- 4

greeting <- "Hello"
name <- "Emily"
message <- paste(greeting, name)

result <- var1 / var2
answer <- sqrt(var2)

#to print
C
result 
answer
message


#### LOGICAL VARIABLS AND OPERATORS ######
4 < 5
10 > 100
4 == 5

result1 <- 4<5    #true
result2 <- !TRUE  #false
result1 | result2 #true OR false
result1 & result2 #true AND false
isTRUE(result1)   #is variable true? 


#### WHILE LOOP ######
counter <- 1
while (counter < 12) {
  print(counter)
  counter <- counter + 1
}


#### FOR LOOP ######
for(i in 1:5) {
  print("Hello R!")
}




#### IF STATEMENTS #####
rm(answer)         #remove  if exists
x <- rnorm(1)      #get normally distributed random

if (x > 1) {
  answer <- "Greater than 1"
} else if (x >= -1) {
  answer <- "Between -1 and 1"
} else {
answer <- "Less than -1"
}