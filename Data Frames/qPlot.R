#------------ INTRO TO QPLOT() ------------------
#incorporate package
library(ggplot2)

#get documentation
?qplot

#Must wrap I() around number/string literals
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group , y=Birth.rate)
qplot(data=stats, x=Income.Group , y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group , y=Birth.rate, size=I(3),
      colour=I("blue"))
qplot(data=stats, x=Income.Group , y=Birth.rate, geom="boxplot")
    

#------------ VISUALIZING WITH QPLOT I (with stats df) ----------------
#simple scatter plot
qplot(data=stats, x=Internet.users, y=Birth.rate)   
#increase size of data points
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4))   
#make data points red color
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4),
      color=I("red"))   
#categorize data points by Income.Group
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4),
      color=Income.Group)

#takeaway: as you transition from low to high income country, 
#internet usage increases and birth rate decreases


#------------ VISUALIZING WITH QPLOT II (with merged df) --------------
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region)

#1. Data point shapes - use shapes; check out R shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region,
      size=I(5), shape=I(2))

#2. Transparency - use alpha; 0 is fully transparent, 1 is fully opaque
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region,
      size=I(5), shape=I(19), alpha=I(.5))

#3. Title - use main 
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region,
      size=I(5), shape=I(19), alpha=I(.5), main="Birth Rate vs Internet Users")
