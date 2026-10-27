# Status

_Last updated 2026-10-23._

## Where things stand

The outline and scaffold are complete and run end to end on **Posit Assistant**
(Positron, RStudio, and the `pa` terminal TUI), with **Posit AI Pass** for
access and **Posit Cloud** as the fallback environment.

The workshop is **three hours, 08:30–11:30, one break** — cut from four hours on
2026-10-23 to fit a hard end time. What went: the first break, the in-room setup
checkpoint (setup now happens before the session), and the live task in the
tier 3 block (the recording stays). See the note under the arc table in
`outline.md`.

Nothing is runnable yet: `data/narw_upcalls.rds` is not staged, and every
exercise reads from that path. The source is the public
[DCLDE 2013 dataset](https://www.ncei.noaa.gov/access/metadata/landing-page/bin/iso?id=gov.noaa.ncei.pad%3ADCLDE_2013)
(NOAA NCEI), so it can be shared freely.

## The Posit re-plumbing (2026-10-07)

Research for the Posit syllabus turned up that Posit Assistant now ships in
Positron, RStudio **and** a terminal TUI, and that it **replaced Positron
Assistant and Databot** as of Positron 2026.07 — so the original scaffold used
product names that no longer exist. The whole workshop was re-plumbed onto it.

Two things this bought:

- The three surfaces map onto the three tiers, so moving up a tier is a change
  in how much autonomy you grant, not a change in vendor.
- `/plan` mode writes a timestamped markdown plan to `.posit/assistant/plans/`,
  which *is* this workshop's spine — the plan written in block 2 is handed to
  the agent in block 5.

**Posit AI Pass removed the API-key setup block entirely.** It is a sign-in, not
a secret. Claude Code is named as the equivalent alternative wherever `pa`
appears, and setup degrades to bring-your-own-key if Posit declines.

## Open asks to Posit

The syllabus is `syllabus.md` (canonical), mirrored as a Claude doc at
<https://claude.ai/artifact/4gyMGsWVSjseJPKvSFG2Xs>.

1. **Posit AI Pass seats** for attendees for the day of the workshop.
2. **A Posit Cloud instructor space** with the project pre-built.
3. **Questions:** whether AI Pass covers the ellmer exercises (or Posit can
   provide workshop credentials, as at posit::conf(2025)); whether Posit
   Assistant works in Posit Cloud; `/plan` and live-session parity in RStudio;
   whether AI Pass covers `pa`; a higher-credit instructor seat.

## Blockers and decisions, in order

1. Stage `data/narw_upcalls.rds`. Nothing runs until this exists.
2. Fill in dates, venue, headcount and reply-by date in the syllabus, then send
   it to Posit.
3. Hear back from Posit.
4. Decide which real repository the tier 3 `pa` run operates on.
5. Dry-run the cold open and pick the deliberate error — do not improvise it.
6. Record the tier 3 spine, chaptered at the five pause points, cut to about
   eleven minutes.
7. Decide whether attendees install `pa` or it stays instructor-only.
8. Fill `_solutions/` as the exercises settle.
