##install required packages
#install.packages("ggplot2")
install.packages(c("usethis","credentials"))

## load required packages
library(ggplot2)

## mpg dataset
str(mpg)
?mpg

ggplot(data =mpg, aes(x = hwy, y = cty)) +
  geom_point()+
  labs(x = "highway mpg", 
       y= "city mpg",
       title = "car city vs highway milage")
##histograms
# WE can set the number of bars with 'bins'
ggplot(data = mpg, aes(x = hwy))+
  geom_histogram()

ggplot(data =iris, aes(x=Sepal.Length))+
  geom_histogram(bins = 40) #default number of bins is 30

#We can set the size of bars with 'binwidth'
ggplot(data =iris, aes(x=Sepal.Length))+
  geom_histogram(binwidth = 0.25)+
  labs(title="Frequency of Iris Sepal Lengths",
       x="Sepal Length",
       y="# of Petals")

## density plots
ggplot(data = mpg, aes(x=hwy, y= after_stat(count)))+
  geom_density()

ggplot(data=iris,aes(x=Sepal.Length,y=after_stat(count)))+
  geom_density()+
  labs(title="Frequency of Iris Sepal Lengths",
       x="Sepal Length",
       y="density")

##boxplots
ggplot(data=mpg, aes(x=hwy))+
  geom_boxplot()

ggplot(data=iris,aes(x=Sepal.Length))+
  geom_boxplot()+
  labs(title="Iris Sepal Lengths",
       x="Sepal Lengths")

ggplot(data=iris, aes(y=Sepal.Length))+
  geom_boxplot()

ggplot(data=iris, aes(x=Sepal.Length, y=Species))+
  geom_boxplot()

#violin plots
ggplot(data=iris, aes(x=Species,y=Sepal.Length))+
  geom_violin(color="violet", fill="grey")+
  geom_boxplot(width=0.2, fill=NA)+
  labs(title="Distribution of Iris Sepal Lengths by Species",
       x="Species",
       y="Sepal Length")

ggplot(data=iris, aes(x=Species,y=Sepal.Length,))+
  geom_violin(aes(fill=Species))+
  geom_boxplot(width=0.2)+
  labs(title="Distribution of Iris Sepal Lengths by Species",
       x="Species",
       y="Sepal Length")

#bar plots
ggplot(data=mpg, aes(x=class))+
  geom_bar()

ggplot(data=mpg,aes(x=class, y=hwy))+
  geom_bar(stat="summary",
           fun="mean")

ggplot(data=iris, aes(x=Species, y=Sepal.Length, fill=Species))+
  geom_bar(stat="summary",
           fun="mean")

#Scatter Plots
ggplot(data=mpg, aes(x=hwy, y=cty))+
  geom_point()

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()

ggplot(data=iris, aes(x=Species, y=Sepal.Length))+
  geom_point()

ggplot(data=iris, aes(x=Species, y=Sepal.Length))+
  geom_jitter(width=0.1)

ggsave("Plots/exampleJitter2.png")

#point for numeric vs numeric, jitter for numeric vs categorical

#Line Plots
ggplot(data=mpg, aes(x=hwy, y=cty))+
  geom_line(stat="summary",
            fun="mean")

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_line(stat="summary",
            fun="mean")

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()

##color scales
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point(aes(color=Species))+
  scale_color_manual(values=c("blue","red","green"))
  
##factors
mpg$year <- as.factor(mpg$year)

iris$Species <- factor(iris$Species, levels=c("versicolor", "setosa", "virginica")) 
  
  
  
  
  
  
  


