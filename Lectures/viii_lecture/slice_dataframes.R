library(tidyverse)
library(readxl)


# With the slice you can specify the 
# indexes of rows you want to get
y = mtcars
x = mtcars |> 
  slice(1:20)


df = read_xlsx("./DataSets/viii_lecture.xlsx",
         sheet=3,
         skip=10)
df = df |>  slice(2:213)
