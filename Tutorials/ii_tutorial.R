#A
m1 = matrix(1:9, nrow=3, byrow=T)
df1 = data.frame(c("Peter", "Klavdija", "Uros"), 
                 c("Mursic","Kutnar","Godnov"), 
                 c(T,F,T))
colnames(m1) = c("column1", "column2", "column3")
rownames(m1) = c("row1", "row2", "row3")
rownames(m1)[2] = "mouse"
m1["mouse", "column3"] = 100
m1[, "column2"] = c(10, 11, 12)
colnames(df1) = c("Name", "Surname", "Gender")
year =  c(88, 80, 75)
df1 = cbind(df1, year)
df1 = rbind(df1, c("Ademir", "Hujdurovic",
                   TRUE,87))



#B
v1 = 1:26
names(v1) = letters
v1[c("a","e","i","o","u")]
l1 = list(m1, df1, v1, 5)
names(l1) = c("matrix", "dataframe", 
              "vector", "number")
l1["number"] = 6
l1 = l1[4:1]
l1[[1]]
l1$vector<-c(l1$vector[1:19],sh=19.5,l1$vector[-(1:19)])
l1$dataframe[1:2,]



#C
f1 = factor(c(1,2,3,1,2,3,2,0,3,4))
summary(f1)["3"]
levels(f1)[3] = 6
month.name[unique(airquality$Month)]
length(unique(mtcars$cyl))



#D
#1
vpH<-runif(100, 0, 14)
vpH_factor = cut(vpH, 
                 breaks = c(-Inf, 3, 6, 8, 11, Inf), 
                 labels = c("s.acid", "w.acid", "neutral", "w.base", "s.base")
)
summary(vpH_factor)["s.acid"]

#2
children = sample(0:6, 65, replace=T)
children_factor = cut(children,
                      breaks = c(-Inf, 0, 1, 2, Inf),
                      labels = c("0", "1", ">=2",
                                 ordered_result = T))

#3
drinks = factor(rep(c("Coffee",
                      "Tea",
                      "Beer",
                      "Juice"),
                    30))
drinks_reordered = sample(drinks)
drinks_reordered[order(drinks_reordered)]



#E
paste(sample(LETTERS, 50, replace = T),
      sample(letters[c(1,5,9,15,21)], 50, replace = T),
      sample(letters[-c(1,5,9,15,21)], 50, replace = T),
      sample(letters[c(1,5,9,15,21)], 50, replace = T),
      sample(letters[-c(1,5,9,15,21)], 50, replace = T),
      sep="")
iris[iris$Species=="setosa" & iris$Petal.Length<1.5, ]
airquality[airquality$Temp>=50 & airquality$Temp<=60, ]
airquality[airquality$Wind, c("Wind", "Day", "Month")]