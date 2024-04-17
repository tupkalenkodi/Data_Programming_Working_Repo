library(tidyverse)


mtcars |> as_tibble()

# Assume we want to relocate the 10th
# column as the first one

# Works but not the best
mtcars[, c(10, 1:9, 11)] |> as_tibble()

# Using tidyverse
mtcars |> 
  relocate(mpg, .after = "wt") |> 
  as_tibble()

mtcars |> 
  relocate(mpg, .before = "wt") |> 
  as_tibble()


mtcars |> 
  mutate(car_name = rownames(mtcars)) |>
  relocate(car_name, .before = "mpg") |> 
  as_tibble()


mtcars |> 
  mutate(car_name = rownames(mtcars)) |>
  relocate(car_name, .before = "mpg") |> 
  group_by(cyl) |> 
  mutate(max_mpg=max(mpg)) |> 
  relocate(max_mpg, .after = "mpg") |> 
  dplyr::select(car_name, cyl, mpg, max_mpg) |> 
  filter(max_mpg == mpg)

# OR
mtcars |> 
  mutate(car_name = rownames(mtcars)) |>
  relocate(car_name, .before = "mpg") |> 
  group_by(cyl) |> 
  slice_max(n=1, order_by = mpg)



