library(tidyverse)


# rename()
# new_name = old_name
# the left hand side is the name of the column to be used.
# the right hand side is the name of the EXISTING
# column to be renamed

airquality |> rename("Ozone var" = "Ozone") |> 
  as_tibble()

# rename_with(~function, which_columns(default=every_column))
mtcars |> 
  clean_names() |> 
  # .x stands for the universal value. In this case it is the value we 
  # get from colnames()
  rename_with(~stringr::str_c("mtcars_", .x)) |> 
  colnames() 


# summarize()
mtcars |> summarize(mean_mpg2=mean(mpg), max(cyl), n()) |> 
  clean_names()

mtcars |> 
  group_by(cyl) |> 
  summarize(mean(mpg), max(cyl), n()) |> 
  clean_names() |> 
  ungroup()

mtcars |> 
  summarize(mean(mpg), 
            max(cyl), 
            n(),
            .by="cyl")

mtcars |> 
  summarise(across(.cols=everything(),
                   .fns=list(mean_value=mean,
                             max_number=max,
                             min_number=min),
                   .names="{.fn}_{.col}"))

airquality |> 
  clean_names() |> 
  summarise(across(.cols=ozone:temp,
                   .fns=list(mean_value=\(x) round(mean(x, na.rm=TRUE), 1)),
                   .names="{.fn}_{.col}"),
            .by="month")


# tidyverse filter
# In this example we can also use:
# dplyr::filter(between(month, 5, 7))
airquality |> 
  clean_names() |> 
  dplyr::filter(month %in% 5:7)|> 
  summarise(across(.cols=ozone:temp,
                   .fns=list(mean_value=\(x) round(mean(x, na.rm=TRUE), 1)),
                   .names="{.fn}_{.col}"),
            .by="month")


# mutate() function
# Imagine we have a column with the temperature in Fr,
# and we want to create a column with the temperature in Celcium
df = airquality |>
  clean_names() |> 
  mutate(temp_celsius = round((temp-32)*5/9),0) |> 
  select(-c(temp, '0')) |> 
  rename("temp"="temp_celsius")

df |> select(month, temp) |> 
  summarise(average_temperature=mean(temp),
            .by="month")

df |> drop_na() |> as.tibble()


iris |> 
  mutate(across(where(is.numeric), 
                as.character,
                .names="{.col}_char"))|> 
  as_tibble()

  