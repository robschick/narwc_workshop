# Builds the two figures for exercise 03. Instructor-only: run once and commit
# the PNGs. The names are neutral on purpose, and this script lives outside the
# exercise folder, so the assistant can't tell which figure is noise.

library(dplyr)
library(ggplot2)
library(lubridate)

calls <- readRDS(here::here("data/narw_upcalls.rds")) |>
  mutate(hour = hour(with_tz(time, "Etc/GMT+5")))  # local hour; `time` is UTC

set.seed(2026)
noise <- data.frame(hour = sample(0:23, nrow(calls), replace = TRUE))

plot_hours <- function(d) {
  ggplot(d, aes(hour)) +
    geom_bar() +
    labs(x = "hour of day", y = "detections")
}

out <- here::here("_exercises/03_stress-test")
ggsave(file.path(out, "figure_a.png"), plot_hours(calls), width = 6, height = 4, dpi = 150)
ggsave(file.path(out, "figure_b.png"), plot_hours(noise), width = 6, height = 4, dpi = 150)
