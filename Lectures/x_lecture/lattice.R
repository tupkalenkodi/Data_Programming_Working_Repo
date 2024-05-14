library(lattice)


index = data.frame(year=as.factor(2007:2016),
                   pop=sample(10000:20000,
                              size=10))

lattice::barchart(pop~year, data=index,
                  xlab="year",
                  ylab="population")

lattice::xyplot(mpg~wt|as.factor(cyl), 
                data = mtcars)