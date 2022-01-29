#Importing the CSV

getwd()
setwd("C:\\Users\\hardi\\Downloads")
#Creating a data frame to input the data

mov <- read.csv("Section6-Homework-Data.csv")

#Data Exploration (Make a habit to do this everytime you import dataset)

head(mov)
tail(mov)
str(mov)
summary(mov)

#Filter out the columns as you do not need all of them

filt <- (mov$Genre == "action") | (mov$Genre == "animation") |
  (mov$Genre == "adventure") | (mov$Genre ==  "comedy") | 
  (mov$Genre ==  "drama")

#Filter for the production houses that are shown in the boxplot

filt2 <- mov$Studio %in% c("Buena Visa Studios", "WB", "Fox",
                           "Universal", "Sony", "Paramount Pictures")

filt2

mov2 <- mov[filt & filt2,]
mov2


#Plots and Aes layer

library(ggplot2)

p <- ggplot(data= mov2, aes(x=Genre, y=Gross...US))

q<- p + geom_jitter(aes(size=Budget...mill.,
                    colour=Studio)) + 
  geom_boxplot(alpha=0.7, outlier.color = NA)

#Non data ink ( Naming the X and Y Axes )

q<- q + 
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % By Genre")
q

#Theme
q <- q +
  theme(
    axis.title.x =  element_text(colour ="Blue", size= 20),
    axis.title.y  =  element_text(colour ="Blue", size= 20),
    axis.text.x =  element_text(size= 20),
    axis.text.y =  element_text(size= 20),
    
    
    plot.title = element_text(size=40),
    legend.title = element_text(size=20),
    legend.text = element_text(size=20),
  
    text = element_text(family= "Comic Sans MS")
  )

q










