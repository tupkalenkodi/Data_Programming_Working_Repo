library(tidyverse)



people <- tibble(
  name = c('Alice', 'Bob, Jane', 'Catherine', 'David', 'Emma'),
  age = c(25, 58, 33, 15, 46)
)

people

# if_else(condition, true, false)
people |> 
  separate_longer_delim(name, ", ") |> 
  mutate(age_group = 
           if_else(age<18, "Child",
                   if_else(age>50, "Adult", "Young adult")))

# case_when
people |> 
  mutate(age_group = 
           case_when(age<18~"Child",
                     age>50~"Adult",
                     age>40~"Bla",
                     .default = "Young Adult"))
