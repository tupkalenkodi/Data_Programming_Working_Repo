library(tidyverse)


df = mtcars |> 
  count(cyl)

ggplot(df) +
  geom_bar(aes(x=cyl, y=n),
           stat = 'identity')



