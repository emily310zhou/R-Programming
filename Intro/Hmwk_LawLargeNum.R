#Test the Law of Large Nums for N random normally
#distributed numbers with mean=0 , stdev=1

N <- 1000                  #specify sample size
counter <- 0               #reset counter

for (i in rnorm(N)) {      #iterate over vector of #
  if (-1 <= i && i <= 1) { #check where iterated variables falls
    counter <- counter + 1 #increase counter if condition is met
  }
}

answer <- counter / N      #calculate hit-ratio

answer                     #print answer in console

