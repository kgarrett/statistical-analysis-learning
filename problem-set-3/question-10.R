library(ISLR)
names(Weekly)
dim(Weekly)
summary(Weekly)
plot(Weekly)
cor(Weekly [,-9])
attach(Weekly)
plot(Volume)
lr.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Weekly, family=binomial)
summary(lr.fit)
lr.probs=predict(lr.fit,type="response")
lr.probs[1:10]
contrasts(Direction)
lr.pred=rep("Down",1089)
lr.pred[lr.probs>.5]="Up"
table(lr.pred,Direction)
(557+54)/1089
mean(lr.pred==Direction)
train=(Year<2009)
Weekly.2009=Weekly[!train,]
dim(Weekly.2009)
Direction.2009=Weekly$Direction[!train]
lr.fit=glm(Direction~Lag2, data=Weekly,family=binomial,subset=train)
lr.probs=predict(lr.fit,Weekly.2009,type="response")
lr.pred=rep("Down",104)
lr.pred[lr.probs>.5]="Up"
table(lr.pred,Direction.2009)
library(MASS)
lda.fit=lda(Direction~Lag2, data=Weekly, subset=train)
lda.fit
lda.pred=predict(lda.fit,Weekly.2009)
names(lda.pred)
lda.class=lda.pred$class
table(lda.class,Direction.2009)
qda.fit=qda(Direction~Lag2,data=Weekly,subset=train)
qda.fit
qda.class=predict(qda.fit,Weekly.2009)$class
table(qda.class,Direction.2009)
library(class)
train.X=cbind(Lag2)[train,]
test.X=cbind(Lag2)[!train,]
train.Direction =Direction [train]
set.seed(1)
knn.pred=knn(train.X,test.X,train.Direction ,k=1)
table(knn.pred,Direction.2009)
train=(Year<2009)
Weekly.2009=Weekly[!train,]
dim(Weekly.2009)
Direction.2009=Weekly$Direction[!train]
glm.fit=glm(Direction~Lag1+Lag2+Volume,data=Weekly,family=binomial,subset = train)
glm.probs=predict(glm.fit,Weekly.2009,type="response")
glm.pred=rep("Down",104)
glm.pred[glm.probs>.5]="Up"
table(glm.pred,Direction.2009)
lda.fit=lda(Direction~Lag3:Lag4,data=Weekly,subset = train)
lda.pred=predict(lda.fit,Weekly.2009)
table(lda.pred$class,Direction.2009)
qda.fit=qda(Direction~Lag1+(Lag2)^3, data=Weekly, subset=train)
qda.pred=predict(qda.fit,Weekly.2009)
table(qda.pred$class,Direction.2009)
library(class)
train.X=cbind(Lag1,Lag2)[train,]
test.X=cbind(Lag1,Lag2)[!train,]
train.Direction=Direction[train]
set.seed(1)
knn.pred=knn(train.X,test.X,train.Direction,k=5)
table(knn.pred,Direction.2009)
