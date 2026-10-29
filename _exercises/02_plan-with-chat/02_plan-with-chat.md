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

## Step 4 — Let `/plan` write it down

Type `/plan` and ask it to turn the conversation into an analysis plan. It will
explore read-only, ask you clarifying questions, and write a timestamped
markdown file under `.posit/assistant/plans/`.

Then **open that file and edit it by hand.** Specifically, write the
**acceptance checks** yourself — the numbers that must match, the invariants
that must hold. A model will happily write a plan with no way to tell whether
the result is right, and that section is what makes the plan usable by an agent
in the closing session.

Copy the finished plan to `analysis-plan.md` in this folder.

## Step 5 — Note what happened

In `notes.md`, record: which suggestion was best, which was subtly wrong, and
what the model asked for that you hadn't thought to provide.

## Discussion

Did steering it toward a model you'd already chosen make the answer better, or
just more agreeable?
