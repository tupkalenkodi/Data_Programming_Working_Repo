library(tidyverse)


band_members
band_instruments

# inner_join joins only the matching rows
band_members |> 
  inner_join(band_instruments, 
             join_by(name==name)
             )

# left_join returns the left dataframe, 
# the rows are matched the join will happen,
# otherwise there will be an NA in that row
band_members |> 
  left_join(band_instruments, 
             join_by(name==name)
  )

# right_join is the opposite
band_members |> 
  right_join(band_instruments, 
            join_by(name==name)
  )

# full_join will return everything,
# No match -> NA
band_members |> 
  full_join(band_instruments, 
            join_by(name==name)
  )

# anti_join excludes every row from the first
# that have match in the second
band_members |> 
  anti_join(band_instruments, 
            join_by(name==name)
  )

# semi_join give back only the rows from the 
# first that have match in the second
band_members |> 
  semi_join(band_instruments, 
            join_by(name==name)
  )

# Suppose we want to exclude all rows from
# airquality that have month eqaul to 
# 7, 8 or 9
monthdf = data.frame(month=c(7, 8, 9))

# Old way
airquality |> 
  clean_names() |> 
  dplyr::filter(!month %in% unlist(monthdf))
  
# New way
airquality |> 
  clean_names() |> 
  anti_join(monthdf, 
            join_by(month==month)
            )

# How to get unique rows from the df
band_instruments = band_instruments |> 
  bind_rows(data.frame(name="Keith",
                       plays="guitar")
            )

band_instruments |> 
  distinct_all()