library(tidyverse)
library(ggplot2)


ggplot(mtcars) +
 aes(x = wt, y = mpg) +
 geom_point(shape = "circle", size = 1.5, colour = "#112046") +
 labs(title = "mpg vs wt", subtitle = "First chart", caption = "mtcars") +
 theme_minimal() +
  geom_smooth(method="lm", se=FALSE)


mtcars_change = mtcars |> 
  mutate(cyl=as.character(cyl))
