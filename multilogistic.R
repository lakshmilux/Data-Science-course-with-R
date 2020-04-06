library(caTools)
library(glm2)
library(caret)
library(e1071)
library(dplyr)

d = read.csv(file.choose())
attach(d)
glimpse(d)
d$churn = ifelse(d$Churn == "Yes",1,0)
str(d)
splt = sample.split(d$Churn,SplitRatio = 0.65)
train = subset(d,splt == T)
test = subset(d,splt == F)
nrow(train)
nrow(test)

mlog = glm(gender ~ (Dependents+InternetService+Contract),family = binomial)
summary(mlog)


rmlog = predict(mlog,test,type = "response")
rmlog
range(rmlog)
p2 = ifelse(rmlog>0.5,1,0)
pred2 = table(predicted = p2,actual = test$Churn)
pred2

acc = 1 - sum(diag(pred2))/sum(pred2)
acc


#2nd problem
rmlog2 = glm(gender ~ tenure + MonthlyCharges + PaymentMethod,family = binomial,data = train)
rmlog2
rmlogt = glm(gender ~ tenure + MonthlyCharges + PaymentMethod,family = binomial,data = test)
rmlogt
rmlogm2 = round(predict(rmlog2,test,type = "response"),2)
rmlogm2
rmlogm2 = ifelse(rmlogm2 > 0.49,1,0)
rmlogm2
xtab = table(predicted = rmlogm2,actual = test$churn)
acc2 = 1 - sum(diag(xtab))/sum(xtab)
acc2
