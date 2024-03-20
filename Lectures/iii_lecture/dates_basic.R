library(lubridate) # Part of tidyverse library
library(tidyverse)


Sys.time()
Sys.Date()


start = Sys.time()
Sys.time() - start

now() # Both the time and the date
today() # Only the date
start1 = now()
now() - start1

# The general format is "y-m-d" and "h:m:s"
date = "05/04/2024"
time = "18:51:32"
datetime = paste(date, time)

dmy_hms(datetime)
ymd("2017-08-12")
# Specifying the local settings for the dates e.g month names
mdy("Januar 31, 2017", locale = "sl_SI.utf8")
dmy("20 Березня 2023", locale = "uk_UA.utf8")

make_date(1881, 4, 20) # Year, Month, Day


# LAB
d1 <- "January 1, 2010"
mdy(d1)

d2 <- "2015-Mar-07"
ymd(d2)

d3 <- "06-Jun-2017"
dmy(d3)

d4 <- c("August 19 (2015)", "July 1 (2015)")
mdy(d4, locale="en_EN.utf8")

d5 <- "12/30/14" # Dec 30, 2014
mdy(d5)


x = ymd_hms("2019-05-05 19:23:13")
year(x)
month(x)
month(x, label = TRUE, abbr = TRUE) # Displays the name of the month
day(x)
wday(x)
yday(x)
yday(today())



#LAB
born = dmy("15/07/2004")
# Day I was born
wday(born)

# Day of my 40th Birtdhay
anni = born
year(anni) = year(anni) + 40
wday(anni)
