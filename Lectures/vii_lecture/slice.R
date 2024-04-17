library(tidyverse)
library(janitor)


mtcars |> 
  mutate(car = rownames(mtcars)) |> 
  select(car, mpg, cyl) |> 
  slice_max(n=2, order_by = mpg, by="cyl")

mtcars |> slice_sample(n=10)