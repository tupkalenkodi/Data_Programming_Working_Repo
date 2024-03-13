library(arrow)

start = Sys.time()
dfParquet = read_parquet("./Datasets/data.parquet")
Sys.time() - start

write.csv2(dfParquet, "./Datasets/data.csv")

start = Sys.time()
dfcsv = read_csv2("./Datasets/data.csv")
Sys.time() - start

start = Sys.time()
write_parquet(dfcsv, "./Datasets/data2.parquet")
Sys.time() - start
