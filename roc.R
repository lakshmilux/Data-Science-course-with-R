library(ROCR)
library(caTools)
library(glm2)

d = read.csv(file.choose())
splt = sample.split(d$Churn,SplitRatio = 0.8)
tr = subset(d,splt == T)
ts = subset(d,splt == F)

lg = glm(Churn ~ MonthlyCharges+tenure+TechSupport,data = tr,family = binomial)
lg

rlroc = predict(lg,ts,type = "response")
rlroc = ifelse(rlroc > 0.49,1,0)
rlroc

prlog = prediction(rlroc,ts$Churn)
acc = performance(prlog,"acc")
acc
plot(acc)

tab = table(rlroc,ts$Churn)
tab
ac = 1 - sum(diag(tab))/sum(tab)
ac

roc = performance(prlog,"tpr","fpr")
plot(roc,colorize = T)

auc = performance(prlog,"auc")
auc
