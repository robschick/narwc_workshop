# Using AI in the Analysis of Marine Ecological Data

**Half-day workshop (3 hours, 08:30–11:30, one break) · North Atlantic right whale up-calls**

Runs end to end on Posit Assistant (Positron, RStudio, and the `pa` terminal
TUI), with Posit AI Pass for access and Posit Cloud as the fallback environment.

Adapted from the posit::conf(2025) full-day *Programming with LLMs* materials in
the parent repo. That workshop taught people to *call* LLMs from code; this one
teaches them to *work with* AI across three levels of commitment, on one
ecological problem. Roughly a third of the parent material carries over (the
conversation model, the hallucination demo, the docs-in-context lesson, tool
calling as a concept); the rest is new.

## Design principles

1. **One dataset, start to finish.** The seven-day DCL/DE dataset of NARW
   up-calls is on screen from minute three to minute 180. No toy examples, no
   context switching.
2. **Wow first, explain second.** The room sees the destination before it sees
   the machinery. Setup is done before the session, so the cold open starts on
   time.
3. **Escalating commitment, one product.** Posit Assistant ships in Positron,
   in RStudio, and as the `pa` terminal TUI — which is exactly the three tiers.
   So moving up a tier is a change in how much autonomy you grant, not a change
   in vendor. Anyone can stop at any tier and still leave with something useful.
   Claude Code is named as the equivalent alternative wherever `pa` appears.
4. **The scientist stays in the loop.** Every hands-on block ends with a
   verification step. The recurring question is not *did it run?* but *is it
   right?*
5. **Hands-on in the middle, hands-off at the ends.** Attendees type during
   blocks 2–4. Blocks 1, 5, 6 and 7 they watch.

## Arc

| # | Block | Mins | Mode | Beat |
|---|-------|------|------|------|
| 1 | Cold open: napkin to app | 15 | Watch | **Wow** |
| 2 | Tier 1 — Planning with a chat interface | 45 | Hands-on | Feet wet |
| 3 | Tier 2a — The assistant in your session: EDA & covariates | 40 | Hands-on | Feet dirty |
| 4 | Tier 2b — Fitting the LGCP, and checking it | 35 | Hands-on | Feet dirty |
| — | ☕ Break | 10 | | |
| 5 | Tier 3 — the `pa` agent on a real repository | 15 | Watch | **Wow** |
| 6 | Local models and pitfalls | 15 | Watch | Land it |
| 7 | Wrap-up and feedback | 5 | | |

Total: 180 minutes.

*Cut from four hours to three (2026-10-23) to fit an 08:30–11:30 slot. What
went: the first break, the in-room setup checkpoint (now done before the
session), and the live task in block 5 (the recording stays). Block 6 gained
five minutes.*

---

## Block 1 — Cold open: napkin to app (15m)

> No slides for the first eight minutes. The workshop opens with the thing
> people came to see.

- **(8m) The cold open.** Live, from an empty directory. Hand the `pa` agent a
  hand-drawn sketch of a dashboard (a dropdown that switches between a
  timeline of individual detections, shaded dusk to dawn, and calls per hour
  of day) and the raw seven-day up-call file. It reads the file,
  describes the columns, and builds a working Shiny app that matches the
  sketch. Do not narrate while it runs; let the room read the screen.
- **(4m) Check it, live.** The app works and looks right. Is it? Ask one
  question the room can answer: where does the dusk shading start? On the
  recorder's clock (UTC−5, the file's own offset and the convention in the
  data dictionary), sunset in late March is about 18:05 and civil dusk about
  18:35. R stores the timestamps as UTC, so shading from about 23:00 means
  the app never converted. Shading from about 19:05 means it used the EDT
  wall clock, which is fine only if the axis says so. The hourly bars shift
  the same way. The real test is whether the axis says which clock it's on,
  and whether the shading and the calls use the same one. Nothing is
  planted. If it's wrong, that's the reveal. If
  it's right, show how you know and how little time checking took. This sets
  the tone for the session: the question is "is it right?", not "did it
  run?"
- **(3m) Welcome, and the map.** Who's here, the three tiers, and the promise:
  by 11:30 you will have done tiers 1 and 2 yourself and watched tier 3.
  Say plainly that nobody builds an app today; that is tier 3 work, and
  block 5 shows how it's done.

**Backup recording.** Record a full eight-minute run and the check that
follows it, and keep it in `_demos/`. Switch to it if the live run stalls or the
network fails; the first eight minutes are the worst time for either.

**Setup happens before the session**, not in it.
`_exercises/01_setup-check/` — confirm the Posit AI Pass sign-in, confirm the
assistant answers in the editor, optionally confirm `pa` runs in a terminal —
is on the site's setup page for attendees to do in advance. Posit Cloud is the
fallback for anyone whose laptop fights the install; helpers point people there
during block 1 rather than troubleshooting in the room.

*Changed from the parent repo:* the Morning 1 "verify API access" beat and its
`.env` / API-key-sharing app are **gone**. AI Pass is a sign-in, not a secret,
and removing key provisioning is the single biggest improvement over the
full-day version — it is what makes pre-session setup realistic at all.

## Block 2 — Tier 1: planning with a chat interface (45m)

> Lowest commitment: a chat pane. The output of this block is a written analysis
> plan that blocks 3–5 consume — and Posit Assistant's `/plan` mode writes that
> file for us, so the hand-off is a product feature rather than something we
> improvise.

- **(10m) Anatomy of a conversation.** System / user / assistant, and the fact
  that the conversation is stateless — every turn resends everything. Why this
  matters for a scientist: context is a resource you spend deliberately.
  *(Condensed from parent Morning 1, ~20m → 10m; drop the word-guessing game.)*
- **(15m) Exercise `02_plan-with-chat`.** Describe the up-call dataset to the
  model — sampling design, seven days, detector false-positive rate, the
  covariates available — and ask it for *candidate models, not code*. Push back
  on the first answer. Ask it what would make each model wrong. Ask what it
  would need to know that you haven't told it.
- **(10m) Exercise `03_stress-test`.** The honesty exercise. Show the model a
  figure and ask for an ecological interpretation; then show it a plausible-
  looking figure built from noise and ask the same question. In pairs, try to
  get a confident, wrong interpretation out of it. *(Directly adapted from the
  parent repo's `12_plot-image-1` / `13_plot-image-2` pair — one of the
  strongest teaching beats in the original, and it transfers unchanged.)*
- **(10m) Turning a conversation into an artifact.** `/plan` in Posit
  Assistant. It explores read-only, asks clarifying questions, and writes a
  timestamped markdown plan to `.posit/assistant/plans/`. Attendees then edit
  that plan by hand — objective, data contract, method, acceptance checks —
  because the acceptance checks are the part a model cannot write for you. This
  file is the hand-off to block 5; say that clearly, so the room knows the
  thread.

## Block 3 — Tier 2a: the assistant in your session (40m)

> Middle commitment: an assistant that can see your R session, your objects,
> your errors.

- **(8m) What changes when it can see your session.** Posit Assistant in
  Positron or RStudio reads the data frame rather than your description of it.
  Where that helps and where it quietly misleads. Note for the room: this one
  product replaced Positron Assistant and Databot as of Positron 2026.07, so
  older tutorials use names that no longer exist.
- **(15m) Exercise `04_eda-calls`.** Explore the seven-day series with the
  assistant: call rate over time, diel structure, gaps, detector artefacts.
  The instruction to the room is to ask for *one plot at a time* and to read
  every line before running it.
- **(17m) Exercise `05_covariates-erddap`.** The docs-in-context lesson. Ask
  for code to pull SST and wind from a remote API — first cold, then with the
  package documentation pasted into the prompt. The cold attempt invents
  function signatures; the warm attempt works. This is the single most useful
  habit in the workshop. *(Structural lift from parent `15_coding-assistant`,
  with `weathR` swapped for `rerddapXtracto`.)*

## Block 4 — Tier 2b: fitting the model, and checking it (35m)

- **(20m) Exercise `06_lgcp-selfexcite`.** Fit a log-Gaussian Cox process with
  self-excitement to a short snippet of the call series, with the assistant
  doing the typing. Emphasise the loop: state the model, let it draft, read the
  draft, correct the parameterisation, refit.
- **(15m) Exercise `07_verify-the-assistant`.** The block everyone skips and
  shouldn't. Take the fitted model and interrogate it *without* the assistant:
  does the intensity integrate to roughly the observed count? Does the
  self-excitement kernel have a sensible timescale? Then ask the assistant to
  critique its own fit and see whether it finds what you found. Close on the
  framing from the abstract: the AI accelerates the work, you remain the
  scientist.

## ☕ Break (10m)

## Block 5 — Tier 3: the `pa` agent on a real repository (15m)

> Highest commitment, zero attendee typing. Recorded, so the timing is safe in
> fifteen minutes.

- **(2m) What an agent is.** Read tool, write tool, a loop, and permission to
  run things. Why that combination is a step change rather than a faster
  autocomplete.
- **(11m) The recorded run, narrated.** Hand `pa` the plan file from block 2
  against a real project repository. Same assistant as block 3, same sign-in,
  more autonomy — that continuity is the point. Chapters, each a natural pause
  point for questions:
  1. Orientation — it reads the repo and restates the plan in its own terms
  2. Implementation — the analysis, written across several files
  3. Refactor — the same code, made presentable
  4. Documentation — a methods section for the manuscript
  5. Project tracking — issues and a pull request on GitHub
  Pause briefly at each chapter boundary — about two minutes a chapter, so the
  recording itself must be cut tight. The narration is where the teaching
  happens: what you would have accepted, what you sent back.
  Anyone who wants to try it later has `_exercises/08_agent-followalong/`.
- **(2m) The bill.** Tokens, wall-clock and money for what the room just
  watched. Nobody else will tell them this and everybody wants to know.

## Block 6 — Local models and pitfalls (15m)

- **(7m) Ollama.** `_exercises/09_ollama-local`. The same up-call question
  against a local model — Posit Assistant takes a local provider, so this is a
  dropdown change rather than a different workflow. It is
  slower and worse — show that honestly — and it never leaves the laptop. When
  that trade is the right one: embargoed data, permits, no cloud, no budget.
- **(8m) Best practices and pitfalls, collected.** The list the room has been
  accumulating all session, now written down: context is a resource; docs in
  the prompt beat a bigger model; never accept a number you haven't checked;
  keep the plan in version control; the agent's confidence is uncorrelated with
  its correctness.

## Block 7 — Wrap-up (5m)

- Where this is going next. Brief, non-breathless.
- One slide on ellmer, as the next step for anyone who wants it: the same
  models, called as a function from your own R code, so a model can sit inside
  a script, a Shiny app or a pipeline. Not used in the session; it needs its
  own API key, and the three tiers don't need it.
- Where the materials live, how to keep going, feedback survey.
- Answer the abstract's closing question.

---

## What carries over from the full-day repo

| Full-day material | Fate |
|---|---|
| Anatomy of a conversation (Morning 1) | Condensed 20m → 10m, block 2 |
| Word-guessing games | Cut — playful but off-theme |
| Token possibilities demo | Cut — folded into one slide on context |
| Choosing a model | Cut as a block; one slide in block 6 |
| Vision / PDF input | Cut, except the figure-interpretation use in block 2 |
| Structured output, batch | Cut — a full-day topic |
| Plot-vs-noise hallucination demo | **Kept nearly intact**, block 2 |
| Coding assistant with docs in context | **Kept, re-skinned** to ERDDAP, block 3 |
| API-key setup and sharing app | Cut — Posit AI Pass replaces it |
| RAG | Cut — mention only |
| Tool calling, quiz-show progression | Cut — the agent demo covers the concept |
| querychat | Cut |
| MCP | Cut — one sentence in block 6 |
| Agents / Databot demo | **Expanded** into block 5, now on `pa` |
| Quarto site scaffold, `_exercises`/`_solutions` layout, setup flow | **Kept** as infrastructure |

## Open decisions

- Which repository the block-5 agent run operates on — it should be real and
  yours, and it must survive being shown to a room.
- Whether attendees install `pa` at all. Currently the setup check treats it as
  optional; if you'd rather they follow along in block 5, that changes the
  pre-workshop burden considerably.
- Whether Posit grants AI Pass seats and a Cloud instructor space. Both asks are
  in the syllabus; the setup path assumes yes and degrades to bring-your-own-key
  if not.
- The cold open's sunset check. Run it three times in the dry run and note
  where the shading starts each time, so you know what's likely on the day.
  Confirm the app build fits in eight minutes.
- Dataset staging: pre-loaded in the project, or fetched in block 3? Pre-loaded
  is safer for conference wifi.
