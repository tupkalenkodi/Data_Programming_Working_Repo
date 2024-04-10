library(tidyverse)
library(janitor)


mtcars|>
  arrange(cyl, desc(mpg))|>
  dplyr::select(mpg, cyl)


# count
mtcars |> 
  count(cyl, sort=TRUE, name="no_of_cars")



# drop_na
airquality |> 
  clean_names() |>
  drop_na(ozone) |> 
  count(ozone) 

# If we want to get rid of na in the whole data frame,
# we can do the following:
airquality |> clean_names() |> drop_na()

# complete.cases
airquality |> drop_na() |> complete.cases()

# na.omit
airquality |> na.omit()


# Difference between the tibble and data frame
airquality |> class()

# The number of rows displayed is always 10, 
# number of columns depends on the display resolution
airquality |> drop_na() |> as_tibble() 