# Setup check 1 of 2: Posit Assistant

No API key needed — Posit AI Pass is a sign-in.

1. Open the workshop project in **Positron** or **RStudio**.
2. Open the assistant pane and sign in to Posit AI Pass.
3. In the R console, run:
   `calls <- readRDS(here::here("data/narw_upcalls.rds"))`
4. Ask the assistant: *"How many rows are in `calls`, and what are the column types?"*

You are set if the answer matches what `str(calls)` tells you.

If the assistant **guesses** instead of looking, it cannot see your session.
In Positron, check that the assistant has session access enabled. In RStudio,
the chat may not have live session context — that is expected, and everything in
the workshop still works; you will just paste more context by hand.

::: Falling back
If AI Pass is unavailable to you, Posit Assistant also takes an Anthropic,
OpenAI, Gemini or Ollama provider with your own key. Either path works for
every exercise.
:::
