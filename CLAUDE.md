# CLAUDE.md

Context for Claude Code working in this repo. Read `HANDOFF.md` once at the
start of a new thread for the narrative state and what's blocked.

## What this is

A **half-day (4h) workshop** — *Using AI in the Analysis of Marine Ecological
Data* — for the **North Atlantic Right Whale Consortium (NARWC) annual
meeting**. Author: Rob Schick.

It teaches three escalating levels of AI commitment on **one dataset
throughout**: seven days of DCL/DE detections of NARW up-calls.

| Tier | Tool | Blocks |
|---|---|---|
| 1 — plan | Posit Assistant chat, `/plan` | 2 |
| 2 — assist | Posit Assistant in Positron or RStudio | 3, 4 |
| 3 — delegate | `pa` terminal TUI (Claude Code as the named alternative) | 1, 5 |

Adapted from the posit::conf(2025) *Programming with LLMs* full-day workshop
(Joe Cheng, Garrick Aden-Buie), CC-BY. This repo is CC-BY too.

## Non-negotiables

Things that look like details but are load-bearing. Do not change these without
asking Rob.

1. **The workshop totals 240 minutes.** `outline.md` has a block table and each
   `website/workshop-0N.qmd` has `duration:` and `time:` frontmatter. If you
   change any timing, re-verify that the blocks sum to 240 and that the `time:`
   values still chain correctly from the 13:00 start.
2. **One dataset, start to finish.** Every exercise reads
   `here::here("data/narw_upcalls.rds")`. Do not introduce a second example
   dataset, and do not change that path in one place only.
3. **The plan file is the spine.** Block 2 produces an analysis plan with
   `/plan`; block 5 hands that same file to the agent. Anything that breaks that
   thread breaks the workshop's argument.
4. **Every hands-on block ends in verification, not execution.** The recurring
   question is "is it right?", not "did it run?". Exercise 07 is deliberately
   assistant-off. Do not "helpfully" add assistant steps to it.
5. **Posit product names.** It is **Posit Assistant** — it replaced *Positron
   Assistant* and *Databot* in Positron 2026.07. The old names are correct only
   inside an explicit "this replaced that" note. There are four, in
   `outline.md` (x2), `website/workshop-04.qmd`, `STATUS.md` and `syllabus.md`.
   Flag any other occurrence.
6. **RStudio is a first-class path, not a fallback.** Much of the NARWC audience
   has never left RStudio. Every hands-on exercise must work there.
7. **No API keys anywhere in the setup path.** Posit AI Pass is a sign-in. The
   parent workshop's `.env` / key-sharing flow was deliberately cut; reinstating
   it would undo the single biggest improvement over the full-day version.

## Layout

```
outline.md              the timed outline + what carried over from the full day
HANDOFF.md              narrative state, decisions, blockers
STATUS.md               dated status snapshot
syllabus.md             the Posit-facing syllabus (also a Claude doc — see HANDOFF)
website/                Quarto site, one page per block, listing-driven schedule
_exercises/NN_name/     numbered stubs; task structure in comments, not filler code
_solutions/             empty — fill as exercises settle
_demos/                 empty — cold open + tier 3 recording live here
data/                   empty — narw_upcalls.rds goes here
```

## Conventions

- **R style:** succinct. No `cat()` for narration. Tidyverse where natural.
- **Exercise files are teaching scaffolds, not programs.** The comments carry
  the instruction; the code is minimal and often deliberately incomplete. Do not
  "finish" an exercise stub into working code unless asked — the gap is the
  lesson. Completed versions belong in `_solutions/`.
- **Prose voice:** plain, specific, no hype. The workshop's whole stance is
  critical use, so the materials must not read like marketing for AI.
- **Quarto:** `quarto preview website` to check rendering. `_site/` and
  `.quarto/` are gitignored.

## Verify before you call it done

```bash
# timings still total 240
grep -oE '^\| [0-9—] .*\| [0-9]+ \|' outline.md | awk -F'|' '{gsub(/ /,"",$4); s+=$4} END {print s}'

# the qmd clock still chains from 13:00
for f in website/workshop-0*.qmd; do
  printf "%-26s %s %s\n" "$(basename $f)" \
    "$(grep -m1 '^time:' $f | sed 's/time: //')" \
    "$(grep -m1 '^duration:' $f | sed 's/duration: //')"
done

# stale Posit product names — every hit must be a deliberate "replaced" note
grep -rn "Positron Assistant\|Databot" --include='*.md' --include='*.qmd' --include='*.R' . \
  | grep -v CLAUDE.md

# every exercise referenced in the outline/site exists on disk
grep -ohE '0[0-9]_[a-z-]+' outline.md website/*.qmd | sort -u
ls _exercises

# site renders
quarto render website --quiet
```

## Out of scope

- Do not commit the up-call dataset if it is not Rob's to redistribute — check
  first.
- Do not push to any remote without asking.
- The parent posit::conf repo at `~/Documents/_research/rrr/llm` is Posit's, not
  Rob's. Read it for reference; never commit to it.
