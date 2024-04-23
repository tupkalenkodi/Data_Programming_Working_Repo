library(tidyverse)
library(janitor)


fTOc = function(x) {
    round((x-32)*5/9, 0)
}

input = c(100, 102, 99)
fTOc(input)

airquality |> 
  clean_names() |> 
  mutate(temp_c = fTOc(temp)) |> 
  head()

stupidFunction<-function(x,y){
  return(sum(x,y))}

# This will make a row with the values
# equal to the sum of two whole columns
airquality |> 
  mutate(something=stupidFunction(Month, Day)) |> 
  head(3)

# First solution: vectorizing
stupidFunction_v = Vectorize(
  stupidFunction)

airquality |> 
  mutate(something=stupidFunction_v(Month, Day)) |> 
  head(3)

# Second solution: rowwise
airquality |> 
  rowwise() |> 
  mutate(something=stupidFunction(Month, Day)) |>
  ungroup() |> 
  head(3)

# Third solution: group_by + rownumber()
airquality |> 
  mutate(id=row_number()) |> 
  group_by(id) |> 
  mutate(something=stupidFunction(Month, Day)) |>
  ungroup() |> 
  head()

# OR
airquality |> 
  mutate(id=row_number()) |> 
  mutate(something=stupidFunction(Month, Day),
         .by = c(id)) |>
  head()


airquality |> 
  mutate(sum_of_3_columns=Temp+Month+Day) |> 
  head()

airquality |> 
  rowwise() |> 
  mutate(sum_of_three_columns = 
           sum(c_across(c(Temp, 
                          Month, 
                          Day)
                        )
               )
         ) |> 
  head()
  
