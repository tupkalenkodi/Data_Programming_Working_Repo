library(lubridate)
x = c(2, 5, 7, 9)
ifelse(x %% 2 == 0, "even", "odd")


# randomNums = c()
# for (i in 1:100000){
#   randomNums = c(randomNums, 
#                  sample.int(1000000, 1))
# }

# evenNum = c()
# oddNum = c()
# for (element in randomNums){
#   if (element %% 2 == 0){
#     evenNum = c(evenNum, element)
#   } else {
#     oddNum = c(oddNum, element)
#   }
# }


randomNums = sample(1000000, 1000000)
evenNum = sum(ifelse(randomNums %% 2 == 0, 1, 0))/length(randomNums)
oddNum = 1 - evenNum

print(paste("Ratio of odd: ",
oddNum,"Number of even: ",
evenNum))


a = sample(1000000, 10000)
b = sample(1000000, 10000)

start = now()
res = c()
for (i in 1:length(a))
  res = c(res, a[i] + b[i])
now() - start

start = now()
a + b
now() - start


for (i in 1:10){
  if (i == 5){
    next
    print("Hello")
  }
  
  print(i)
}

for (j in 20:25) {
  for (i in 1:5) {
    if (i == 3){
      break
    }
    print(i)
  }
  print(j)
}

  

