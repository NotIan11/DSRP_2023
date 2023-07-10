2+2
## arrows give objects values
number <-5
number
number +1
number <- number+1

#this is a comment
number <- 10 # set number to 10

# R Objects ####
number <- 5
ls() # print the names of all objects in our environment
rm("number") #removes objects
decimal <- 1.5
letter <- "a"
word <- "hello"

logic <- TRUE
logic2 <- F

## types of variables
## there are 3 main classes: numeric, character, logical
class(number) #numeric
class (decimal)

class(letter) #character
class(word)

class(logic) #logical

##there is more variation in types
typeof(number)
typeof(decimal)

## we can change the type of an object
as.character(number)
as.character(letter)
as.integer(number)
as.integer(decimal)

##how to round numbers
round(decimal) #adheres to mathematical rounding rules
round(22/7,3) #round to 3 places after decimal point
?round

ceiling(22/7) #ceiling always rounds up
floor(22/7) #floor always rounds down

?as.integer
word_as_int <-as.integer("hello")

##NA Values
NA +5

## naming
name <- "Sarah"
NAME <- "Joe"
n.a.m.e. <- "Sam"
n_a_m_e <- "Lisa"

## illegal naming characters:
#starting with a number
#starting with an underscore
#operators: + - / * 
#conditionals: & | < > !
#others: \ , space, $

##good naming conventions
camelCase <- "start with capital letters"
snake_case <- "underscores between words"

# Object manipulation ####
number
number +7

decimal
number + decimal

name
paste(name,"Parker") # concatenates character vectors 
paste(name, "Parker is awesome")
paste0(name,"Parker") #no spaces

paste(name,number) # we can join together characters and numbers
paste0(name,logic)

letter
word1 <- "sentences"
paste(word1,camelCase)

?grep
food <- "watermelon"
grepl("me",food) #T or F, is the pattern in the character object?

##substituting characters in words
sub("me", "you",food)
sub("me", "", food)






# Vectors ####
# make a vector of numerics
numbers <-c(2,4,6,8,10)
range_of_vals <- 1:10 #all integers from 1 to 10
5:10 #all integers from 5 to 10

seq(2,10,2) #from 2 to 10 by 2's
seq(by =2, to=10, from=2) #can put parameters out of order if they are named
seq(1,11,2) #odd numbers from 1 to 11

rep(3,5) #repeat 3 5x
rep(c(1,2),5) # repeats 1,2 5x

#how can we get all the values between a and 5 by 0.5?
seq(1,5,0.5)

#how can we get [1 1 1 2 2 2]?
c(rep(1,3),rep(2,3))
rep(1:2, each=3)

# make a vector of characters
letters <- c("a","b","c")
paste("a","b","c") # paste() is different from c()

letters <-c(letters, "d")
letter
letters <- c(letters, letter)

#make a vector of random numbers between 1 and 20
numbers <- 1:20
five_nums <- sample(numbers,5) #choose 5 values from the vector numbers

five_nums <-sort(five_nums)
rev(five_nums)

fifteen_nums <- sample(numbers,15,replace=T)
fifteen_nums<-sort(fifteen_nums)
length(fifteen_nums) #length of a vector
unique(fifteen_nums) # what are the unique values in the vector

#how do we get the number of unique values?
length(unique(fifteen_nums))

table(fifteen_nums) #get the count of unique values in the vector

fifteen_nums +5
fifteen_nums/2

nums1<-c(1,2,3)
nums2<-c(4,5,6)
nums1 +nums2 #values are added together element-wise

nums3 <- c(nums1,nums2)
nums3+nums1 #values are recycled to add together
nums3+nums1+1

#what is the difference between these?
sum(nums3+1)
sum(nums3)+1

# Vector indexing
numbers <-rev(numbers)
numbers
numbers[1]
numbers[5]

numbers[c(1,2,3,4,5)]
numbers[1:5]
numbers[c(1,5,2,12)]
i<-5
numbers[i]

#Datasets ####
?mtcars
mtcars #print entire dataset to console

View(mtcars) #View entire dataset in a new tab

summary(mtcars) #gives us information about the spread of each variable
str(mtcars) #preview the structure of the dataset

names(mtcars) #names of variables
head(mtcars,10) #preview the first n rows

## Pull out individual variables as vectors
mpg<- mtcars[,1] #blank means "all". All rows, first column
mtcars[2,2] #value at second row, second column
mtcars[3,] #third row, all columns

#first 3 columns
mtcars[,1:3]

#use the names to pull out columns
mtcars$gear #pull out the "gear" column
mtcars[,c("gear","mpg")] #pull out the gear and mpg columns

sum(mtcars$gear)



# Statistics ####
iris
View (iris)

first5 <- iris$Sepal.Length[1:5]
mean(first5)
mean(iris$Sepal.Length)

median(first5)
median(iris$Sepal.Length)

max(first5) - min(first5)
range(first5)
max(iris$Sepal.Length)-min(iris$Sepal.Length)

var(first5)
var(iris$Sepal.Length)

sd(first5)
sd(iris$Sepal.Length)

#IQR
IQR(first5)
IQR(iris$Sepal.Length)
quantile(first5,0.25) #Q1
quantile(first5,0.75) #Q3

mean(iris$Sepal.Length)+3*(sd(iris$Sepal.Length))

sl <- iris$Sepal.Length
lower <- mean(sl) - 3*sd(sl)
upper <- mean(sl) + 3*sd(sl)

## subsetting vectors
first5
first5 < 4.75
first5[first5<4.75]

values <- c(first5,3,9)
upper
lower

#removes outliers
values[values>lower & values<upper] # keep values lower than upper and higher than lower 

## read in data
getwd() #get working directory
super_data <- read.csv("Data/super_hero_powers.csv")

## We can test all values of a vector at once

numbers <- 1:5
numbers <3
numbers == 3

numbers[1]
numbers[c(1,2)]
numbers[1:2]

numbers[numbers<3] #numbers "where" numbers < 3

# outlier thresholds

lower <- 2
upper <- 4

#pull out only outliers
numbers[numbers<lower]
numbers[numbers>upper]

#combine with | (or)
numbers[numbers<lower|numbers>upper]

# use & to get all values between outlier thresholds
numbers[numbers>=lower & numbers<=upper]

# using & with outlier thresholds doesn't work
numbers[numbers<lower&numbers>upper]


## NA values
NA #unknown
NA +5

sum(1,2,3,NA) #returns NA if any value is NA
sum(1,2,3,NA,na.rm=T) #removes NA values

mean(c(1,2,3,4,5,NA),na.rm=T)






