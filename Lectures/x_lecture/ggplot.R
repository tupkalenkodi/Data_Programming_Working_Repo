library(tidyverse)
library(ggthemes)


ggplot(data=faithful,
       mapping=aes(x=eruptions,
                   y=waiting)) +
  geom_point()
  

ggplot(faithful) +
  aes(eruptions, waiting) +
  geom_point() +
  ggthemes::theme_excel_new()


ggplot(faithful, aes(x=eruptions,
                     y=waiting))+
  geom_point(size=3) +
  theme_solarized()

ggplot(faithful) +
  aes(eruptions, waiting,
      colour=eruptions<3) +
  geom_point()

ggplot(faithful) +
  aes(eruptions, waiting) +
  geom_point() +
  geom_density2d()



