library("readxl")
library("writexl")


#A
dir.create("./Tutorials/DataTutorial")
dfA <- read_excel("./Tutorials/DataTutorial/file_example_XLS_50.xls", 
                  skip=2)
dfA2 <- read.csv("https://datahub.io/core/country-list/r/data.csv")
write_xlsx(dfA2, "Tutorials/DataTutorial/data.xlsx")

list.files("./Tutorials/DataTutorial")



#B
TS_Covid <- read.csv("Tutorials/DataTutorial/time_series_covid19_confirmed_global.csv")
TS_Covid_Slo_last_week <- TS_Covid[TS_Covid$Country.Region=="Slovenia", ncol(TS_Covid)-7:0]
write.csv(TS_Covid_Slo_last_week, "Tutorials/DataTutorial/CovidSlo_Lastweek.csv")
sum(TS_Covid[, ncol(TS_Covid)]) - sum(TS_Covid[, ncol(TS_Covid)-1])
COVID_Yesterday <- TS_Covid[, c(2, ncol(TS_Covid)), drop=F]
write.csv(COVID_Yesterday, gzfile("Tutorials/DataTutorial/CV_yesterday.csv.gz"))



#C
unzip("Tutorials/DataTutorial/SLO.zip", exdir = "Tutorials/DataTutorial")
file.rename("Tutorials/DataTutorial/SI.txt", "Tutorials/DataTutorial/SLO.txt")
dfC <- read.table("Tutorials/DataTutorial/SLO.txt", sep = "\t")
dfC <- dfC[-(4:9)]
dfC[grep("z", dfC$V3), "V3", drop=F]
dfC[grep("[hH]", dfC$V3), "V3", drop=F]
dfC[grep("r$", dfC$V3), "V3", drop=F]
coast <- dfC[dfC$V2 %in%  c(6000:7000), 2:3]
write.table(coast, "Tutorials/DataTutorial/SLO_coast.txt", sep = "/t")


#D
dfD <- read_excel("Tutorials/DataTutorial/Sample - Superstore.xls")
dfD_hundred <- dfD[seq(100, nrow(dfD), 100), 1:7]
write_xlsx(dfD_hundred, "Tutorials/DataTutorial/Sample - Superstore - hundred.xls")
cst_names <- unique(dfD$`Customer Name`)
cst_names[grep("[A-z]+ [A-z]+ [A-z]+", cst_names)]
dfD2 <- read_excel("Tutorials/DataTutorial/Sample - Superstore.xls", sheet=2)



