getwd()
setwd("C:\\Users\\hardi\\Downloads")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
tail(movies)

str(movies)
summary(movies)



colnames(movies) <- c("Film", "Genre", "CriticRating",
                      "AudienceRating", "BudgetMillions",
                      "Year")
str(movies)


# Aes

ggplot(data= movies, aes(x=CriticRating, y=AudienceRating))


# Geom
ggplot(data= movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

# Colour
ggplot(data= movies, aes(x=CriticRating, 
                         y=AudienceRating,
                         colour= Genre)) + 
  geom_point()

#Size
ggplot(data= movies, aes(x=CriticRating, 
                         y=AudienceRating,
                         colour= Genre,
                         size= BudgetMillions))+
  geom_point()

#

p <- ggplot(data= movies, aes(x=CriticRating, 
                              y=AudienceRating,
                              colour= Genre,
                              size= BudgetMillions))



p + geom_line(size=1) + geom_point()


p + geom_point(aes(x=BudgetMillions))+
  xlab("Budget in Millions") #This is for naming the x axis


q <- ggplot(data=movies, aes(x=BudgetMillions))
q + geom_histogram(binwidth = 10, aes(fill=Genre), colour =
                     "Black")


#Density Type of Chart
q + geom_density(aes(fill=Genre), position ="stack")
##End



s <- ggplot(data=movies, aes(x=AudienceRating))
s + geom_histogram(binwidth = 10, 
                   fill="White", colour="Blue")


s + geom_histogram(binwidth = 10, 
                   aes(x=CriticRating),
                   fill="White", colour="Blue")

## smooth function


t <- ggplot(data=movies, aes(x=CriticRating,
                             y=AudienceRating,
                             colour= Genre))
t + geom_point() + geom_smooth(fill=NA)





#Boxplot

u <- ggplot(data= movies, aes(x=Genre, y=CriticRating,
                              colour = Genre))
u + geom_boxplot(size=1.2) + geom_jitter()



q <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, colour=Genre))
q + geom_histogram(binwidth = 10, 
                   aes(fill=Genre), 
                   colour ="Black"))

#Use of Facets


q + geom_histogram(binwidth = 10, 
                   aes(fill=Genre), 
                   colour ="Black") +
  facet_grid(Genre~., scales = "free")


q + geom_point(size=1.2) + 
  facet_grid(Genre~Year)


q + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))


