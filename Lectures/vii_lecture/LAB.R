library(tidyverse)
library(janitor)
library(arrow)


data = read_parquet("./DataSets/data.parquet")
data |> 
  mutate(weekday = wday(tpep_pickup_datetime, 
                        label=TRUE, 
                        abbr=FALSE)) |> 
  count(weekday, payment_type) |> 
  pivot_wider(names_from = "weekday",
              values_from = "n")
