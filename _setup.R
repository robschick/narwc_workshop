# Run once before the workshop. Installs what the exercises use, creates the
# folder /plan writes to, and checks that the dataset loads.

pkgs <- c("here", "dplyr", "lubridate", "ggplot2", "readr", "brio", "rerddapXtracto", "ellmer")
install.packages(setdiff(pkgs, rownames(installed.packages())))

# Posit Assistant's /plan mode writes here (exercise 02).
plans <- here::here(".posit/assistant/plans")
dir.create(plans, recursive = TRUE, showWarnings = FALSE)
stopifnot("Could not create .posit/assistant/plans" = dir.exists(plans))

calls <- readRDS(here::here("data/narw_upcalls.rds"))
stopifnot(nrow(calls) == 8256)
message("Setup OK: ", nrow(calls), " up-calls loaded.")
