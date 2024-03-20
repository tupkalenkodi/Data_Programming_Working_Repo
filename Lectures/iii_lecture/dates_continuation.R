library(arrow)

# The first lab
nyc <- read_parquet("DataSets/data.parquet")
pickup = nyc$tpep_pickup_datetime

day_distr = wday(pickup, locale="en_EN.utf8", label=TRUE, abbr=FALSE)

day_summary = summary(day_distr)
max_day = names(day_summary)[which.max(day_summary)]
max_day


# Age manipulations
my_age = difftime(today(), born, units = "secs")
seconds_to_period(my_age)



# The second lab
ride_duration = difftime(nyc$tpep_dropoff_datetime, 
                         nyc$tpep_pickup_datetime, units = "mins")
av_ride_duration = mean(ride_duration, na.rm=TRUE)
print(paste("The average duration of the taxi ride in NYC (In minutes) is:", 
            floor(av_ride_duration)))



# Format
format(today(), "%A, %d, %m, %Y")
Sys.getlocale()



# The third lab
sum(wday(nyc$tpep_pickup_datetime) != wday(nyc$tpep_dropoff_datetime))

# The sub-part
ride_duration = difftime(nyc$tpep_dropoff_datetime, 
                         nyc$tpep_pickup_datetime, units = "hours")
x = ride_duration[ride_duration >= 24 & ride_duration <= 48]
print(paste("The number of rides that lasted more than a day is:", 
            length(x)))

# Day distribution
nyc$overmidnight = wday(nyc$tpep_pickup_datetime) != wday(nyc$tpep_dropoff_datetime)
nyc$picktime_weekday = wday(nyc$tpep_pickup_datetime, label=TRUE)
wday_distr = nyc[nyc$overmidnight == TRUE, "picktime_weekday", na.rm=TRUE]
wday_distr_summary = summary(wday_distr)
wday_distr_summary
