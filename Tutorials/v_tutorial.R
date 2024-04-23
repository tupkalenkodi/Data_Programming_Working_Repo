library(tidyverse)


# A.

# 1.
fact = function(n){prod(1:n)}

# 2.
fact_rec = function(n){if (n <= 1) {1} else {n * fact_rec(n-1)}}

# 3.
positive_assertion = function(x){if (x > 0) {TRUE} else {FALSE}}

# 4.
sapply(1:6, fact)



# B.

# 1.
incircle = function(x, y){if (sqrt(x^2 + y^2) <= 1) {TRUE} else {FALSE}}

# 2.
x = seq(0, 1, 0.1)
y = x
mapply(incircle, x, y)

# 3. 
nrt = function(x, n=2){x^(1/n)}



# C.

# 1.
min_matrix = function(m){apply(m,2,  min)}

# 2.
minesweeper = function(nrow, ncol, nmines = floor(1/5 * nrow * ncol)){
  if (nrow > 0 & ncol > 0 & nmines %in% 0:(nrow * ncol)){
    mine_field = matrix(FALSE, nrow, ncol)
    mine_field[sample(nrow * ncol, nmines)] = TRUE
    return(mine_field)
  } else {
    message("Input does not make sense") 
    return(NaN)}
}



# D.

# 1.
aggregate2 = function(vector,df,fun){apply(df,
                                           2,
                                           function(x){tapply(x, vector, fun)})}


# 2.
translate = function(phrase, df){
  tmp = phrase
  for (i in 1:nrow(df)){
    tmp = gsub(df[i, 1], df[i, 2], tmp)
  }
  return(tmp)
}

