d = read.csv(file.choose())
attach(d)
plot(PaymentMethod,col = "burlywood4",xlab = "paymentmethod",main = "Barplot for payment method")
hist(TotalCharges,col = "forestgreen",xlab = "Totalcharges",main = "Histogram for Total charges")
TotalCharges[is.na(TotalCharges)] <- 0
sum(is.na(TotalCharges))
plot(density(TotalCharges),col = "maroon",xlab = "Totalcharges",main = "Density for Total charges")
