# Exercise 05 — Documentation in the prompt

**Time:** 17 minutes. The most useful habit in this workshop. **Tool:** the
Posit Assistant chat pane.

The ask, used in steps 1 and 3:

> Write a function that takes a data frame of detection times and a fixed
> recorder location, and returns the same data frame with sea surface
> temperature joined on, pulled from ERDDAP using {rerddapXtracto}. Keep it
> concise, no error handling, roxygen2 docs with one example.

## Step 1 — The cold ask

Turn **web search off** (the globe icon under the chat box), start a new chat,
and send the ask as written. Does the code use real function names? Real
arguments? Does it run?

## Step 2 — Fetch the docs

Open `_exercises/05_covariates-erddap/docs.md`, next to this file, and paste in
the relevant section of the {rerddapXtracto} documentation. The link is at the
top of that file.

## Step 3 — Ask again, with the docs

Start a new chat. Type `@` and choose `docs.md` to attach it, then send the
same ask. Compare the two answers.

## Step 4 — Check it

Run the step 3 version against the real recorder location (42.066 N,
70.2719 W, from `data/data-dict.yaml`) and a two-day window from the
deployment, e.g. 28–29 March 2009. Sanity-check the values: is that a plausible SST for this place and
season? The function running is not the same as the data being right.
