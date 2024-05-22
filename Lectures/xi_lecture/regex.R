string = c("car", "cars", "olegcar")
pattern = "car"

# grep, returns indexes
grep(pattern, string)

# str_detect, returns boolean vector
str_detect(string, pattern)

string = c("car", "cars", "in a car",
           "truck", "car's trunk")
string |> 
  grep(pattern = "^c.r")

string |> 
  grep(pattern = "^c..$")

string |> 
  grep(pattern = "^c.r.$")

# w - pattern match, W - negation of w
grep("\\w", 
     c(" ", "a", "1", "A", "%", "\t"))

# Difference between grep and \\w
string1 = c("car", "car ", "ca r")

string1 |> 
  grep(pattern = "^c.r.$")

string1 |> 
  grep(pattern = "^c.r\\w$")

# \\w is an alpha numerical character, 
# that is nto a space, tab etc.

# \\s is a spaces: white_spaces, tabs, newlines

# \\d is digits

# again capital letters are negations

grep("^[abc]\\w\\w", 
     c("car", "bus", "no", "cars", "ca "))

grep("^[a-cC]\\w\\w$", 
     c("car", "bus", "no", "cars", "ca ", "Car"))

grep("^[a-zA-Z]\\w\\w$", 
     c("car", "bus", "no", "cars", "ca ", "Car"))

# ^b - negation of b, that is any character that is not b
grep("^[^b]\\w\\w$", 
     c("car", "bus", "no", "cars", "ca ", "Car"))

grep("^[^cb]\\w\\w$", 
     c("car", "bus", "no", "cars", "ca ", "Car"))

string = c("a", "ab", "acb", "accb", "accb")
grep("ac*b", string)
grep("ac+b", string)
grep("ac?b", string)
grep("(ac)+b", string)
grep("ac{2,3}b", string)


grep("^[a-z]{3,5}$", 
     c("no", "words", "words or sentences", "123 no",
       "Words", "word", "word 123", "helloy"))


text<-"Yesterday I had 100 Euros, today I only have 45 Euros left."
gregexpr("(\\d+)",text)


str_extract_all(text, "\\d+") |> list_c()