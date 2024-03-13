library(stringr)
library(janeaustenr)


paste(2, "is the lowest prime number!")
paste0(2, "is the lowest prime number!")

str_c(2, "is the lowest prime number!", 
      sep = " ")

df = data.frame(id = c(1:3), name = c("Jane", NA, "John"))
df

paste(NA, "is the unknown value")
str_c(NA, "is the unknown value")

name = c("John", "Jane", "Jim", "Janam")
str_c(name, collapse = ", ")

nchar(name)
stringr::str_length(name)

str_sub(name, 1, 3)
str_sub(name, -3, -1)
name[str_ends(name, "m")]

pizzas <- c("cheese", "pepperoni", 
            "sausage and green peppers")
str_detect(pizzas, pattern = "pepper")
str_subset(pizzas, "pepper")
str_count(pizzas, "pepper")

collapsed = str_c(pizzas, collapse = ", ")
str_count(collapsed, "pepper")

books = janeaustenr::austen_books()
lines = str_c(books$text, collapse = ", ")
str_count(lines, pattern = "Anne")
str_count(lines, pattern = "hate")

date_ranges <- c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")
split_dates <- str_split(date_ranges, pattern = " - ", simplify = TRUE)
split_dates[, 2]

#Simple replace substitutes only the first 
#occurence of the pattern in each string
ids <- c("ID#: 192 ID#: ", "ID#: 118", "ID#: 001")
# Replace "ID#: " with ""
id_nums <- str_replace(ids, "ID#: ", "")
id_nums

#While replace all substitutes all
phone_numbers <- c("510-555-0123", "541-555-0167")
str_replace_all(phone_numbers, "-", ".")
