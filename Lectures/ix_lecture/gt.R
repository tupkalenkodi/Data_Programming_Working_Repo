library(gt)
library(tidyverse)
library(gtsummary)


# get the average price by weekday for year 2015 and 2016
gt = sp500 |>
  dplyr::filter(between(month(date),5,6) & year(date)==2015) |> 
  dplyr::select(date, open, close) |> 
  mutate(weekday=wday(date, abbr = FALSE, label=TRUE),
         month=month(date, abbr = FALSE, label = TRUE)) |>
  summarise(across(open:close, mean),
            .by=c("month", "weekday")) |> 
  arrange(month, weekday)

gt |> 
  gt(caption="Stock prices in May and June 2015",
     groupname_col = "month") |> 
  tab_header(title="sp500", subtitle = "Last week 0f 2015") |> 
    fmt_currency(columns = c(open, close),
                 currency = "EUR") |> 
  summary_rows(
    columns = c(open, close),
    fns = list(average = "mean",
               max="max"),
    fmt = ~ fmt_currency(.,currency = "EUR")
  )


trial |> 
  tbl_summary(
    include = c(age, grade, response),
    by = trt,
    missing = "no"
    )

mtcars |> 
  tbl_summary(
    include=c(mpg, wt, hp),
    by = cyl,
    missing = "no" 
  ) |> 
  add_n()


airquality |> 
  tbl_summary(
    include=c(Ozone, Temp, Wind),
    by = Month,
    missing = "no" 
  ) |> 
  add_n() |> 
  add_p()


    