ggplot(mpg)+
  geom_point(aes(x=displ,
                 y= hwy)) +
  facet_wrap(~class, scales = "free")

ggplot(mpg) + 
  geom_bar(aes(x = class)) + 
  coord_cartesian(ylim = c(0, 40))

dfmt<-mtcars |> 
  mutate(car=row.names(mtcars)) |> 
  arrange(desc(mpg))


dfmt |> 
  head(16) |> 
  ggplot()+
  aes(x=reorder(car, mpg), y=mpg)+
  geom_bar(stat = "identity") +
  facet_grid(cyl~., space = "free",
             scale = "free") +
  coord_flip()