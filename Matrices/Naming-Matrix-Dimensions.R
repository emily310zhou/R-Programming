#Named Vectors
Emily <- 1:6

#Give names
names(Emily) <- c("a","b","c","d","e","f")

#Print Names
Emily
Emily["b"]
names(Emily)

#Clear names from named vector
names(Emily) <- NULL



##Naming Matrix Dimensions I

temp_vector<- rep(c("a","B","zZ"), each=3)

#turn vector into matrix
temp_matrix <- matrix(temp_vector,3,3)

#give matrix names
rownames(temp_matrix) <- c("How","are","you")
colnames(temp_matrix) <- c("X", "Y", "Z")
temp_matrix

#change value in matrix using index names
temp_matrix["How","Z"] <- "eE"
temp_matrix

#clear names
#rownames(temp_matrix) <- NULL
#colnames(temp_matrix) <- NULL
