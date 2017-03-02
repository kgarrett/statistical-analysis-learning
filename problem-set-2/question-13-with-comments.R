#In this exercise you will create some simulated data and will fit simple linear regression models to it. Make sure to use set.seed(1) prior to starting part (a) to ensure consistent results.
set.seed(1)

#a) Using the rnorm() function, create a vector, x, containing 100 observations drawn from a N(0, 1) distribution. This represents a feature, X.
x <- rnorm(100)

#b) Using the rnorm() function, create a vector, eps, containing 100 observations drawn from a N(0, 0.25) distribution i.e. a normal distribution with mean zero and variance 0.25.
eps <- rnorm(100, mean = 0, sd = sqrt(0.25))

#c) Using x and eps, generate a vector y according to the model Y = −1+0.5X + . What is the length of the vector y? What are the values of β0 and β1 in this linear model?
y <- -1 + 0.5*x + eps
length(y)
#The length of Y is 100. The value of β0 (intercept) is -1 and the value of β1 (slope) is 0.5

#d) Create a scatterplot displaying the relationship between x and y. Comment on what you observe.
plot(x,y)
#The relationship appears faily linear positive.

#e) Fit a least squares linear model to predict y using x. Comment on the model obtained. How do βˆ0 and βˆ1 compare to β0 and β1?
f <- lm(y~x)
summary(f)
#The β^0 is -1.0885 and the β^1 is 0.49947 which are pretty close to the true β0 and β1. The p-value is very low which suggests that there is a relationship. 

#f) Display the least squares line on the scatterplot obtained in (d). Draw the population regression line on the plot, in a different color. Use the legend() command to create an appropriate legend.
plot(x,y)
abline(f, col="red")
abline(-1, 0.5, col="black")
legend("bottomright", c("Least Sqaures", "Regression"), col=c("red", "black"), lty = c(1,1), title = "Legend")

#g) Now fit a polynomial regression model that predicts y using x and x2. Is there evidence that the quadratic term improves the model fit? Explain your answer.
poly <- lm(y~x + I(x^2))
summary(poly)
#The predictor x^2 is not statistically significant as the p-value is 0.164. Therefore there is no evidence that the quadratic term improves the fit. 

#h) Repeat (a)–(f) after modifying the data generation process in such a way that there is less noise in the data. The model (3.39) should remain the same. You can do this by decreasing the variance of the normal distribution used to generate the error term in (b). Describe your results.
set.seed(1)
eps <- rnorm(100, mean = 0, sd = sqrt(0.1))
y <- -1 + 0.5 * x + eps
plot(x,y)
lessnoise <- lm(y~x)
summary(lessnoise)
abline(lessnoise, col = "green")
abline(-1, 0.5, col = "red")
legend("bottomright", c("Least Squares", "Regression"), col = c("green", "red"), lty = c(1,1))
#I chose a variance of 0.1, and when I ran a summary I got an error message that the model is "essentially a perfect fit," warning that the model may be unreliable.
#Both p-values for β^0 and β^1 are essentially zero and the F-statistic is really large. The scatterplot shows that there is absolutely no error in the dataset, so the regression and least squares no longer overlap.

#i) Repeat (a)–(f) after modifying the data generation process in such a way that there is more noise in the data. The model (3.39) should remain the same. You can do this by increasing the variance of the normal distribution used to generate the error term  in (b). Describe your results.
set.seed(1)
eps <- rnorm(100, mean = 0, sd = sqrt(0.75))
y <- -1 + 0.5 * x + eps
plot(x,y)
morenoise <- lm(y~x)
summary(morenoise)
abline(morenoise, col = "blue")
abline(-1, 0.5, col = "orange")
legend("bottomright", c("Least Squares", "Regression"), col = c("blue", "orange"), lty = c(1,1))
#I chose a variance of 0.75 which put a lot more noise in the data. However, β^0 and β^1 remain significant. The F-statistic has come down to 28.63.
#The least squares and regression lines are pretty close to overlapping again. There is a lower R^2 than the normal distribution, however. (0.4779 => 0.226)

#j) What are the confidence intervals for β0 and β1 based on the original data set, the noisier data set, and the less noisy data set? Comment on your results.
confint(f)
confint(lessnoise)
confint(morenoise)
#original dataset
#β0 [-1.115,-0.927] β1 [0.392,0.606]

#less noisy dataset
#β0 [-1.000,--1.000] β1 [0.816,0.816]

#more noisy dataset
#β0 [-1.1993,-0.867] β1 [0.314,0.684]

#With less noise, the confidence interval narrows because there is more predictability in the data, e.g. there is no error from the true form.
