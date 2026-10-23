# Exercise 06 — LGCP with self-excitement, assistant-driven --------------------
# Time: 20 minutes.
#
# The loop you are practising:
#   state the model -> let it draft -> READ the draft -> correct the
#   parameterisation in words -> refit.
#
# Do not let it choose the model for you. You decided that in exercise 02.

library(dplyr)

calls <- readRDS(here::here("data/narw_upcalls.rds"))

# Work on a snippet, not the full series — this must fit in 20 minutes.
snippet <- calls |>
  filter(day == 3) |>
  arrange(time)

# Ask the assistant, in this order:
#
# 1. "Fit a log-Gaussian Cox process to the event times in `snippet`, with a
#     smooth background intensity over time of day."
#    -> read the draft. What did it assume about the temporal unit?
#
# 2. "Add a self-exciting term: a call makes another call more likely in the
#     following minutes."
#    -> check the kernel. Is the decay parameterised in the units you expect?
#
# 3. "Plot the fitted intensity against the observed event times."
#
# Keep the fitted object as `fit_selfexcite` — exercise 07 needs it.

