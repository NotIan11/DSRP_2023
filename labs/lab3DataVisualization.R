read.csv("Data/StudentsPerformance.csv")
studentdata <- read.csv("Data/StudentsPerformance.csv")
View(studentdata)
library(ggplot2)

ggplot(data=studentdata, aes(x=math.score))+
  geom_histogram(bins=50,color="white",fill="black")+
  labs(title="Distribution of Math Scores",
       x="Math Scores",
       y="Frequency")+
  theme_minimal()

ggplot(data=studentdata, aes(x=parent, y=reading.score))+
  geom_violin(aes(color="black",fill=parent))+
  geom_boxplot(width=0.2)+
  labs(title="Distribution of Student Reading Scores with Respect to Parental Education",
       x="Parental Level of Education",
       y="Reading Score")
  scale_color_manual(values=c("red","orange","yellow","green","blue","purple"))

  studentdata$parental.level.of.education <- factor(studentdata$parental.level.of.education,
                                                  levels = c("some high school","high school","some college","associate's degree","bachelor's degree","master's degree"))
parent<- studentdata$parental.level.of.education

ggplot(data=studentdata, aes(x=math.score, y=writing.score))+
  geom_point()+
  geom_smooth(se=F)+
  labs(title="Relationship Between Math Score and Writing Score",
       x="Math Score",
       y="Writing Score")
  
