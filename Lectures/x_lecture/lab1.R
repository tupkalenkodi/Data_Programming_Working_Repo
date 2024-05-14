library(tidyverse)


ggplot(faithful) + 
  geom_point(aes(x = eruptions, y = waiting), 
             size=2.5, 
             shape=15,
             alpha=0.4)

ggplot(faithful)+
  aes(eruptions,
      fill=eruptions<3)+
  geom_histogram()



ggplot(faithful)+
  aes(eruptions,
      fill=waiting<60,
      position='dodge')+
  geom_histogram()

ggplot(faithful) +
  geom_point(aes(x=eruptions, y=waiting)) +
  geom_vline(xintercept=3) +
  geom_hline(yintercept=70)

dfav = mpg |> 
  summarise(mean=mean(hwy), .by = "class")

ggplot(mpg) +
  geom_jitter(aes(x=class, y=hwy),
              width = 0.2) +
  stat_summary(fun = mean, color = 'blue',
               aes(x=class, y=hwy),
               size = 1)


ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, colour = class)) + 
  scale_colour_brewer(type = 'qual')