library(tidyverse)
library(ggthemes)
library(extrafont)
library(patchwork)
library(gganimate)


p1 = ggplot(mpg) +
  aes(y = class) +
  geom_bar() +
  facet_wrap(~year) +
  theme_classic() +
  theme(text = 
          element_text(family = 
                         "Times New Roman",
                       size = 14),
          axis.text = element_text(family = "Calibri",
                                   color = "blue",
                                     angle= 45)
        )


p2<-ggplot(mpg) + 
  geom_bar(aes(y = class)) + 
  facet_wrap(~year) + 
  labs(title = "Number of car models per class",
       caption = "source: http://fueleconomy.gov",
       x = NULL,
       y = NULL) +
  scale_x_continuous(expand = c(0, NA)) + 
  theme_minimal() + 
  theme(
    text = element_text('Avenir Next Condensed'),
    strip.text = element_text(face = 'bold', hjust = 0),
    plot.caption = element_text(face = 'italic'),
    panel.grid.major = element_line('white', size = 0.5),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.ontop = TRUE
  )


p3 = ggplot(mpg) +
  aes(y = class) +
  geom_bar() +
  facet_wrap(~year) +
  theme_classic() +
  theme(text = 
          element_text(family = 
                         "Times New Roman",
                       size = 14),
        axis.text = element_text(family = "Calibri",
                                 color = "blue",
                                 angle= 45)
  )


p1 | p2 | p3 