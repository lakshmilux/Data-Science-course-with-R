library(dplyr)
d = read.csv(file.choose())
library(ggplot2)
attach(d)
ggplot(d,aes(gender))+geom_bar(fill = "blue4") -> g1
g1 + theme(panel.background = element_rect(fill = "chartreuse4")) ->g2
g2 + theme(plot.background = element_rect(fill = "cornsilk4")) -> g3
g3

ggplot(d,aes(y = tenure,x = MonthlyCharges))+geom_point(col = "yellowgreen") ->g1
g1 + labs(title = "Tenure vs MonthlyCharges") +theme(panel.background = element_rect(fill = "coral2")) -> g2
g2
g2 + theme(plot.background = element_rect(fill = "beige")) + theme(plot.title = element_text(hjust = 0.5,color = "red"))
