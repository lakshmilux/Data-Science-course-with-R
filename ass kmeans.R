library(dplyr)

d = read.csv(file.choose())
fts = d %>% select("MonthlyCharges","tenure","TotalCharges")
head(fts,5)
sum(is.na(fts))
ftrs = na.omit(fts)
colSums(is.na(ftrs))

km = kmeans(ftrs$MonthlyCharges,3)
km

ckm = cbind(MC = ftrs$MonthlyCharges,Clusters = km$cluster)
ckm

ckm = as.data.frame(ckm)
MC1 = ckm %>% filter(Clusters == 1)
nrow(MC1)
MC2 = ckm %>% filter(Clusters == 2)
nrow(MC2)
mc3 = ckm %>% filter(Clusters == 3)
nrow(mc3)

kt = kmeans(ftrs$tenure,3)
kt

ctc = cbind.data.frame(ftrs$tenure,clusters = kt$cluster)
ctc

ct1 = ctc %>% filter(clusters == 1)
ct1

ct2 = ctc %>% filter(clusters == 2)
ct2

ct3 = ctc %>% filter(clusters == 3)
ct3

tc = kmeans(ftrs$TotalCharges,3)
tc

tct = cbind.data.frame(TC = ftrs$TotalCharges,clustrs = tc$cluster)
tct

tc1 = tct %>% filter(clustrs == 1)
nrow(tc1)

tc2 = tct %>% filter(clustrs == 2)
nrow(tc2)

tc3 = tct %>% filter(clustrs == 3)
nrow(tc3)
