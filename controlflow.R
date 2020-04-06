d = read.csv(file.choose())
head(d$Churn)
attach(d)
if (PaymentMethod[6] == 'Electronic check'){
   print("YES, the payment method is Electronic check")
}


if(Contract[12] == "month-to-month"){
  print("contract is for month to month")
}else if (Contract[12] == "One year"){
  print("the contract is for one year")
}else if (Contract[12] == "Two year"){
  print("contract is for two years")
}

switch (as.character(gender[6]),
        "Female" = MonthlyCharges[6]*0.5, 
        "Male" = MonthlyCharges[6]*0.2) -> MonthlyCharges[6]
MonthlyCharges[6]

j = 0
for (i in 1:nrow(d)){
  if (InternetService[i] == "DSL"){
    j = j+1
  }
}
print(j)


k = 0
i = 1
while (i <= nrow(d)) {
  if (d$tenure[i] == 2){
    k = k+1
  }
i = i+1
}
print(k)
table(tenure)

