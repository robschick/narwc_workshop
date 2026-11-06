# Exercise 09 — The same question, locally ------------------------------------
# Optional. Requires Ollama running and a model pulled in advance.
#
# Two ways to do this, and the first is the point:
#
#   1. In Posit Assistant, switch the model provider to your local Ollama model.
#      Same pane, same workflow, same /plan mode — only the provider changed.
#      Re-ask the exercise 02 planning question and compare the answer.
#
#   2. Or call it directly from R with {ellmer}, below. Not installed by
#      _setup.R: install.packages("ellmer") first.

library(ellmer)

local_chat <- chat("ollama/llama3.1:8b", echo = "output")
local_chat$chat("In two lines, why is a right whale up-call called an up-call?")

# It will be slower and worse. That is the honest comparison. The point is the
# trade: embargoed data, permitted data, data under a non-disclosure agreement,
# no cloud access, no budget — for those, worse-but-local is the right answer,
# and because the assistant is the same the workflow is otherwise identical.
