#PLOT DOMESTIC GROSS % BY GENRE BOXPLOT

#import and read data
getwd()
setwd("C:/Users/emily/OneDrive/Desktop/R Programming/Advanced Visualization GGPlot2")
data <- read.csv("Section6-Homework-Data.csv")
""
#data exploration
head(data)
summary(data)
str(data)

#filter data frame to get rows with specified column values
genre_filter <- (data$Genre == "action") | (data$Genre == "adventure") | (data$Genre == "animation")|(data$Genre == "comedy") | (data$Genre == "drama")
studio_filter <- data$Studio %in% c("Beuna Vista", "Fox", "Sony", "Universal", "WB", "Paramount Pictures")

data_filtered <- data[genre_filter & studio_filter,]

#See that spaces and symbols in nmaes are substitued with ...
colnames(data_filtered)
data_filtered

#plot the data and geometries
library(ggplot2)
plot <- ggplot(data=data_filtered, aes(x=Genre, y=Gross...US))
geom_plot <- plot + geom_jitter(aes(color=Studio, size=Budget...mill.),alpha=.5) + geom_boxplot(alpha=.5, outlier.color=NA) 

geom_plot

#add non-data ink
final_plot <- geom_plot + 
              xlab("Genre") + 
              ylab("Gross % US") + 
              ggtitle("Domestic Gross % by Genre") +
              coord_cartesian(ylim=c(0,80)) + 
              theme(axis.title.x = element_text(color="blue",size=20),
                    axis.title.y = element_text(color="blue",size=20),
                    axis.text.x = element_text(size=10),
                    axis.text.y = element_text(size=10),
                    
                    plot.title = element_text(size=30),
                    
                    legend.title = element_text(size=10),
                    legend.text = element_text(size=10),
                    
                    text = element_text(family="mono"))

#change lBudget legend title
final_plot$labels$size <- "Budget $M"

#view final plot
final_plot
