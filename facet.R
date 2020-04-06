library(ggplot2)
attach(d)
ggplot(d,aes(x = MultipleLines,y = tenure,fill = InternetService))+geom_boxplot() -> g1
g1 + facet_grid(~InternetService)
ggplot(d,aes(x = tenure,y = TotalCharges,col = Contract,shape = Contract))+geom_point() -> g2
g2 + facet_grid(~Contract)
ggplot(d,aes(x = MonthlyCharges,fill = PaymentMethod))+geom_histogram() ->g3
g3+facet_grid(~PaymentMethod)
