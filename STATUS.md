# Status

_Last updated 2026-10-07._

## Where things stand

The outline and scaffold are complete and now run end to end on **Posit
Assistant** (Positron, RStudio, and the `pa` terminal TUI), with **Posit AI
Pass** for access and **Posit Cloud** as the fallback environment.

Nothing is runnable yet: `data/narw_upcalls.rds` is not staged, and every
exercise reads from that path. That is the first blocker.

## The Posit re-plumbing (2026-10-07)

Research for the Posit syllabus turned up that Posit Assistant now ships in
Positron, RStudio **and** a terminal TUI, and that it **replaced Positron
Assistant and Databot** as of Positron 2026.07 — so the original scaffold used
product names that no longer exist. The whole workshop was re-plumbed onto it.

Two things this bought:

- The three surfaces map exactly onto the three tiers, so moving up a tier is a
  change in how much autonomy you grant, not a change in vendor.
- `/plan` mode writes a timestamped markdown plan to `.posit/assistant/plans/`,
  which *is* this workshop's spine — the plan written in block 2 is handed to the
  agent in block 5. That hand-off is now a product feature rather than something
  improvised.

**Posit AI Pass removed the API-key setup block entirely.** It is a sign-in, not
a secret. The parent repo's `.env` / key-sharing app is cut and the setup
checkpoint dropped from a half-hour of troubleshooting to eight minutes. Claude
Code is named as the equivalent alternative wherever `pa` appears, and setup
degrades to bring-your-own-key if Posit declines.

## Open asks to Posit

A syllabus has been drafted for this conversation:
<https://claude.ai/code/artifact/1de0264f-8a67-49a9-862b-c18abd978c3a>

1. **Posit AI Pass seats** for attendees for the day of the workshop. Listed at
   $20/month per seat with no documented education discount, so this is a genuine
   ask rather than something absorbable.
2. **A Posit Cloud instructor space** with the project pre-built, as the fallback
   for anyone whose laptop fights the local install.

## Blockers and decisions, in order

1. Stage `data/narw_upcalls.rds`. Nothing runs until this exists.
2. Hear back from Posit on the two asks above.
3. Fill in venue, dates and headcount in the syllabus.
4. Decide which real repository the tier 3 `pa` run operates on.
5. Dry-run the cold open and pick the deliberate error — do not improvise it.
6. Record the tier 3 spine, chaptered at the five pause points.
7. Decide whether attendees install `pa` or it stays instructor-only.
8. Fill `_solutions/` as the exercises settle.

## Housekeeping

- `` is still **untracked in git** — never committed.
- `website/.gitignore` now covers `/_site/` as well as `/.quarto/`; before this
  it would have committed ~40 rendered HTML files.
- `_retired/` holds the superseded API-key setup checks. Delete once the AI Pass
  path is confirmed (this shell cannot delete files).
