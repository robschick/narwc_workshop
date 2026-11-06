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

The outline is **done and verified** — 180 minutes, one break, timings chained
from an 08:30 start to 11:30. (Cut from four hours on 2026-10-23 to make a
flight; see the note under the arc table in `outline.md` for what went.) The Quarto site has one page per block. The exercise folders
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
| 3 hours, one break, 08:30–11:30 | Hard end time: Rob's flight. Was 4 hours, two breaks until 2026-10-23 |
| Hands-on for tiers 1–2 only; tier 3 is watched | Keeps the agentic finale from becoming a support clinic |
| Wow → feet dirty → sit back | Rob's framing. Attention is highest at the start and lowest at the end, so the heavy typing goes in the middle |
| Tier 3 = recording only, 15 minutes | The live task was cut in the move to three hours; the recording protects the timing |
| Posit Assistant throughout, `pa` for tier 3 | One product across three surfaces, so escalating a tier changes autonomy, not vendor |
| Cold open is napkin to Shiny app, then a live check against local sunset (2026-10-26; nothing planted since 2026-11-06) | Buys the wow and the credibility to spend the day on verification. The timestamps carry a `-05:00` offset, so a planted UTC error depended on luck in parsing, and making it reliable would mean doctoring the data. Either outcome of the check makes the point. Backup recording in `_demos/` |
| Exercise 07 is assistant-off | Verification is the point of the workshop; it needs its own protected block |
| No API keys | AI Pass; see above |
| RStudio equal to Positron | Much of the NARWC room has never left RStudio |

## Open — in the order they block things

1. **Stage `data/narw_upcalls.rds`.** Nothing runs until this exists. The
   source is the public
   [DCLDE 2013 dataset](https://www.ncei.noaa.gov/access/metadata/landing-page/bin/iso?id=gov.noaa.ncei.pad%3ADCLDE_2013)
   (NOAA NCEI), so redistribution is not a concern.
2. **Hear back from Posit** on AI Pass seats and a Cloud instructor space. The
   request went to Posit on 2026-10-26, asking for an answer by November 3.
   As of 2026-11-06 Posit has answered on Cloud only (at full price), not on
   AI Pass seats or whether the assistant runs in Cloud. See the session of
   2026-11-03 to 11-06 below.
3. **Decide whether tier 3 is hands-on or watched.** Rob's 2026-10-26 edits to
   the `syllabus.md` overview say "three hands-on components" and that
   attendees hand the plan file to the agent themselves. The schedule, the
   outline and the decision table above still say block 5 is a 15-minute
   recording. Settle this before anything else is written about block 5.
4. **Pick the repository for the tier 3 agent run.** It must be real, yours, and
   able to survive being projected to a room.
5. **Dry-run the cold open** (napkin sketch to Shiny app). Confirm `pa` accepts
   an image, that the build fits in eight minutes, and where the dusk shading
   starts over three runs (18:05–18:35 on UTC−5 is right). Record the backup run.
6. **Record the tier 3 spine**, chaptered at the five pause points.
7. **Decide whether attendees install `pa`** or it stays instructor-only. This
   changes the pre-workshop setup burden considerably.
8. **Fill `_solutions/`** as the exercises settle.

## Loose ends from the move

- The original still lives at `~/Documents/_research/rrr/llm/workshop_2026/`.
  This repo is a copy with paths rewritten (`workshop_2026/data/...` →
  `data/...`). **Decision 2026-10-23: keep it for now, delete after Posit
  replies.** Do not suggest deleting it before then.

  The reason it is still worth something: three files exist only there —
  `_retired/01_api.R`, `_retired/02_assistant.md`, `_retired/03_agent.sh`, the
  API-key setup checks from before the Posit Assistant re-plumbing. If Posit
  declines the AI Pass seats, the setup path falls back to bring-your-own-key
  and those three are exactly that fallback. Everything else in the old folder
  is either byte-identical to this repo or regenerable build output.

  Note it was never committed to the posit clone (it shows as untracked), so
  deleting it is unrecoverable except from this repo.

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
<https://claude.ai/artifact/4gyMGsWVSjseJPKvSFG2Xs>, the shareable, commentable
version. **In practice Rob edits the Claude docs**, so treat them as the
source and the files as synced copies: before changing a file, check the doc
for newer edits. On 2026-10-23 the request section moved into its own doc,
mirrored here as `posit-request.md`
(<https://claude.ai/artifact/1cpe7JVm4xJF4roC3BXsMz>). Instructor-only notes
live in a third doc, "Workshop planning — things to consider"
(<https://claude.ai/artifact/KnRJ6zuoeEqPLZ4xFi2vVg>). All in sync as of
2026-10-23.

## Session of 2026-10-26

- The request to Posit was sent. `posit-request.md` in the repo is the version
  from before Rob's final redraft, so the sent text may differ.
- Posit does not need to approve the syllabus. Rob will keep making small
  changes to it up to the workshop.
- **`syllabus.md` is now ahead of its Claude doc.** Rob edited the file
  directly in VS Code (the overview, the Shiny cold open, "Like it or not…").
  Ask which copy is the main one before syncing in either direction.
- `syllabus.pdf` sits at the repo root (rendered with Quarto and Typst from a
  scratch copy that adds title settings and table widths). It is not in
  `.gitignore` yet.
- **Next task: a separate, more detailed public syllabus for GitHub Pages.**
  It probably belongs in the Quarto `website/`. Not started.
- Still open in `syllabus.md`:
  - The block 4 text promises a KS test, but exercise 07 has only a QQ plot.
  - The Positron/RStudio rows say block "3, 4"; they should say 2–4.
  - "The final block is watched" should be plural.
  - Rob's own edits have typos: "distram", "shiny", "scientist's",
    "using local model", "knowledge matters".
  - Block 5's output reads "README + PR with a code-flow diagram" in the
    overview but "manuscript documentation" in block 5.
  - "Two features…" paragraph: Rob hasn't chosen a rewrite.
- Cold open dry-run checks: whether `pa` accepts an image, and what time zone
  the DCLDE 2013 timestamps are actually in.

## Sessions of 2026-10-27 to 10-29

Tier 3 and the end of the morning were redesigned through a grilling
session. This supersedes open items 1, 3, 4 and 7 above, and the tier 3 rows
of the decision table.

- **Data staged** (`c61793d`). `data/narw_upcalls.rds` comes from the raw log
  in `data/raw/` and is documented in `data/data-dict.yaml` (tidyverse
  data-dict format). Duplicates, log order and `Possibly_Detected` are kept
  on purpose. `time` is stored in UTC and `day` is the local (EST) date.
- **Tier 3 (10:55–11:15) is hands-on.** Attendees run the agent in the IDE pane
  in Normal approval mode, and `pa` is instructor-only. The agent fits a
  deliberately wrong Poisson GLM from the attendee's own plan; the canonical
  plan is the fallback. Commit before the run, read the Git diff after.
  Sticky notes signal "stuck"; anyone with nothing to show after 8 minutes
  watches the projector, and if a third of the room is stuck, everyone
  switches to the recording. The last 4 minutes are a cut of Rob's recorded
  full workflow.
- **The tier 2b model** is an mgcv GAM LGCP (no INLA, no self-excitation).
  Exercise 07 supplies code for four checks, plus the always-passing total
  check as a deliberate trap.
- **Safety, 11:15–11:23:** demo (b) live ("what have you seen of `calls`?"),
  then (a) a pre-recorded Ollama swap. Attendees don't install Ollama.
- **Wrap-up, 11:23–11:30:** a best-practices cheatsheet in the RStudio style,
  covering git/GitHub, sandboxing, synthetic data, AgentsView and roborev.
- **The recording:** 9 chapters, about 22 minutes, on a new repo with the
  up-call data. It ends with a tour of `sne_ns01`. The script is still to
  be written, in `_demos/`.
- **Environment:** Posit Cloud first; failing that, GitHub plus pre-workshop
  office hours.
- **Dry run:** follow `DRY_RUN.md` before any rewrites.

### Rewrites waiting on the dry run

- `outline.md`, the `website/` block pages, and `syllabus.md`: the new timings
  and the tier 3 / safety / wrap-up structure. Timings must still total 180.
- Exercise 02: tell attendees to choose "Keep planning", and create
  `.posit/assistant/plans/` in advance. Narrow the `.posit/` rule in
  `.gitignore` so the plan can be committed.
- Exercise 03: it calls `chat("anthropic/claude-sonnet-4-5")` through ellmer,
  which needs an API key and breaks non-negotiable 7. Rework it for the
  Posit Assistant pane.
- Exercise 06: replace the self-exciting LGCP with the mgcv GAM.
- Exercise 07: the four checks, plus the trap.
- Exercise 08: turn the follow-along README into the tier 3 hands-on exercise.
- Exercise 09: Ollama becomes take-home only.

## Sessions of 2026-11-03 to 11-06

### Posit's answer, so far

The exchange is with Posit's Academic Licenses team. They answered on Posit
Cloud only:

- **Cloud is available, at full price, not donated.** Order online at
  <https://posit.cloud/plans>; no order form needed. Rob can buy it for
  attendees and set the project up in advance. The matching option in Posit's
  teaching docs is the **fee-per-student** instructor plan: $15/month plus
  $5/month per student, attendees on the free plan, joining by link, with the
  assignment project copied to each of them and a base project for packages.
  About $115 for one month at 20 attendees. **Not bought yet.**
- **Not answered: AI Pass seats for attendees.** That was the main ask. AI Pass
  may sit with a different team. Without seats, each attendee pays $20 ($5 for
  a new subscriber's first month), or uses bring-your-own-key, which makes the
  fallback in *Loose ends from the move* more likely to be needed.
- **Answered by testing, 2026-11-06: Posit Assistant runs inside Cloud with
  a paid AI Pass sign-in.** Rob set up a Cloud RStudio instance, connected his
  AI Pass account, and it worked on a quick penguins test. A workspace cloned
  from this repo is where the dry run continues. Not yet known: whether
  attendees on the free Cloud plan can sign in the same way, and whether `/plan`
  and live-session access behave as on desktop.
- **Packages are not pre-installed in a Cloud clone.** `here` was missing.
  Running `_setup.R` fixes it for one person; for attendees, install them in
  the instructor space's base project so every copy starts with them.
- An AI Pass purchase and a Cloud purchase are separate. Rob's own AI Pass
  seat, subscribed from desktop RStudio, is needed whatever happens with Cloud.

### Repo changes

- Added `narwc_workshop.Rproj` and `_setup.R` (installs the packages the
  exercises use, checks the 8,256 rows load). `website/setup.qmd` already told
  attendees to use both; neither existed.
- Staged the cold-open kit in `_demos/cold-open/` (sketch plus raw CSV, no
  README on purpose). Run each attempt from a copy **outside any repo**: this
  repo's notes discuss the time zones, and an agent started inside it
  can read them. The earlier `shiny_demo/` recording ran inside the repo, so
  check whether it actually fell into the error.
- Pushed to GitHub so the dry run can use a fresh clone.

### Dry-run findings so far (section 0)

- **The Posit Assistant pane is not installed by default in RStudio.** It
  shows "Posit Assistant Not Installed" with an install button. The setup page
  goes straight to "open the assistant pane and sign in."
- **Existing API keys are picked up silently.** With `ANTHROPIC_API_KEY` and
  `GOOGLE_API_KEY` in `~/.Renviron`, the model menu offered Anthropic and
  Gemini and no AI Pass, defaulting to Claude Sonnet 5.5. Messages would have
  been billed to the key. Plausible for anyone in the audience who has used
  ellmer. The setup page should say to choose Posit AI Pass in the model menu.
- **The pane and `pa` are easy to confuse.** The materials use both names
  without saying they are the same assistant, one in the IDE and one in a
  terminal. Add a sentence to `website/setup.qmd` and the block 2 page.
- `.posit/assistant/plans/` has to be created by hand
  (`dir.create(".posit/assistant/plans", recursive = TRUE)`); whether Posit
  Assistant creates it itself is still to be seen.


### Cold open: no planted error (2026-11-06)

A roborev review found that every raw timestamp carries an explicit `-05:00`
offset, so the outline's premise ("the timestamps carry no time-zone label")
was wrong, and whether the agent slipped into UTC depended on how it parsed.
Rather than strip the offsets to force the error, the cold open now ends in a
live check on where the dusk shading starts. The materials' local clock is
UTC−5 (the file's offset, the data dictionary, `day`, exercise 02), and on it
sunset is about 18:05 and civil dusk about 18:35 (suncalc, 42.4 N 70.4 W:
sunset 18:04 on 28 March, 18:11 on 3 April). About 23:00 means UTC; about
19:05 means the EDT wall clock, acceptable only if the axis says EDT. The
first draft of this called 19:05 EDT right, which contradicted the data
dictionary; a roborev review caught it. The outline and
syllabus also now describe the sketch as drawn (dropdown, detection timeline
shaded dusk to dawn, hourly bars), not a day selector.
