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
#Neighborhoods 350-500 have high crime rates. Most have a crime rate near zero but one goes as high as around 90. 
#Tax rates have more fluctuation, but highest tax rates are present in neighborhoods 350-500. The highest rates, at about 700, is in neighborhood 480. The lowest rates are below 200. 
#Most neighborhoods in Boston have a pupil teacher ratio between 14 and 21. All of the suburbs in 350-500 have a ratio of 20. The highest ratio is 22 and the lowest is around 12. 

#e) How many of the suburbs in this data set bound the Charles river?
plot(Boston$chas)
hist(Boston$chas)
summary(Boston$chas)
summary(Boston$chas==1)
# Thirty-five (35) suburbs in the dataset bound the Charles River.

#f) What is the median pupil-teacher ratio among the towns in this data set?
summary(Boston$ptratio)
#The median pupil-teacher ratio is 19.05.

#g) Which suburb of Boston has lowest median value of owneroccupied homes? What are the values of the other predictors for that suburb, and how do those values compare to the overall ranges for those predictors? Comment on your findings.
which.min(Boston$age)
which.min(Boston$medv)
hist(Boston$indus)
plot(Boston$indus)
#
summary(Boston)
which.max(Boston$rm)
summary(Boston$rm>7)
summary(Boston$rm>8)
