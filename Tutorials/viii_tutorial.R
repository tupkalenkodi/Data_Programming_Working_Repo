library(tidyverse)
library(janitor)


# A
# 1.
airquality |> 
  clean_names() |> 
  select((ncol(airquality) - 3):ncol(airquality)) |> 
  drop_na() |> 
  as_tibble()

# 2.
airquality |> 
  slice_sample(prop=1/15) |> 
  select(contains('o'))
  
# 3.
airquality |> 
  mutate(temp_cel = (Temp-32)*5/9) |> 
  summarise(max(temp_cel), min(temp_cel), mean(temp_cel))

# 4.
airquality |> 
  filter(Solar.R == max(Solar.R, na.rm = TRUE) |
           Solar.R == min(Solar.R, na.rm = TRUE))



# B
# 1.
df = mtcars |>  rownames_to_column("Type")

# 2.
df |> 
  select(Type, hp) |> 
  filter(grepl("^Merc", Type)) |> 
  summarise(mean(hp))

# 3.
df |> summarise(count = n(), .by = cyl)

# 4.
df |> 
  summarise_if(is.numeric,c(max=max,min=min))



# C
# 1.
USArrests |> count()

# 2.
USArrests |>  slice_max(Murder, n=3) |>  rownames()
USArrests |>  slice_max(Assault, n=3) |>  rownames()
USArrests |>  slice_max(UrbanPop, n=3) |>  rownames()
USArrests |>  slice_max(Rape, n=3) |>  rownames()

# 3.
USArrests |> 
  mutate(total_crime = Murder + Assault + UrbanPop + Rape) |> 
  arrange(desc(total_crime))




  