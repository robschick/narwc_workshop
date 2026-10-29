# Build data/narw_upcalls.rds from the DCLDE 2013 up-call detection log.
#
# Deliberately light-touch: rows stay in file order, duplicates and
# "Possibly_Detected" calls stay in. Finding those is part of the workshop.
# See data-dict.yaml for what each column means.

library(dplyr)
library(readr)
library(lubridate)

raw <- read_csv(
  here::here("data/raw/dclde_2013_nefsc_sbnms_200903_nopp6_ch10_detections_NEFSC_SBNMS_200903_NOPP6_CH10_upcall-detection-log.csv"),
  col_types = cols(.default = col_character())
)

# The log carries a fixed -05:00 offset (EST). ymd_hms() honours it and
# returns the instant in UTC.
calls <- raw |>
  transmute(
    selection  = as.integer(Selection),
    time       = ymd_hms(Start_DateTime_ISO8601),
    time_end   = ymd_hms(End_DateTime_ISO8601),
    freq_low   = as.numeric(Low.Freq..Hz.),
    freq_high  = as.numeric(High.Freq..Hz.),
    confidence = Detection_Confidence,
    day        = as.integer(as_date(with_tz(time, "Etc/GMT+5")) - as_date("2009-03-28")) + 1L
  )

stopifnot(
  nrow(calls) == nrow(raw),
  !anyNA(calls),
  all(calls$day %in% 1:7),
  all(calls$time_end >= calls$time),
  all(unique(raw$Channel) == "1"),
  all(unique(raw$Species) == "RIWH")
)

saveRDS(calls, here::here("data/narw_upcalls.rds"))
