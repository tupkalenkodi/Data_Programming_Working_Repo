library(tidyverse)


data <- tibble(
  time = 1:5,
  measurement = c(NA, 3, NA, NA, 5)
)

data |> 
  fill(measurement, 
       .direction = "up")

data |> 
  fill(measurement, 
       .direction = "down")

data |> 
  fill(measurement, 
       .direction = "updown")