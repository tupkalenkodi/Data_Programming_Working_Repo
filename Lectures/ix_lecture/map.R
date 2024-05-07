library(tidyverse)
library(janitor)

# The map function is similar to apply family
# functions, but can be used in tidyverse syntax.
map(airquality, mean, na.rm=TRUE)
airquality |>
  map(mean, na.rm=TRUE)

sum_function = function(x, y) {
  res = x + y
  return(res)
}

airquality |> 
  clean_names() |> 
  mutate(new_column =
           sum_function(month, day))

# The default map takes only 1 variable
# While, map2 takes 2 variables

# progress bar
x = map(1:100, \(x) Sys.sleep(0.1), .progress = "TRUE")

# In Quarto if we want to to run only the new chunks
# we need to set cash = TRUE


# map returns list
# if we want to get vector, we can use vec_map

