#------- IMPORT DATA -------- 
#Get documentation 
?read.csv()

#Method 1: Select the file manually
stats <- read.csv(file.choose())

#Method 2 (more commom): Set working directory and read data
getwd()
setwd("C:/Users/emily/OneDrive/Desktop/R Programming/Data Frames")

rm(stats)

stats <- read.csv("Demographic-Data.csv")

stats



#------- EXPLORING DATA FUNCTION ----------
nrow(stats)
ncol(stats)
head(stats, n=10)   #default rows = 6
tail(stats, n=8)    #default rows = 6
str(stats)
summary(stats)


#------- USING $ SIGN ----------
#ways to access data
stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]

stats$Internet.users       #Extracts the Internet user col
stats[,"Internet.users"]   #Identical command but wordier
stats$Internet.users[2]    #Get second row value of Internet user col

levels(stats$Income.Group) #Common way to use $ - to see what the levels are of a column


#------------ BASIC OPERATIONS WITH DF ------------ 
#subsetting
stats[1:10]  
stats[3:9,]
stats[c(4,100),]

#remember how the [] works
#Extracted single row is still data frame 
is.data.frame(stats[1,])            #no need for drop=F
#Extraced single col becomes a vector 
is.data.frame(stats[,1])
is.vector(stats[,1])
is.data.frame(stats[,1,drop=F])     #need to include drop=F
#Operations w/ columns
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
#add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
#knowledge check
stats$xyz <- 1:5                   #no error - vector recycling b/c new vector is multiple of 195
#remove column 
stats$MyCalc <- NULL               #fast and easiest way!
stats$xyz <- NULL


#--------- FILTERING DATA FRAMES -------------
#filtering happens on rows
filter <- stats$Internet.users < 2     #creates T/F vector
stats[filter,]                         #passing in T/F vector will show only T
#no need to create object! just pass it in
stats[stats$Birth.rate > 40, ]
#compound filter conditions
stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]
#filter by categorical groups
stats[stats$Income.Group == "High income",]
#check levels
levels(stats$Income.Group)
#search for row
stats[stats$Country.Name == "Malta", ]
