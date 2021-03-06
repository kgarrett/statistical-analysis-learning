library(MASS)
attach(Boston)
?Boston
f.zn <- lm(crim~zn)
summary(f.zn)
f.indus <- lm(crim~indus)
summary(f.indus)
f.chas <- lm(crim~chas)
summary(f.chas)
f.nox <- lm(crim~nox)
summary(f.nox)
f.rm <- lm(crim~rm)
summary(f.rm)
f.age <- lm(crim~age)
summary(f.age)
f.dis <- lm(crim~dis)
summary(f.dis)
f.rad <- lm(crim~rad)
summary(f.rad)
f.tax <- lm(crim~tax)
summary(f.tax)
f.ptratio <- lm(crim~ptratio)
summary(f.ptratio)
f.black <- lm(crim~black)
summary(f.black)
f.lstat <- lm(crim~lstat)
summary(f.lstat)
f.medv <- lm(crim~medv)
summary(f.medv)
par(mfrow=c(2,2))
plot(f.chas)
mrf <- lm(crim~., data=Boston)
summary(mrf)
sr <- vector("numeric",0)
sr <- c(sr, f.zn$coefficient[2])
sr <- c(sr, f.indus$coefficients[2])
sr <- c(sr, f.chas$coefficients[2])
sr <- c(sr, f.nox$coefficient[2])
sr <- c(sr, f.rm$coefficients[2])
sr <- c(sr, f.age$coefficients[2])
sr <- c(sr, f.dis$coefficients[2])
sr <- c(sr, f.rad$coefficients[2])
sr <- c(sr, f.tax$coefficients[2])
sr <- c(sr, f.ptratio$coefficients[2])
sr <- c(sr, f.black$coefficients[2])
sr <- c(sr, f.lstat$coefficients[2])
sr <- c(sr, f.medv$coefficients[2])
mr <- vector("numeric",0)
mr <- c(mr, mrf$coefficients)
mr <- mr[-1]
plot(sr,mr,col="blue")
nlzn <- lm(crim~zn + I(zn^2) + I(zn^3))
summary(nlzn)
nlindus <- lm(crim~indus + I(indus^2) + I(indus^3))
summary(nlindus)
nlchas <- lm(crim~chas + I(chas^2) + I(chas^3))
summary(nlchas)
nlnox <- lm(crim~nox + I(nox^2) + I(nox^3))
summary(nlnox)
nlrm <- lm(crim~rm + I(rm^2) + I(rm^3))
summary(nlrm)
nlage <- lm(crim~age + I(age^2) + I(age^3))
summary(nlage)
nldis <- lm(crim~dis + I(dis^2) + I(age^3))
summary(nldis)
nlrad <- lm(crim~rad + I(rad^2) + I(rad^3))
nldis <- lm(crim~dis + I(dis^2) + I(dis^3))
summary(nlrad)
summary(nldis)
nltax <- lm(crim~tax + I(tax^2) + I(tax^3))
summary(nltax)
nlptratio <- lm(crim~ptratio + I(ptratio^2) + I(ptratio^3))
summary(nlptratio)
nlblack <- lm(crim~black + I(black^2) + I(black^3))
summary(nlblack)
nllstat <- lm(crim~lstat + I(lstat^2) + I(lstat^3))
summary(nllstat)
nlmedv <- lm(crim~medv + I(medv^2) + I(medv^3))
summary(nlmedv)
