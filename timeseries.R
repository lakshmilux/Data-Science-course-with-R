AirPassengers
plot(AirPassengers,col = "pink",main = "passengers vs time")
abline(lm(AirPassengers ~ time(AirPassengers)),col = "green")
plot(decompose(AirPassengers))
boxplot(AirPassengers  ~ cycle(AirPassengers))
plot(log(AirPassengers))
abline(lm(log(AirPassengers) ~ time(log(AirPassengers))))
plot(diff(log(AirPassengers)))
abline(lm(diff(log(AirPassengers))~ time(diff(log(AirPassengers)))))

acf(AirPassengers)
acf(diff(log(AirPassengers)))
pacf(diff(log(AirPassengers)))

arima(log(AirPassengers),c(0,1,1),seasonal = list(order = c(0,1,0),period = 12)) -> mod_time
predict(mod_time,20*12) -> pred_time
pred_time
2.718 ^ pred_time$pred -> pred_time
pred_time

ts.plot(AirPassengers,pred_time,log = "y",lty = c(1,3),col = "purple3",main = "forecasted values")
