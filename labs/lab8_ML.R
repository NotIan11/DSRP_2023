## load required packages
library(ggplot2)
library(dplyr)
library(reshape2)
library(rsample)
library(parsnip)
library(yardstick)
library(Metrics)

## Step 1: Collect Data
studentdata <- read.csv("Data/StudentsPerformance.csv")

## Step 2: Clean and Process Data

studentsAllNum <- mutate(studentdata,
                         gender = as.integer(as.factor(gender)),
                         race = as.integer(as.factor(race.ethnicity)),
                         parent_edu = as.integer(as.factor(parental.level.of.education)),
                         lunch = as.integer(as.factor(lunch)),
                         test_prep = as.integer(as.factor(test.preparation.course)))

studentsAllNum <- select(studentsAllNum, gender, race, parent_edu, lunch, test_prep, math.score, writing.score, reading.score)

## Step 3: Visualize Data:

studentCors <- studentsAllNum |>
  cor()|>
  melt()|>
  as.data.frame()

ggplot(studentCors, aes(x=Var1, y=Var2, fill=value))+
  geom_tile()+
  scale_fill_gradient2(low="red", high="blue", mid="white",
                      midpoint = 0)

ggplot(studentsAllNum, aes(x=math.score, y=reading.score))+
  geom_point()+
  theme_minimal()

## Step 4: Perform Feature Selection
# Predict on math.score


## Step 5: Separate Data into Training and Testing Sets
set.seed(071723)

reg_split <- initial_split(studentsAllNum, prop=0.80)

reg_train <- training(reg_split)
reg_test <- testing(reg_split)

## Step 6 and 7: Create and Train ML Model
lm_fit <- linear_reg()|>
  set_engine("lm")|>
  set_mode("regression")|>
  fit(math.score ~ reading.score + writing.score + ., data = reg_train)

lm_fit$fit
summary(lm_fit$fit)

boost_reg_fit <- boost_tree()|>
  set_engine("xgboost")|>
  set_mode("regression")|>
  fit(math.score ~ ., data = reg_train)

boost_reg_fit$fit
boost_reg_fit$fit$evaluation_log

## Step 8: Evaluate accuracy
reg_results <- reg_test

reg_results$lm_math_pred <- predict(lm_fit, reg_test)$.pred
reg_results$boost_math_pred <- predict(boost_reg_fit, reg_test)$.pred

View(reg_results)

yardstick::mae(reg_results, math.score, lm_math_pred)
yardstick::mae(reg_results, math.score, boost_math_pred)

yardstick::rmse(reg_results, math.score, lm_math_pred)
yardstick::rmse(reg_results, math.score, boost_math_pred)




