library(tidyverse)

# Intro
filename = "./Tutorials/ix_tutorial/SportsDatabase.xlsx" 
L = filename |> 
  readxl::excel_sheets() |> 
  sapply(\(x){readxl::  read_excel(filename,sheet=x)})



# A
x = L$Teams |> inner_join(L$Players, by = "TeamID")

# 1.
x |> summarise(n(), .by = Nickname)

# 2.
x |> filter(grepl('Blue', Colors)) |> select(FirstName, LastName)



# B.
x =  L$Teams |> inner_join(L$Games, by = c("TeamID" = "HomeTeamID"))
x = x |> inner_join(L$Teams, by = c("VisitTeamID"="TeamID"))

# 1.
x |> 
  filter(ymd(DatePlayed) == dmy("12.9.2005")) |> 
  select(Nickname.x, Nickname.y)

# 2.
x |> 
  rename(Home = Nickname.x, Visit = Nickname.y) |> 
  pivot_longer(cols = c(Home, Visit), 
               names_to = "Home/Visit",
               values_to = "Teams") |> 
  select("Home/Visit", "Teams")



# C.
# 1.
x |>  
  select(contains("name"),contains("date")) |> 
  pivot_wider(names_from=Nickname.x, values_from = DatePlayed) |> 
  rename("Visit\\Home" = "Nickname.y")

# 2.
fpoints = function(x, y){
  case_when(x>y~3, x==y~1, TRUE~0)
}



# D.
# 1.
L$Coaches |> 
  left_join(L$Games, by=c("TeamID"="HomeTeamID"), na_matches = "never") |> 
  group_by(FirstName, LastName) |> 
  summarise(played=sum(!is.na(TeamID)))

# 2.
library(dplyr)

x_home = x |> 
  mutate(total_points = fpoints(HomeScore, VisitScore)) |> 
  select(Nickname.x, total_points) |> 
  rename("Team"="Nickname.x")


x_visit = x |> 
  mutate(total_points = fpoints(VisitScore, HomeScore)) |> 
  select(Nickname.y, total_points) |> 
  rename("Team"="Nickname.y")

rbind(x_home, x_visit) |>  
  summarise(total_points = sum(total_points), .by = Team)





