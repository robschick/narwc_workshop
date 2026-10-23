# Handoff

_Written 2026-10-23, at the point of moving this work from Claude (Cowork) to
the Claude Code CLI. `CLAUDE.md` holds the durable project rules; this file is
the story of how it got here and what's still open._

## Cold-start prompt

Paste this into a fresh `claude` session in this directory:

> Read CLAUDE.md and HANDOFF.md. This is a half-day NARWC workshop on using AI
> in marine ecological data analysis, currently a complete outline and a stub
> scaffold with no dataset staged. Don't change anything yet — tell me what you
> think the next move is and what you'd need from me, then wait.

The "don't change anything yet" matters. The repo is in a consistent state and
the open items are decisions, not code.

## Where things stand

The outline is **done and verified** — 240 minutes, two breaks, timings chained
from a 13:00 start. The Quarto site has one page per block. The exercise folders
have their task structure written out in comments; they are teaching scaffolds,
not working programs.

**Nothing is runnable.** `data/narw_upcalls.rds` has never been staged, and
every exercise reads that path. This is the first blocker and it gates
everything downstream.

The workshop runs end to end on **Posit Assistant** — Positron, RStudio, and the
`pa` terminal TUI — with **Posit AI Pass** for access and **Posit Cloud** as the
environment fallback.

## How it got here

**Aug 28.** Built from the posit::conf(2025) *Programming with LLMs* full-day
repo. Rob's own accepted abstract (three tiers of AI commitment, one NARW
up-call dataset) supplied the content; the posit repo supplied the pedagogy and
the scaffolding. Roughly a third of the full day carried over — see the table at
the bottom of `outline.md` for what was kept, cut, and re-skinned, and why.

**Oct 7.** While researching a syllabus to send Posit, it turned out the
scaffold referenced products that no longer exist: **Posit Assistant replaced
both Positron Assistant and Databot in Positron 2026.07**, and it now ships in
three places — editor, IDE, and a terminal TUI.

That mapped onto the three tiers exactly, so the whole workshop was re-plumbed
onto it. Two consequences worth understanding, because they are now structural:

- `/plan` mode writes a timestamped markdown plan to `.posit/assistant/plans/`.
  That *is* this workshop's spine — the plan written in block 2 is handed to the
  agent in block 5. The hand-off became a product feature instead of something
  improvised.
- **Posit AI Pass removed the API-key setup block entirely.** It's a sign-in,
  not a secret. The parent repo's `.env` / key-sharing app is cut and the setup
  checkpoint went from roughly thirty minutes of troubleshooting to eight. The
  path degrades to bring-your-own-key if Posit declines.

**Oct 23.** Extracted to this standalone repo. It had been an untracked folder
inside a clone of `posit-conf-2025/llm` — Posit's repo, not Rob's — so there was
nowhere to commit.

## Decisions already made

Don't relitigate these without a reason; each was a deliberate call.

| Decision | Why |
|---|---|
| 4 hours, two breaks | Fits the NARWC half-day slot |
| Hands-on for tiers 1–2 only; tier 3 is watched | Keeps the agentic finale from becoming a support clinic |
| Wow → feet dirty → sit back | Rob's framing. Attention is highest at the start and lowest at the end, so the heavy typing goes in the middle |
| Tier 3 = recorded spine + one live task | Recording protects the timing; the live task proves it's real |
| Posit Assistant throughout, `pa` for tier 3 | One product across three surfaces, so escalating a tier changes autonomy, not vendor |
| Cold open has a *planted* error | Buys the wow and the credibility to spend the day on verification |
| Exercise 07 is assistant-off | Verification is the point of the workshop; it needs its own protected block |
| No API keys | AI Pass; see above |
| RStudio equal to Positron | Much of the NARWC room has never left RStudio |

## Open — in the order they block things

1. **Stage `data/narw_upcalls.rds`.** Nothing runs until this exists. Also
   decide whether it can be committed or must stay local — check redistribution
   rights before adding it to git.
2. **Hear back from Posit** on AI Pass seats and a Cloud instructor space. The
   setup path assumes yes.
3. **Fill in venue, dates, headcount** in `syllabus.md` before sending it.
4. **Pick the repository for the tier 3 agent run.** It must be real, yours, and
   able to survive being projected to a room.
5. **Dry-run the cold open and choose the deliberate error.** Do not improvise
   this on the day.
6. **Record the tier 3 spine**, chaptered at the five pause points.
7. **Decide whether attendees install `pa`** or it stays instructor-only. This
   changes the pre-workshop setup burden considerably.
8. **Fill `_solutions/`** as the exercises settle.

## Loose ends from the move

- The original lives on at `~/Documents/_research/rrr/llm/workshop_2026/`. This
  repo is a copy with paths rewritten (`workshop_2026/data/...` → `data/...`).
  **Delete the original once you're satisfied this copy is good** — keeping both
  is how they drift.
- `_retired/` (the superseded API-key setup checks) was deliberately not copied.
  It's still in the old location if you want it.
- No initial commit yet — the sandbox this was built from has no git identity.
  See below.

## First commands

```bash
cd ~/Documents/_research/git_repos/narwc_workshop
git init && git add -A && git commit -m "Initial import: NARWC AI workshop scaffold"
gh repo create narwc_workshop --private --source=. --push   # when ready
quarto preview website                                       # check it renders
```

## The syllabus

`syllabus.md` is the Posit-facing document — what the workshop is, the Posit
stack it uses, and the two asks (AI Pass seats, a Cloud instructor space).

It also exists as a Claude doc at
<https://claude.ai/artifact/4gyMGsWVSjseJPKvSFG2Xs>, which is the shareable,
commentable version. **The two can drift.** Decide which is canonical — the
file is easier for an agent to revise, the doc is easier to send to a person.
