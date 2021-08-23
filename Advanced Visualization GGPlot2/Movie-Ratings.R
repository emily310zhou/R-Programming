getwd()
setwd("C:/Users/emily/OneDrive/Desktop/R Programming/Advanced Visualization GGPlot2")

#import data
movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)

#change column names for easier read
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

#high level overview of data
str(movies)
summary(movies)

#convert Year to factor (categorical var) since it's currently numeric
#reassign factored Year to the data frame
factor_Year <- factor(movies$Year)
movies$Year <- factor_Year

str(movies)       #now says "factor w/ 5 levels" 



#------------------- AESTHETICS ---------------------
#toggle on ggplot2 package
library(ggplot2)

#ggplot() is the more heavy duty plotting function when you want more capabilities
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry layer
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

#add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre)) +
  geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre,
                        size=BudgetMillions,
                        alpha=I(.5))) +
  geom_point()


#------------------PLOTTING W/ LAYERS---------------------
#to add layer, you have to literally "+" it to the ggplot object

plot <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                                color=Genre, size=BudgetMillions,
                                alpha=I(.5))) 
#points
plot + geom_point()

#lines
plot + geom_line()

#multiple layers
plot + geom_line() + geom_point()


#------------------OVERRIDING AESTHETICS---------------------
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                              color=Genre, size=BudgetMillions,
                              alpha=I(.5)))

#add geom layer - inherits aesthetics from q object
q + geom_point()

#override layers - does not change q itself
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(color=BudgetMillions))

#ex3 - change x axis label too
q + geom_point(aes(x=BudgetMillions)) + xlab("BudgetMillions")

#ex 4 - setting example (w/o aes() function)
q + geom_line(size=1) + geom_point()


#------------------MAPPING VS SETTING---------------------
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add Color
#1. Mapping (what we've done so far): 
r + geom_point(aes(color=Genre))
#2. Setting (using the actual meaning of DarkGreen to change aesthetic color parameter)
r + geom_point(color="DarkGreen")
#3. ERROR (ggplot will think you want to map to variable called DarkGreen): 
#r + geom_point(aes(color="DarkGreen")

#1. Mapping
r + geom_point(aes(size=BudgetMillions))
#2. Setting
r + geom_point(size=7)
#3. ERROR
#r + geom_print(aes(size=7))


#------------------HISTOGRAM AND DENSITY CHARTS---------------------
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#Setting bin color (don't want this)
#s + geom_histogram(binwidth = 10, fill = "Purple")

#Map color according to genre
s + geom_histogram(binwidth = 10, aes(fill=Genre))
#Add border (via setting) for better contrast in bars
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

#Sometimes you may want to see probability density chart
s + geom_density()
s + geom_density(aes(fill=Genre), position="stack")


#------------------STARTING LAYER TIPS---------------------
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill = "White", color="Blue")

#more flexible method - good if you need to experiment or need to visualize many things
#not good to override too much if you set aes when you create plot object and need to change later frequently
t <- ggplot(data=movies)    #don't set aesthetics yet

t + geom_histogram(aes(x=AudienceRating),binwidth = 10,fill = "White", color="Blue")
t + geom_histogram(aes(x=CriticRating),binwidth = 10,fill = "White", color="Blue")

#even more flexibility - empty skeleton plot to be modified later
# t <- ggplot()

#------------------STATISTICAL TRANSFORMATION---------------------
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,color=Genre))

#add smooth layer w/ no fill
u + geom_point() + geom_smooth(fill=NA)

#boxplots
v <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
v + geom_boxplot(size=1)

#combine layers
v + geom_boxplot(size=1) + geom_jitter()

#another way - points below box plots, change transperency f boxplot to see
v + geom_jitter() + geom_boxplot(size=1, alpha=0.5)


#------------------USING FACETS---------------------
w <- ggplot(data=movies, aes(x=BudgetMillions))
w + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

#facets:
#use (row~col) - use xxx~. so facets oriented by rows
#set scales = "free" so each row have own y-scale
w + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") +
  facet_grid(Genre~., scales="free")

#facets on scatterplots
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))

w + geom_point(size=1) + facet_grid(Genre~.)
w + geom_point(size=1) + facet_grid(.~Year)
w + geom_point(size=1) + facet_grid(Genre~Year)                   #dices the data - look at two dimensions
w + geom_point(aes(size=BudgetMillions)) + facet_grid(Genre~Year) #map size to budget to include budget comparison

#this is the one we want (needs to be zoomed in - seem coordinate section)
w + geom_point(aes(size=BudgetMillions)) + facet_grid(Genre~Year) + geom_smooth()   #add smooth layer


#------------------COORDINATES---------------------
m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))
m + geom_point()

#add limits
m + geom_points() + xlim(50,100) + ylim(50,100)

#xlim and ylim won't always work well - will cut out necessary data as in this case
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black")
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black") +      
  ylim(0,50)  #will cut out data above 50

#instead, zoom is better option and data preserved
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black") +
  coord_cartesian(ylim = c(0,50))
  
#let's fix ploy w to show ylim from 0 to 100 (see previous section)
w + geom_point(aes(size=BudgetMillions)) + facet_grid(Genre~Year) + 
  geom_smooth(fill=NA) + coord_cartesian(ylim = c(0,100))
  
#------------------ADDING THEMES (non-data ink)---------------------
o <- ggplot(data=movies, aes(x=BudgetMillions))

#save it into an object
h <- o +  geom_histogram(binwidth = 10, aes(fill=Genre), color="black")

#add labels
h + xlab("Budget in Millions") + ylab("Number of Movies")

#axes labeling
h + xlab("Budget in Millions") + ylab("Number of Movies") +
    theme(axis.title.x = element_text(color="DarkGreen", size=30)) +
    theme(axis.title.y = element_text(color="Red", size=30)) 

#tick mark formating (increase size)
h + xlab("Budget in Millions") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red", size=30),
        
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20)) 

#what else can you add to theme?
?theme()

#legend formatting - size and position
h + xlab("Budget in Millions") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))    #position top right corner of legend in top right corner of plot

#add title
h + xlab("Budget in Millions") + 
    ylab("Number of Movies") +
    ggtitle("Movie Budget Distribution") +  #add title here
    theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color="DarkBlue",
                                  size=40,
                                  family="mono"))   
        