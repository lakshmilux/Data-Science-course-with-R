d = read.csv(file.choose())
library(sqldf)
attach(d)
onbc = sqldf("select OnlineBackup from d")
View(onbc)
csc = sqldf("select StreamingTV,StreamingMovies,Contract from d")
csc
cpm = sqldf("select PaymentMethod from d where PaymentMethod = 'Mailed check'")
cpm
crs = sqldf("select * from d where gender = 'Male' and tenure = 1 and PaymentMethod = 'Mailed check'")
crs
