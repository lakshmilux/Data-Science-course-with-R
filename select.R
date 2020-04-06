library(dplyr)
d = read.csv(file.choose())
names(d)
glimpse(d)
c_5 = select(d,5)
View(c_5)
c_15 = select(d,15)
View(c_15)

c_3m = select(d,3,6,9,12,15,18)
View(c_3m)
c_10_20 = select(d,10:20)
View(c_10_20)
c_p = select(d,starts_with("p"))
View(c_p)
c_s = select(d,ends_with("s"))
View(c_s)

r = c()
for (i in 1:6){
  r[i] = 3*i
  c_3m = d[,r]
  
}
View(c_3m)
