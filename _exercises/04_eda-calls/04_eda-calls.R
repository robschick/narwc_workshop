# Exercise 04 — Exploring the call series with an assistant --------------------
# Time: 15 minutes. Tool: the assistant in your editor, not a browser.
#
# Rules for this exercise:
#   1. Ask for ONE plot at a time.
#   2. Read every line before you run it.
#   3. When it is wrong, correct it in words rather than fixing it by hand —
#      you are learning how it responds to correction.

library(dplyr)
library(ggplot2)

calls <- readRDS(here::here("data/narw_upcalls.rds"))

# Ask the assistant, in this order:
#
# 1. "Summarise `calls` — what do I have?"
#    Check its answer against str() and summary() yourself.
#
# 2. "Plot detections per hour across the full seven days."
#
# 3. "Now aggregate by hour of day, pooling across days. Does the diel
#     pattern hold in every day separately?"
#    -> this is where a good assistant offers faceting and a poor one
#       silently pools
#
# 4. "Are there gaps in the recording? Show me where."
#
# 5. "Anything here that looks like a detector artefact rather than a whale?"
#
# Then, without the assistant, answer: how many detections are in the busiest
# hour, and does that number appear anywhere in the plots you just made?

