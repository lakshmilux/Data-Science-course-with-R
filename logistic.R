library(glm2)
attach(d)
logmod1 = glm(Churn~TechSupport,data = d,family = binomial)
logmod1
predict(logmod1,data.frame(TechSupport = "Yes"),type = "response")
predict(logmod1,data.frame(TechSupport = 'No'),type = "response")
predict(logmod1,data.frame(TechSupport = "No internet service",type = "response"))

logmod2 = glm(Dependents ~ tenure,data = d,family = binomial)
logmod2

predict(logmod2,data.frame(tenure = 10),type = "response")
predict(logmod2,data.frame(tenure = 50),type = "response")
predict(logmod2,data.frame(tenure = 70),type = "response")

