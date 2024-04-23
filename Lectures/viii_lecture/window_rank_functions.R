library(tidyverse)


df = mtcars
df |> 
  group_by(cyl) |> 
  mutate(id = row_number()) |> 
  arrange(id) |> 
  relocate(id, .before = "mpg")

# ntile : creates groups based on certain column,
# depending on the values
df |> 
  mutate(groups=ntile(mpg, 3)) |> 
  relocate(groups, .before = "mpg") |> 
  arrange(groups, mpg)

# min_rank : groups by equal values
df |> 
  mutate(minrank=min_rank(hp)) |> 
  relocate(minrank, .before = "mpg") |> 
  arrange(minrank)

# dense_rank : the same but does not skip any values
df |> 
  mutate(denserank=dense_rank(hp)) |> 
  relocate(denserank, .before = "mpg") |> 
  arrange(denserank)











df<-iris%>%slice_sample(n=10)
df%>%mutate(id=row_number(), 
            groups=ntile(Species,5),
            minrank=min_rank(Species), 
            denserank=dense_rank(Species))%>%
  select(-contains("Petal"),-contains("Sepal"),)