# Exercise 03 — Where hallucination lives -------------------------------------
# Time: 10 minutes. Work in pairs for part 2.

library(ellmer)
library(ggplot2)

calls <- readRDS(here::here("data/narw_upcalls.rds"))

# Part 1: a real figure --------------------------------------------------------
# Plot hourly call rate, save it, and ask the model to interpret it
# ecologically. Note how confident the answer is.

p_real <- ggplot(calls, aes(hour)) +
  geom_bar() +
  labs(x = "hour of day", y = "detections")

ggsave("03_real.png", p_real, width = 6, height = 4, dpi = 150)

chat <- chat("anthropic/claude-sonnet-4-5", echo = "output")
chat$chat(
  content_image_file("03_real.png"),
  "This shows detections of right whale up-calls. Interpret it ecologically."
)

# Part 2: a figure of nothing --------------------------------------------------
# Same axes, same labels, no signal. Ask the same question in a fresh chat.

fake <- data.frame(hour = sample(0:23, nrow(calls), replace = TRUE))
p_fake <- ggplot(fake, aes(hour)) +
  geom_bar() +
  labs(x = "hour of day", y = "detections")

ggsave("03_noise.png", p_fake, width = 6, height = 4, dpi = 150)

chat2 <- chat("anthropic/claude-sonnet-4-5", echo = "output")
chat2$chat(
  content_image_file("03_noise.png"),
  "This shows detections of right whale up-calls. Interpret it ecologically."
)

# Part 3: with your partner ----------------------------------------------------
# Try to get a confident, specific, wrong interpretation of the noise figure.
# Then try to get it to say "there is no pattern here". Which was easier?
#
# Record in notes.md: what prompt finally made it hedge?
