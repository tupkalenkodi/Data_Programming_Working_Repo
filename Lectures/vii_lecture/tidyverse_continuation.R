library(tidyverse)


sales_data <- tibble(
  salesperson = c('Alice', 'Bob', 'Catherine', 'Alice', 'Bob', 'Catherine', 'Alice', 'Bob', 'Catherine'),
  region = c('East', 'East', 'East', 'West', 'West', 'West', 'North', 'North', 'North'),
  sales = c(300, 250, 450, 500, 400, 550, 600, 350, 500)
)

sales_data |> 
  group_by(salesperson) |> 
  summarise(average_sales=mean(sales)) |> 
  ungroup()

# This is equivalent to:
sales_data |> 
  summarise(average_sales=mean(sales), 
            .by = "salesperson")
  

# If you want to work with the grouped data further,
# then it is better to use the first option

mtcars |> 
  group_by(cyl) |> 
  slice_max(n=3, order_by = mpg) |> 
  ungroup()