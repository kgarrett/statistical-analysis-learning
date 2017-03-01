#This question involves the use of multiple linear regression on the Auto data set.
Auto = read.table("Auto.txt")
View(Auto)

#a) Produce a scatterplot matrix which includes all of the variables in the data set.
pairs(Auto)

#b) Compute the matrix of correlations between the variables using the function cor(). You will need to exclude the name variable, cor() which is qualitative.
names(Auto)
Auto = read.table("Auto.txt",header = T)
names(Auto)
Auto1 <- Auto[, 1:8]
View(Auto1)
cor(Auto1)
names(Auto)

#c) Use the lm() function to perform a multiple linear regression with mpg as the response and all other variables except name as the predictors. Use the summary() function to print the results. Comment on the output.
lm.fit=lm(mpg~.-name,data=Auto)
attach(Auto)
summary(lm.fit)
#Yes, there appears to be a relationship between some of the predictors and the response. The p-value for the test is < 0.00...2. The variables are highly significant.
#We can reject the null hypothesis that there is no relationship between mpg and the other variables except name in favor of the Ha because p < 0.05 (99% confidence level) 

#Weight, Year, and Origin have significance well below the 99% confidence level. Acceleration has significance at the 95% confidence level.
#The coefficient for the Year variable is 7.164e-10 (0.7164). If all the other predictors remain constant, an increase in one year is an increase of 0.7164 in mpg.

#d) Use the plot() function to produce diagnostic plots of the linear regression fit. Comment on any problems you see with the fit. Do the residual plots suggest any unusually large outliers? Does the leverage plot identify any observations with unusually high leverage?
f=lm(mpg~cylinders+displacement+horsepower+weight+acceleration+year+origin)
summary(f)
par(mfrow=c(2,2))
plot(f)
#The standardized residuals suggest that there are some outliers because they exceed 3. Point 387 stands out particularly. There also appears to be a high leverage point visible in the Residuals vs. Leverage graph.

#e)  Use the * and : symbols to fit linear regression models with interaction effects. Do any interactions appear to be statistically significant?
summary(lm(mpg~cylinders+displacement+horsepower+weight+acceleration:year+year+origin))
summary(lm(mpg~cylinders*displacement+horsepower+weight+acceleration+year+origin))
#I included the interaction term Acceleration x Year and this was statistically significant at the 0.01 level. The interaction between Cylinders x Displacement is also statistically significant at 0.01.

#f) Try a few different transformations of the variables, such as log(X), √X, X2. Comment on your findings.
f=lm(mpg~.-name+I(cylinders)^2,data=Auto)
f=lm(mpg~.-name+I((cylinders)^2),data=Auto)
summary(f)
f=lm(mpg~.-name+I((year)^2),data = Auto)
summary(f)
#Predictor Cylinders^2 using I(x^2) is not statistically significant. Predictor year^2, however, is statistically significant at the 99.99% confidence interval.
