#In this exercise you will create some simulated data and will fit simple linear regression models to it. Make sure to use set.seed(1) prior to starting part (a) to ensure consistent results.
set.seed(1)

#a) Using the rnorm() function, create a vector, x, containing 100 observations drawn from a N(0, 1) distribution. This represents a feature, X.
x <- rnorm(100)

#b) Using the rnorm() function, create a vector, eps, containing 100 observations drawn from a N(0, 0.25) distribution i.e. a normal distribution with mean zero and variance 0.25.
eps <- rnorm(100, mean = 0, sd = sqrt(0.25))

#c) Using x and eps, generate a vector y according to the model Y = −1+0.5X + . What is the length of the vector y? What are the values of β0 and β1 in this linear model?
y <- -1 + 0.5*x + eps
length(y)

#d) Create a scatterplot displaying the relationship between x and y. Comment on what you observe.
plot(x,y)

#e) Fit a least squares linear model to predict y using x. Comment on the model obtained. How do βˆ0 and βˆ1 compare to β0 and β1?
f <- lm(y~x)
summary(f)

#f) Display the least squares line on the scatterplot obtained in (d). Draw the population regression line on the plot, in a different color. Use the legend() command to create an appropriate legend.
plot(x,y)
abline(f, col="red")
abline(-1, 0.5, col="black")
legend("bottomright", c("Least Sqaures", "Regression"), col=c("red", "black"), lty = c(1,1), title = "Legend")

#g) Now fit a polynomial regression model that predicts y using x and x2. Is there evidence that the quadratic term improves the model fit? Explain your answer.
poly <- lm(y~x + I(x^2))
summary(poly)

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

#j) What are the confidence intervals for β0 and β1 based on the original data set, the noisier data set, and the less noisy data set? Comment on your results.
confint(f)
confint(lessnoise)
confint(morenoise)
