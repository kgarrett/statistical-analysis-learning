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

#d) Use the plot() function to produce diagnostic plots of the linear regression fit. Comment on any problems you see with the fit. Do the residual plots suggest any unusually large outliers? Does the leverage plot identify any observations with unusually high leverage?
f=lm(mpg~cylinders+displacement+horsepower+weight+acceleration+year+origin)
summary(f)
par(mfrow=c(2,2))
plot(f)

#e)  Use the * and : symbols to fit linear regression models with interaction effects. Do any interactions appear to be statistically significant?
summary(lm(mpg~cylinders+displacement+horsepower+weight+acceleration:year+year+origin))
summary(lm(mpg~cylinders*displacement+horsepower+weight+acceleration+year+origin))

#f) Try a few different transformations of the variables, such as log(X), √X, X2. Comment on your findings.
f=lm(mpg~.-name+I(cylinders)^2,data=Auto)
f=lm(mpg~.-name+I((cylinders)^2),data=Auto)
summary(f)
f=lm(mpg~.-name+I((year)^2),data = Auto)
summary(f)
