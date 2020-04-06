library(dplyr)
library(caTools)
library(e1071)
library(randomForest)

d = read.csv(file.choose())
attach(d)
splt = sample.split(d$gender,SplitRatio = 0.65)
trn = subset(d,splt == T)
tst = subset(d,splt == F)

rf = randomForest(gender ~MonthlyCharges+tenure,data = trn,mtry = 2,ntree = 100)
rf
importance(rf)
varImpPlot(rf,color = "olivedrab3")

p = predict(rf,tst,type = "class")
head(p)

tb = table(predicted = p,actual = tst$gender)
tb
ac = 1- sum(diag(tb))/sum(tb)
ac


rf1 = randomForest(gender ~ MonthlyCharges+tenure,data = trn,mtry = 2,ntree = 350)
importance(rf1)
varImpPlot(rf1,color = "orange")

p1 = predict(rf1,tst,type = "class")
head(p1)

tb1 = table(p1,tst$gender)
tb1

acc1 = 1 - sum(diag(tb1))/sum(tb1)
acc1
