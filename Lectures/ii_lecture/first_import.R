library(readr)
library(WriteXLS)
library(readxl)

#Import of the dataset via the link.
df = read_csv("https://raw.githubusercontent.com/urosgodnov/datasets/master/BT.csv")

#Export to (i) the inner folder of the working repo
#          (ii) the subfolder
write.csv(df, "BT_comma.csv")
write.csv2(df, "./datasets/BT_semi.csv")

#Exporting into excel file
write_excel_csv(df, "./datasets/bf.xslx")
