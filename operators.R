d = read.csv(file.choose())

dmc5 = d$MonthlyCharges[5] + 5
dmc5

dmcs9 = d$MonthlyCharges[5] - 9.65
dmcs9

dmc1 = d$MonthlyCharges[1] * 3
dmc1

dmc37 = d$MonthlyCharges[37] * 3
dmc37

chkt = d$tenure[1] > d$tenure[10]
chkt

chkt3 = d$tenure[3] == d$tenure[5]
chkt3

cntcu = sum(d$TechSupport == 'Yes' & d$StreamingTV == 'Yes')
cntcu

indsl = d$InternetService == 'DSL' | d$InternetService == 'Fiber Optic'
indsl
