library(ggplot2)
ggplot(d,aes(x = PhoneService))+geom_bar(fill = "pink",col = "peru")
ggplot(d,aes(x = InternetService,fill = InternetService))+geom_bar()
ggplot(d,aes(x = InternetService,fill = Contract))+geom_bar(position = "identity")
ggplot(d,aes(x = InternetService,fill = Contract))+geom_bar()
ggplot(d,aes(x = TechSupport,fill = Churn))+geom_bar(position = "dodge")
