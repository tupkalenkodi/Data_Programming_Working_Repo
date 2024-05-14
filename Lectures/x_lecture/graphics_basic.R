index = data.frame(year=as.factor(2007:2016),
                   pop=sample(10000:20000,
                              size=10))
plot(index$year, index$pop,
     main="Population across years",
     xlab="year",
     ylab="population")

model = lm(Ozone~Temp+Wind, 
   data=airquality)
summary(model)

plot(model)