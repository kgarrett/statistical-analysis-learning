#This exercise involves the Boston housing data set
#a) To begin, load in the Boston data set. The Boston data set is part of the MASS library in R
library(MASS)
Boston
?Boston
View(Boston)
#There are 506 rows and 14 columns in this data set. The rows and columns represent suburbs of Boston and variables
#that impact housing values (e.g. crime, highways, etc.), respectively

#b) 
pairs(~ crim + indus + rm, Boston)
plot(Boston$crim)
plot(Boston$tax)
plot(Boston$ptratio)
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
