# Recording script: the full agentic workflow

_Draft, 2026-10-29. Instructor-only. Shows the right model (self-exciting
LGCP, "Hawkes") on the workshop data, built with Rob's own Claude Code
workflow: grilling → spec → tickets → AFK run → review._

## What you're making

Two cuts from one recording session:

| Cut | Length | Where it's used |
|---|---|---|
| **Full** | ~22 min | Linked from the site; the take-home |
| **Room** | 4 min | Last 4 minutes of tier 3 (11:11–11:15) |

The room cut has one job: show the room what happens when the same workflow
gets the right model and a real review, after they've just watched an agent
fit the wrong one.

The full cut has a second job: show how you actually work, honestly,
including where it went wrong. Do not stage it. The cold open already has a
planted error; this one should only show errors that really happened.

## The story in one sentence

> In tier 3 you gave an agent one prompt and it fit the wrong model. Here's
> what it looks like when the agent gets a grilled plan, a spec, small
> tickets and a reviewer, and the human checks the work.

---

## Before you record

### The repo

- [ ] A **new, empty** repo, e.g. `narw-upcall-hawkes`. Public on GitHub, since
      you'll show issues and PRs on screen.
- [ ] Copy in, and make the first commit with:
  - `data/narw_upcalls.rds`, `data/data-dict.yaml`, `data/README.md` from
    this repo
  - the canonical `analysis-plan.md` from your dry run
  - a short `CLAUDE.md`: what the repo is, "R, tidyverse, succinct", where
    the data are, "read `data/data-dict.yaml` first". Keep it under 20 lines
    so it fits on screen in chapter 0.
- [ ] Do **not** copy `sne_ns01` code in. The agent fetches it as part of a
      ticket (chapter 3), so the reuse is on camera.

### The machine

- [ ] Claude Code with the skills you'll use: `grilling`, your PRD/spec
      habit, `gh` signed in, roborev's post-commit hook installed in the new
      repo, AgentsView.
- [ ] **Nothing secret on screen.** Close email and Slack, hide the
      bookmarks bar, check that no terminal history shows tokens. Use a
      clean shell profile if your prompt shows paths you'd rather not show.
- [ ] Terminal font at least 18 pt; 120 columns × 35 rows. Dark or light,
      but the same for all chapters.
- [ ] Screen recorder set to keep **raw footage**: you'll cut later. Record
      each chapter as its own file if you can; it makes editing much easier.
- [ ] A visible clock (menu bar, or a small terminal running `watch date`)
      for the AFK time-lapse.
- [ ] Note the time and your usage counter before you start (for chapter 7).

### Estimate the fit time first

`sne_ns01` ran at about 0.13 s per iteration on a month of NS01 data (6,733
calls, `benchmark_laptop_results.md`). The workshop week has 8,256 calls in
7 days, so expect about the same or a bit slower. **Time 500 iterations
before the recording day** and pick a chain length that finishes in under an
hour: roughly 10,000–20,000 iterations. Say on camera that it's a short
chain, and that the real fits run 150k on the cluster.

---

## Chapter 0: What the agent knows (video 1:00)

**Show:** the repo in the file tree, then `CLAUDE.md` and the top of
`data-dict.yaml`.

**Say:**
- "This is everything the agent starts with. A week of up-calls, a data
  dictionary, the plan from block 2, and a page of instructions."
- "The dictionary matters. It says the times are in UTC, the rows aren't in
  time order, and 28% of the calls are 'possibly detected'. If the agent
  doesn't read it, it'll make the mistakes you saw in tier 3."

**Cut:** straight through. No editing needed.

## Chapter 1: Grilling (real 15–20 min → video 4:00)

**Type:**

> /grilling I want to fit a self-exciting log-Gaussian Cox process to the
> calls in data/narw_upcalls.rds, following analysis-plan.md. Grill me on
> the model before we write a spec.

**Do:** answer honestly, as you would on a real project. Don't rehearse the
answers, or it'll sound rehearsed.

**Questions you want it to raise** (if it doesn't, that's worth saying on
camera too):
- the time unit, and the time zone for the background intensity
- `Possibly_Detected`: in or out?
- the duplicate start times
- the shape and timescale of the excitation kernel
- what "right" means: which diagnostics decide whether the fit is acceptable

**Say,** over the cut:
- "This is the step most people skip. It's asking me what I mean before it
  writes anything."
- On a good question: "I'd have got that wrong. I'd have run the whole
  thing, then found it in the residuals."
- On a weak question: "This one isn't useful, and it's fine to say so and
  move on."

**Cut:** keep 3 exchanges in full. Speed up or cut everything else, with a
caption "15 minutes of questions, condensed".

**Room cut:** the single best question and your answer (≈ 0:40).

## Chapter 2: The spec (real ~5 min → video 2:00)

**Type:**

> Turn this into a spec in docs/spec.md: the model, the data decisions we
> made, and acceptance checks. Include a time-rescaling QQ against Exp(1),
> using exactly the calls each model was fitted to, with tied start times
> handled one stated way; observed vs expected calls by day and by hour; a
> comparison with a Poisson model without self-excitation; and trace plots
> and effective sample sizes for the chain, with a minimum ESS below which
> the fit isn't used.

**Show:** scroll the spec slowly. Stop on the acceptance checks.

**Say:**
- "The acceptance checks are the part I write or rewrite myself. Everything
  else in the spec, the agent can draft."
- "These are the same checks you just did in exercise 07. Now they're the
  agent's definition of done."

**Do:** edit at least one acceptance check by hand, on camera.

**Cut:** keep your hand edit in full.

## Chapter 3: Tickets (real ~5 min → video 2:00)

**Type:**

> Break docs/spec.md into GitHub issues with gh. Each issue should be small
> enough that I can review its PR in under ten minutes. One issue should
> adapt the sampler from github.com/robschick/sne_ns01 (src/RcppFtns.cpp,
> src/RFtns.R, 02_fitLGCPSE.R) to this data, rather than write one from
> scratch.

`sne_ns01` is public (checked 2026-10-29), so the agent can read it directly.

**Likely tickets** (don't force these; just know roughly what to expect):
1. Data prep: sort by time, the decisions about duplicates and confidence,
   local time
2. Poisson baseline and its diagnostics
3. Adapt the `sne_ns01` sampler
4. Short-chain fit
5. Diagnostics: time-rescaling QQ, Poisson vs Hawkes
6. README

**Show:** the GitHub issues page in the browser.

**Say:**
- "Small tickets are how I stay able to review this. One giant PR, I'd
  just approve without reading."
- On ticket 3: "This is the bit I couldn't show you live. I've built this
  sampler already, for three buoys in Southern New England. The agent's job is
  to adapt it, not reinvent it."

**Room cut:** the issues list, 5 seconds still, with a caption (≈ 0:15).

## Chapter 4: AFK (real 30–90 min → video 3:00)

**Type:** whatever your normal "work through the open issues, one PR per
issue" instruction is. Say on camera which permission mode you're in and
why.

**Then leave.** Actually leave the desk.

**Record:** the screen, plus the visible clock. Speed up to fit 3 minutes,
with the clock in shot so the speed-up is obvious.

**Say,** over the time-lapse (record the voice-over afterwards):
- "I went and made lunch." Or whatever is true.
- "This is the part people find unnerving, and they're right to. The
  reason I can walk away is the setup: small tickets, a spec with checks,
  permission limits, and a reviewer that runs on every commit."
- "Notice I'm not watching it. If I had to watch it, it wouldn't be saving
  me anything."

**Room cut:** 10 seconds of the time-lapse with the clock (≈ 0:20).

## Chapter 5: Review (real ~15 min → video 4:00)

**Show, in order:**
1. **AgentsView:** the timeline of what it did while you were away. Point
   at one decision you didn't expect.
2. **roborev:** the findings on its commits. Open one, read it, and decide
   on camera whether it's right.
3. **A PR diff** on GitHub. Read the part that touches the model.

**Say:**
- "Two tools. AgentsView tells me what happened; roborev tells me what's
  probably wrong with it."
- On a finding: "Is this right? Let's check, not take its word for it."

**You need one real error caught.** If the run doesn't produce one, say so
and use a true one from this workshop's own repo instead: while this
workshop was being built, roborev caught a data-dictionary note that had
the UTC date relationship backwards, and a model check that was
statistically invalid: raw gaps against a single exponential, which a
time-varying rate alone fails. Both were in commits Claude had made.

**Room cut:** the error being caught and fixed, in full (≈ 1:00).

## Chapter 6: The right model (video 3:00)

**Show:**
- The time-rescaling QQ, Poisson next to Hawkes. The Poisson should bend
  away from the line (bursts and long silences); the Hawkes one should be
  much closer.
- Observed vs expected by day, both models.
- The fitted excitation kernel: "a call raises the chance of another for
  about ___ minutes."

**Say:**
- "This is the model you fit the wrong version of in tier 3. Same data."
- "The Poisson model isn't stupid. It gets the daily rhythm. What it misses
  is that calls come in bursts. Whales answering each other is one
  explanation. So is one whale calling repeatedly, more whales passing
  through, the detector, or something in the water we didn't model. The
  model tells you there's clustering, not why."
- Show the trace plots and ESS before the kernel. If the chain fails the
  spec's ESS check, say so and don't read the kernel off it.
- Be honest about the short chain: "This is a short chain to fit the
  recording. The real fits run 150,000 iterations on a cluster, and I'd
  want that before I'd publish a number."

**Room cut:** the two QQ plots side by side, with that one line (≈ 0:40).

## Chapter 7: The bill (video 1:00)

**Show:** a plain card:

| | |
|---|---|
| Wall-clock, start to merged | |
| Of which, me at the desk | |
| Tokens | |
| Cost | |
| PRs merged / findings fixed | |

**Say:** "That's what it cost. Whether it's worth it depends on what your
time costs, and on whether you'd have checked the work this carefully by
hand. Most of us wouldn't have."

**Room cut:** the card (≈ 0:15).

## Chapter 8: At scale (video 2:00)

**Show:** `sne_ns01` on GitHub: the PR list (27 merged), `plans/`, the
docs folder of runbooks, one PRD.

**Say:**
- "Same workflow, over months. Three buoys, 109 commits, fits that run for
  days on a cluster."
- "Look at the docs folder. Most of it is runbooks: what to do when a fit
  finishes, what to check. That's what lets me hand work to an agent and
  pick it up again a week later."

**Room cut:** the PR list, scrolling (≈ 0:30).

---

## The room cut (4:00)

| # | From | Content | Length |
|---|---|---|---|
| 1 | Ch 1 | Best grilling question + your answer | 0:40 |
| 2 | Ch 3 | Issues list | 0:15 |
| 3 | Ch 4 | Time-lapse with clock | 0:20 |
| 4 | Ch 5 | An error caught and fixed | 1:00 |
| 5 | Ch 6 | QQ: Poisson vs Hawkes | 0:40 |
| 6 | Ch 7 | The bill | 0:15 |
| 7 | Ch 8 | `sne_ns01` PR list | 0:30 |
| | | Titles and transitions | 0:20 |
| | | **Total** | **4:00** |

Add a chapter marker at each cut so you can pause cleanly if there are
questions, then pick up again.

---

## If it goes wrong while recording

- **Grilling goes nowhere useful.** Keep it anyway and say so. A weak
  grilling session is honest footage; redo it only if it's boring, not if
  it's bad.
- **The sampler won't adapt.** Stop, fix it yourself, and say what you did
  in the voice-over. "Here's where I had to step in" is one of the most
  useful things the full cut can show.
- **The fit doesn't finish.** Show the chain as far as it got and say how
  long it ran. If it fails the ESS check, call it unusable on camera and
  show the diagnostics, not the kernel. That's still a useful thing to
  film.
- **The Hawkes QQ isn't clearly better.** Don't hide it. Show it, and say
  what that tells you (chain too short? kernel wrong?). Then decide whether
  to re-record chapter 6 after a longer run.

## After recording

- [ ] Fill in the chapter 6 kernel timescale and the chapter 7 card.
- [ ] Export both cuts. Put the room cut on the presentation laptop **and**
      a USB stick; don't stream it over conference wifi.
- [ ] Captions on both cuts.
- [ ] Link the full cut and the new repo from the tier 3 page on the site.
- [ ] Keep the raw footage until after the workshop.
