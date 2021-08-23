x <- rnorm(5)
x

#R-specific loop - access value directly
for (i in x) {
  print(i)
}

print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

#conventional programming loop - access element via index
for (j in 1:5) {
  print(x[j])
}


#### Vectorized vs De-vectorized Operations ####
N <- 100
a <- rnorm(N)
b <- rnorm (N)

#Vectorized approach (shorter code and computes faster)
c <- a *b

#De-vectorized approach
d <- rep(NA, N)           #allocate memory but w/ no elements
for (i in 1:N) {
  d[i] <- a[i] * b[i]
}