d = read.csv(file.choose())
custinternetser = d$InternetService
custpaper = d$PaperlessBilling
custstremngtv = d$StreamingMovies

custrandclmns = d[,c(3,6,9)]
head(custrandclmns)

cust10_20 = d[,c(10:21)]
head(cust10_20)

custrandrows = d[c(65,765,3726,700),]
head(custrandrows)

custrr = d[c(655:6550),]
head(custrr)

custrc = d[c(10,100,1000),c(5,10,15)]
custrc
