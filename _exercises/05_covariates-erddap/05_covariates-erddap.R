# Exercise 05 — Documentation in the prompt -----------------------------------
# Time: 17 minutes. The most useful habit in this workshop.
#
# Step 1: run the cold ask below as-is. Does the generated code use real
#         function names? Real arguments? Does it run?
#
# Step 2: open docs.md in this folder and paste in the relevant section of the
#         {rerddapXtracto} documentation (link at the top of that file).
#
# Step 3: uncomment the docs line and ask again. Compare.

library(ellmer)

chat <- chat("anthropic/claude-sonnet-4-5", echo = "output")

chat$chat(
  ## Extra context from package docs (uncomment for step 3)
  # brio::read_file(here::here("_exercises/05_covariates-erddap/docs.md")),
  ## Task prompt
  paste(
    "Write a function that takes a data frame of detection times and a fixed",
    "recorder location, and returns the same data frame with sea surface",
    "temperature joined on, pulled from ERDDAP using {rerddapXtracto}.",
    "Keep it concise, no error handling, roxygen2 docs with one example."
  )
)

# Step 4: run the step-3 version against the real recorder location and a
# two-day window. Sanity-check the values — is that a plausible SST for this
# place and season? The function running is not the same as the data being right.
