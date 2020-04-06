library(dplyr)
d = read.csv(file.choose())
attach(d)
meant = d %>% summarise(meant = mean(tenure))
meant
varn = d%>% summarise(varn = var(tenure))
varn
stddev = d %>% summarise(std = sd(tenure))
stddev
meanm = d %>% summarise(mean(MonthlyCharges))
meant
varm = d%>% summarise(var(MonthlyCharges))
varn
stddevm = d %>% summarise(stdm = sd(MonthlyCharges))
stddevm
mc = summarise(group_by(d,Contract),med = median(MonthlyCharges))
mc
mti = summarise(group_by(d,InternetService),meda = median(TotalCharges,na.rm = T))
mti
