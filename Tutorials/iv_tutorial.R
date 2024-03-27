library(tidyverse)
library(readxl)


# A.
today()
month(today(), label=TRUE, abbr=FALSE)
wday(today(), label=TRUE, abbr=FALSE)
v1 = c("13.1.2021","3.Jan.2011","4 March 14")
dmy(v1)
dmy("31.12.2024") - dmy("1.1.2024")
xmas = dmy("25.12.2010")+years(0:9)
wday(xmas,T,F)
year(xmas[wday(xmas) %in% 2:6])

#8
years = (dmy("03.01.2021")) + years(0:100)
years[wday(years) == 1] = years[wday(years) == 1] + days(1)
years[wday(years) == 7] = years[wday(years) == 7] + days(2)
years



# B.
# 1.
dB1 = mdy("April 5th 22")
dB2 = dmy("30.1.2020") 
dB3 = mdy("2/14/00")
dB4 = ymd("2010-6-19") 
dB5 = dmy("4. Jan 1999")

# 2.
format(dB1, "%d.%m.%Y")
format(dB2, "%d/%m/%y")
format(dB3, "%Y-%m-%d")
format(dB4, "%d. %b %Y")
format(dB5, "%B %dth %y")

# 3.
df1 = read_xls("./Tutorials/DataTutorial/Sample - Superstore.xls")
df1$"Order delay" = ymd(df1$`Ship Date`) - ymd(df1$`Order Date`)



# C.
# 1.
ymd_hms("2009-1-14 18:30:00")

# 2.
as.numeric(str_split("24.10.1999", pattern="\\.")[[1]])

# 3.
dmy_hm("1/1/2017 9:15")
x = str_split("9:15:00 5 Jan 2020", " ", n=2)[[1]]
x = paste(str_replace_all(x[2], " ", "."), x[1])
dmy_hms(x)



# D.
# 1.
anthem = "Zive naj vsi narodi
ki hrepene docakat dan,
da koder sonce hodi,
prepir iz sveta bo pregnan,
da koder sonce hodi,
prepir iz sveta bo pregnan,
da rojak
prost bo vsak,
ne vrag, le sosed bo mejak."

str_count(anthem)
length(unlist(str_split(str_replace_all(anthem, pattern="\n", " "), 
                        pattern=" ")))

# 2.
df2 = read.table("./Tutorials/DataTutorial/word.txt")
df2$V1 %>% str_split("") %>% unlist() %>% factor() %>% summary() %>% .[order(.,decreasing = T)]

#3.
C = lapply(str_split(df1$`Customer Name`, " "), function(x) x[1])
N = lapply(str_split(df1$`Customer Name`, " "), function(x) x[2])

df1$"C.N" = c(paste0(substr(C, 1, 1), ".", substr(N, 1, 1)))