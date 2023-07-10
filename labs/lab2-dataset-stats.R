read.csv("Data/StudentsPerformance.csv")
student_data <-read.csv("Data/StudentsPerformance.csv")
View(student_data)

mathdata <- student_data$math.score

mean(mathdata)
median(mathdata)
max(mathdata)-min(mathdata)
var(mathdata)
sd(mathdata)
IQR(mathdata)

lower <- mean(mathdata)-3*sd(mathdata)
upper <- mean(mathdata)+3*sd(mathdata)
values <- c(mathdata)
values[values>lower & values<upper]

newvalues <-values[values>lower & values<upper]

mean(newvalues)
median(newvalues)
