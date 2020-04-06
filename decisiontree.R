library(dplyr)
library(caTools)


d = read.csv(file.choose())
tt = sample.split(d$Dependents,SplitRatio = 0.70 )
tr = subset(d,tt == TRUE)
ts = subset(d,tt == FALSE)
nrow(tr)
nrow(ts)

library(rpart)
library(rpart.plot)
library(tree)


x = d$Dependents
y = d$Partner
dt = rpart(Dependents ~ Partner,data = tr)
rpart.plot(dt)
print(dt)


rpart.plot(x= dt, type= 5, extra = 0,tweak = 1.4)


class_prediction = predict(dt, newdata = ts,type = "class")
class_prediction
NROW(class_prediction)

tab<-table(class_prediction,ts$Partner)
tab

library(caret)
confusionMatrix(class_prediction, ts$Partner)
sum(diag(tab))/sum(tab)


mod_tree2 = rpart(Dependents ~ Partner + InternetService,data = tr)
mod_tree2
plot(mod_tree2)
text(mod_tree2)

result2 = predict(mod_tree2,newdata = ts,type = "class")
result2

tab2 = table(result2,ts$Dependents)
tab2

confusionMatrix(result2,ts$Dependents)
sum(diag(tab2)/sum(tab2))

