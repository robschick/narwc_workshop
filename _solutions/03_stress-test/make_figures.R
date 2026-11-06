# Builds the two figures for exercise 03. Instructor-only: run once and commit
# the PNGs. The names are neutral on purpose, and this script lives outside the
# exercise folder, so the assistant can't tell which figure is real.

library(dplyr)
library(ggplot2)
library(lubridate)

calls <- readRDS(here::here("data/narw_upcalls.rds")) |>
  mutate(hour = hour(with_tz(time, "Etc/GMT+5")))  # local hour; `time` is UTC

# Figure B: random, but shaped like a daily cycle. Two random sinusoids set the
# hourly rate, a gamma multiplier adds the hour-to-hour scatter real counts
# have, and the total matches the real data. Nothing in it comes from whales.
# Uniform hours were tried first and came out flat: obviously noise, so the
# model called it that and the exercise had nothing to catch.
set.seed(2)
h <- 0:23
w <- 2 * pi * h / 24
log_rate <- rnorm(1, 0, 0.8) * cos(w - runif(1, 0, 2 * pi)) +
  rnorm(1, 0, 0.6) * cos(2 * w - runif(1, 0, 2 * pi))
rate <- exp(log_rate) * rgamma(24, shape = 8, rate = 8)
noise <- data.frame(hour = sample(h, nrow(calls), replace = TRUE, prob = rate))

plot_hours <- function(d) {
  ggplot(d, aes(hour)) +
    geom_bar() +
    labs(x = "hour of day", y = "detections")
}

out <- here::here("_exercises/03_stress-test")
ggsave(file.path(out, "figure_a.png"), plot_hours(calls), width = 6, height = 4, dpi = 150)
ggsave(file.path(out, "figure_b.png"), plot_hours(noise), width = 6, height = 4, dpi = 150)
