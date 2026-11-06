# Exercise 02 — Plan the analysis in a chat interface

**Time:** 15 minutes. **Tool:** the Posit Assistant chat pane. No code.

## The task

You have seven days of DCL/DE detections of NARW up-calls. Get the model to
propose *candidate models*, not code.

## Step 1 — Describe the data properly

Write one message that covers all of:

- what the detector produces, and its false-positive behaviour
- the temporal extent and resolution
- the recorder and its channel (these data come from a single recorder, so
  there is no spatial dimension)
- the covariates you can get hold of
- what you actually want to learn

Resist the urge to name the model you already have in mind.

## Step 2 — Ask for candidates

> Given this, what are three plausible modelling approaches? For each, tell me
> what it assumes about the data and what would make it the wrong choice.

## Step 3 — Push back

Pick the answer you like least and ask it to argue for that one. Then ask:

> What would you need to know about these data that I haven't told you?

Now name the model you had in mind all along, and ask what it thinks. Watch
whether it gets more agreeable than its own candidates warranted.

## Step 4 — Let `/plan` write it down

Type `/plan` and ask it to turn the conversation into an analysis plan. It will
explore read-only, ask you clarifying questions, and write a timestamped
markdown file under `.posit/assistant/plans/`.

Then **open that file and edit it by hand.** Write the **acceptance checks**
yourself. An acceptance check is something you could test after the analysis
runs, with a yes-or-no answer: the result is either right or it isn't. Two
examples for these data:

- All 8,256 rows go in. If any are dropped, the plan says which and why.
- Hour of day is in local time (UTC−5), not UTC.

Add two more of your own. A useful prompt: *if this analysis were quietly
wrong, what would you look at to notice?* A model will happily write a plan
with no way to tell whether the result is right. This section is what lets
the agent in block 5 know when it's done, and lets you check it.

Copy the finished plan to `analysis-plan.md` in this folder.

## Step 5 — Note what happened

In `notes.md` in this folder, record: which suggestion was best, which was subtly wrong, and
what the model asked for that you hadn't thought to provide.

## Discussion

Did steering it toward a model you'd already chosen make the answer better, or
just more agreeable?
