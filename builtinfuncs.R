library(dplyr)

d = read.csv(file.choose())
attach(d)

head(PhoneService,4)
d$Contract[c(1:8)]

tail(TotalCharges,1)
tail(TotalCharges,5)

min(tenure)
max(tenure)
range(tenure)
mean(tenure)

sample(TotalCharges,10)

table(PaymentMethod,Contract)

