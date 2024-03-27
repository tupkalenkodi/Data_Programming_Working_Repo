# Manual way
mean(mtcars$mpg)
mean(mtcars$cyl)
mean(mtcars$hp)

# apply
apply(mtcars, 2, median)
apply(mtcars, 2, min)
apply(mtcars, 2, max)

# sapply; Returns a vector if possible
sapply(mtcars, mean)
sapply(mtcars, min)
sapply(mtcars, max)

# lapply; Returns a list if possible
lapply(mtcars, mean)
lapply(mtcars, min)
lapply(mtcars, max)

# tapply; 
tapply(mtcars$mpg, mtcars$cyl, mean)

# Additional parameters
sapply(airquality, mean, na.rm = TRUE)