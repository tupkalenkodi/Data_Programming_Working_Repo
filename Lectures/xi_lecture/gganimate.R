library(tidyverse)
library(ggthemes)
library(extrafont)
library(gganimate)
library(gifski)
library(ggrepel)

g1 = ggplot(economics) +
  geom_line(aes(x = date, y = unemploy)) +
  geom_text(aes(x = ymd("1985-01-01"), 
                 y = 13000,
                 label = "Bad times in the 80's")) +
  geom_text(aes(x = ymd("2010-01-01"), 
                y = 16000,
                label = "Bad times in the 2010's")) +
  transition_time(date)

animate(g1, 
        renderer = gifski_renderer())


g2 = ggplot(mpg) +
  geom_bar(aes(x = factor(cyl))) +
  labs(title = "Number of cars in {closest_state} by number of cylinders") +
  transition_states(states = year) +
  enter_grow() +
  exit_fade()

animate(g2, 
        renderer = gifski_renderer())


mtcars |> 
  mutate(car=row.names(mtcars)) |> 
  ggplot()+
  aes(x=wt, y=mpg, label=car)+
  geom_point(size=2)+
  geom_hline(yintercept = 12,
             linetype="dashed",
             color="red")+
  geom_text(aes(x=2, y=10,
                label="Not buying these cars!")) +
  geom_hline(yintercept = 30,
             label = "Best-selling cars")