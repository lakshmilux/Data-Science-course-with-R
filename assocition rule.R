library(arules)
library(arulesViz)
remove(Groceries)
data(Groceries)
summary(Groceries)

apriori(Groceries,parameter = list(support = 0.05,confidence = 0.3)) -> rule2
inspect(head(rule1))
plot(rule1)
plot(rule1,method = "grouped")

rule3 = apriori(Groceries,parameter = list(support = 0.003,confidence = 0.7))
plot(rule3)
plot(rule3,method = "grouped")
