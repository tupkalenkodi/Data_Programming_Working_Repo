# We can specify the default value for any of the
# parameters of the function

simpleFunction = function(x, y=4) {
  return (  paste0("The result of sum  of x and y is: ", x+y));
}

simpleFunction(x=3, y=5)
simpleFunction(x=3)


power <- function(x, y) {
  # function to print x raised to the power y
  result <- x^y
  return (paste(x,"raised to the power", y, "is", result))
}

power(y=2, x=4)


divide_multiply = function(x, y) {
  divide = x / y
  multiply = x * y
  
  return(list(div=divide, mult=multiply))
}

divide_multiply(5, 6)


# ANONYMOUS functions
lapply(c(1:3), function(x) { 3 * x})
mtcars_tmp = mtcars
mtcars_tmp = sapply(mtcars_tmp, function(x) {3 * x})

dummyVector = c("1", "10", "b", "15")
sapply(dummyVector, function(x) {
  x_numeric = as.numeric(x)
  sqrt(x_numeric)
})