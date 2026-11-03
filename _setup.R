# Run once before the workshop. Installs what the exercises use and checks
# that the dataset loads.

pkgs <- c("here", "dplyr", "lubridate", "ggplot2", "readr", "ellmer")
install.packages(setdiff(pkgs, rownames(installed.packages())))

calls <- readRDS(here::here("data/narw_upcalls.rds"))
stopifnot(nrow(calls) == 8256)
message("Setup OK: ", nrow(calls), " up-calls loaded.")
