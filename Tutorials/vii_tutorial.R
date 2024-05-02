library(tidyverse)
library(ggplot2)

# A.
# 1.
n<-1000
x<-(1:n-1)^((sqrt(5)-1)/2)*cos((1:n-1)*2*pi*(sqrt(5)-1)/2)
y<-(1:n-1)^((sqrt(5)-1)/2)*sin((1:n-1)*2*pi*(sqrt(5)-1)/2)

plot(x, y)
lattice::dotplot(y~x)
data.frame(X=x,Y=y) |> ggplot()+aes(x=X,y=Y)+geom_point()


# 2.
plot(x2<-seq(-100,100,1)/100*pi,y2<-sin(x2),type='l')

# 3.
x3 = seq(-100, 100, 1) / 100 * pi
plot(sin(x3), cos(x3), type = 'l', col = 'purple')
lines(c(1,1,-1,-1,1),c(1,-1,-1,1,1),type='l',col="green")



# B.
# 1.
count_num_of_points = function(n){
  x = sample(200, n, replace = TRUE)
  y = sample(200, n, replace = TRUE)
  x = (x - 100) / 100
  y = (y - 100) / 100
  
  x_circle = seq(-100, 100, 1) / 100 * pi
  plot(sin(x_circle), cos(x_circle), type = 'l', 
       col = 'purple')
       
  lines(c(1,1,-1,-1,1),c(1,-1,-1,1,1),type='l',
        col="green")
  
  incircle =  function(x,y)sqrt(x^2+y^2)<=1
  points(x, y, 
         col = ifelse(incircle(x, y), 'red', 'green'))
  
  count = sum(incircle(x, y))
  return((4 * count) / n)
}


# 2.
n = 100

x = runif(n, -1, 1)
y = runif(n, -1, 1)

df = data.frame(x = x, y = y, distance = x^2 + y^2)
df |> ggplot(aes(x, y)) +
               geom_point(aes(size = distance, 
                         color = distance)) +
               scale_size_continuous(range = c(0.5, 2)) +
               scale_color_gradient(low = "#58935A", 
                                    high = "#F3C145")



# C.
iris[iris$Species=="setosa",] |>  
  ggplot(aes(x = Petal.Length, 
                fill = Species)) + geom_bar()



# D.
dfB1<-data.frame(labels=c("no","no, but in yellow"),"values"=c(7,1))
ggplot(dfB1, aes(x="", y=values,fill=labels))+
  geom_bar(width = 1, stat = "identity")+coord_polar("y", start=0.2)+
  scale_fill_manual(values=c("blue", "yellow"))+
  #  ggtitle("Is this meme funny?")
  labs(title="Is this meme funny?",x="",y="")+
  theme(plot.title = element_text(size=30),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        legend.title=element_blank(),
        legend.text = element_text(size = 16, face = "bold"))

