#This exercise involves the Boston housing data set
#a) To begin, load in the Boston data set. The Boston data set is part of the MASS library in R
library(MASS)
Boston
?Boston
View(Boston)
#There are 506 rows and 14 columns in this data set. The rows and columns represent suburbs of Boston and variables
#that impact housing values (e.g. crime, highways, etc.), respectively.

#b) Make some pairwise scatterplots of the predictors (columns) in this data set. Describe your findings.
pairs(~ crim + indus + rm, Boston)
#I created a scatterplot matrix using the predictors: crime rate per capita (crim), proportion of non-retail business (indus), and average number of rooms (rm). This yielded 6 scatterplots.
#There is a slight positive relationship between number of rooms and crime. There is a particularly strong relationship between a certain non-retail business and crime. 
#There seems to be a negligible relationship between rooms and non-retail business.

#c) Are any of the predictors associated with per capita crime rate? If so, explain the relationship.
#Yes, crim. There is higher crime rate in neighborhoods indexed between ≈ 350-500. There is also a slight spike around 150. Most of the other neighborhoods have crime near zero.

#d) Do any of the suburbs of Boston appear to have particularly high crime rates? Tax rates? Pupil-teacher ratios? Comment on the range of each predictor.
plot(Boston$crim)
plot(Boston$tax)
plot(Boston$ptratio)
#
plot(Boston$chas)
hist(Boston$chas)
summary(Boston$chas)
summary(Boston$chas==1)
summary(Boston$ptratio)
which.min(Boston$age)
which.min(Boston$medv)
hist(Boston$indus)
plot(Boston$indus)
summary(Boston)
which.max(Boston$rm)
summary(Boston$rm>7)
summary(Boston$rm>8)
