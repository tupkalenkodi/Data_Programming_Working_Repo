library(tidyverse)
library(janitor)


airquality |> 
  clean_names() |> 
  as_tibble() |> 
  dplyr::select(day, month, temp) |> 
  dplyr::filter(between(day, 1, 4)) |> 
  pivot_wider(names_from = "month",
              values_from = "temp")


df = mpg |> 
  count(class, manufacturer, 
        sort = TRUE)

df_wider = df |> pivot_wider(names_from = "class",
                  values_from = "n", values_fill = 0)


df_wider |> pivot_longer(cols = pickup:`2seater`, 
                         names_to = "car_class",
                         values_to = "sales")



# LAB
mtcars |> 
  mutate(car_names =  rownames(mtcars)) |> 
  pivot_longer(cols = -car_names,
               names_to="attribute",
               values_to="attribute_value")
