#DOUBLE VECTOR
MyFirstVector <- c(3, 45, 56, 732)        #use c() combine fxn to group #s together
MyFirstVector                             #print vector
is.numeric(MyFirstVector)                 #is vector numeric?
is.integer(MyFirstVector)                 #NOT integer type
is.double(MyFirstVector)                  #R store # as double unless specifically told otherwise

#INTEGER VECTOR
V2 <- c(3L, 56L, 78L, 145L)
is.numeric(V2)               
is.integer(V2)                 
is.double(V2) 

#CHARACTER VECTOR
V3 <- c("Pizza", "is", "the", "best" )
is.character(V3)
is.numeric(V3)

#STILL A CHARACTER NUMBER - 12 GETS CONVERTED
V4 <- c("Favorites", "number", "is", 12)

#SEQUENCE FUNCTION
V5 <- seq(1,20,2)

#REPLICATE FUNCTION
v6 <- rep(3,10)

V7 <- c(1,2,3,4,5)
V8 <- rep(V7)
