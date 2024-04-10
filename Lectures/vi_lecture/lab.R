library(arrow)
library(tidyverse)


# parquet == highly compressed csv
data = read_parquet("./DataSets/data.parquet")

# 1.
data |> 
  summarize(n(), .by = "payment_type") |> 
  arrange(desc(payment_type))

data |> count(payment_type)

# 2.
data |> mutate(wday=wday(tpep_pickup_datetime, 
                         label=TRUE, 
                         abbr=FALSE)) |> 
  summarize(mean(total_amount), 
                  .by = "wday")

# 3.
data |> mutate(wday=wday(tpep_pickup_datetime, 
                         label=TRUE, 
                         abbr=FALSE)) |> 
  summarize(mean(trip_distance), 
            .by = "wday")

# 4.
data |> 
  drop_na() |> 
  summarize(max(passenger_count), 
            min(passenger_count))

