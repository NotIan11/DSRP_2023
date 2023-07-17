##load required libraries
library(dplyr)
library(ggplot2)
library(corrplot)

## Compare the mass of male and female human star wars characters
## null hypothesis: average mass of male and female star wars characters is the same
## alternative hypothesis: average mass of male and female star wars characters is different
swHumans <- starwars |> filter(species == "Human", mass>0)
males <- swHumans |> filter(sex == "male")
females <- swHumans |> filter (sex=="female")

t.test(males$mass, females$mass, paired = F, alternative = "two.sided")
# p value is 0.065
# not significant, failed to reject null hypothesis


## ANOVA ####
iris

anova_results <- aov(data = iris, Sepal.Length ~ Species)

## Are any groups different from each other?
summary(anova_results)

## Which ones?
TukeyHSD(anova_results)


## Is there a significant difference in the mean petal lengths or petal widths by species?
anova_results <-aov(data = iris, Sepal.Width ~ Species)
TukeyHSD(anova_results)

anova_results <- aov(data = iris, Petal.Width ~ Species)
summary(anova_results)


### Starwars
head(starwars)
unique(starwars$species)

## Which 5 species are the most common?
top3species <- starwars|> 
  summarize(.by = species,
            count = sum(!is.na(species)))|>
  slice_max(count, n=3)

top3species


starwars_top3species <- starwars|>
  filter(species %in% top3species$species)

starwars_top3species

## Is there a significant difference in the mass of each of the top 3 species?
anova_results <- aov(data = starwars_top3species, height ~ species)
summary(anova_results)
TukeyHSD(anova_results)

## Chi Squared
starwars_clean <- starwars |>
  filter(!is.na(species),
         !is.na(homeworld))

t <- table(starwars_clean$species, starwars_clean$homeworld)
chisq.test(t) #not enough data

mpg
table(mpg$manufacturer, mpg$class)
table(mpg$cyl, mpg$displ)

## How do we get a contingency table of year and drv?
t <-table(mpg$year, mpg$drv)

chisq_result <- chisq.test(t)
chisq_result
chisq_result$p.value
chisq_result$residuals

install.packages("corrplot")
library(corrplot)

corrplot(chisq_result$residuals)

## chi squared full analysis
heroes <- read.csv("Data/heroes_information.csv")
head(heroes)

## clean data
heroes_clean <- heroes|>
  filter(Alignment != "-",
         Gender != "-")

## plot the counts of alignment and gender
ggplot(heroes_clean, aes(x=Gender,y=Alignment))+
  geom_count()+
  theme_minimal()

## make contingency table
t <- table(heroes_clean$Alignment, heroes_clean$Gender)

## chi square test
chisq_result <- chisq.test(t)
chisq_result$p.value
chisq_result$residuals

corrplot(chisq_result$residuals, is.cor = F)

## ifelse

x <- 7
ifelse(x<5, "small number", "big number")

head(iris)
mean(iris$Petal.Width)
iris_new <- iris

## Add categorical column
iris_new <- mutate(iris_new, 
                   petal_size = ifelse(Petal.Width>1, "big", "small"))

iris_new <- mutate(iris_new,
                   petal_size = case_when(
                     Petal.Width<1 ~ "small",
                     Petal.Width<2 ~ "medium",
                     TRUE ~ "big"))












