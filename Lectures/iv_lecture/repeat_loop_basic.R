i = 1
repeat {
  
  print(i)
  i = i+1
  if (i == 10000) {
    break
  }
}

# It's necessary to use break statement in this types of loop, otherwise
# the loop will be entered infinitely many times