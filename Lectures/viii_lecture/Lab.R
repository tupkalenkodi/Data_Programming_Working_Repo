library(tidyverse)
library(readr)

field = read_csv("./DataSets/BaseBall/FieldingOF.csv")
people = read_csv("./DataSets/BaseBall/People.csv")

joined = people |> 
  inner_join(field, join_by(playerID==playerID))

joined |> 
  dplyr::filter(yearID %in% c(1940:1950)) |> 
  arrange(desc(Gcf)) |> 
  slice(2) |> select(nameFirst, nameLast)