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
# The neighborhood 399 has the lowest median value of owner-occupied homes at 5.0.
#The values of the predictors are crim = 38.35, indus = 18.10, zn = 0, chas = 0, nox = 0.69, rm = 5.45, age = 100, dis = 1.48, rad = 24, tax = 666, ptratio = 20.2, black = 396.9, lstat = 30.59. 
#I compared these numbers to the mean. The crime rate is extremely high compared to the mean (3.61). The zn, indus, and nox are also slightly higher than average. The number of rooms per dwelling is slightly lower than the mean (6.78). 
#This neighborhood has greater access to employment centers and highways; however, tax rates and student teacher ratios are higher than average. The proportion of African Americans is slightly higher than the mean (356.67). I assume this is a neighborhood closer to the city of Boston.

#h) In this data set, how many of the suburbs average more than seven rooms per dwelling? More than eight rooms per dwelling? Comment on the suburbs that average more than eight rooms per dwelling.
summary(Boston)
which.max(Boston$rm)
summary(Boston$rm>7)
summary(Boston$rm>8)
#Sixty-four (64) suburbs average more than seven rooms per dwelling while only thirteen suburbs average more than eight rooms per dwelling. The suburb with the greatest rooms is 365 with 8.780. Most of the other rates are also higher than average, except for crime and number of African Americans, which are par with the average. 
