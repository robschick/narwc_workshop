# Using AI in the Analysis of Marine Ecological Data

**Half-day workshop (4 hours, two breaks) · North Atlantic right whale up-calls**

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
   up-calls is on screen from minute three to minute 240. No toy examples, no
   context switching.
2. **Wow first, explain second.** The room sees the destination before it sees
   the machinery. Setup troubleshooting hides under the cold open.
3. **Escalating commitment, one product.** Posit Assistant ships in Positron,
   in RStudio, and as the `pa` terminal TUI — which is exactly the three tiers.
   So moving up a tier is a change in how much autonomy you grant, not a change
   in vendor. Anyone can stop at any tier and still leave with something useful.
   Claude Code is named as the equivalent alternative wherever `pa` appears.
4. **The scientist stays in the loop.** Every hands-on block ends with a
   verification step. The recurring question is not *did it run?* but *is it
   right?*
5. **Hands-on in the middle, hands-off at the ends.** Attendees type during
   blocks 2–5. Blocks 1, 6 and 7 they watch.

## Arc

| # | Block | Mins | Mode | Beat |
|---|-------|------|------|------|
| 1 | Cold open: zero to a diel pattern | 25 | Watch | **Wow** |
| 2 | Tier 1 — Planning with a chat interface | 45 | Hands-on | Feet wet |
| — | ☕ Break | 15 | | |
| 3 | Tier 2a — The assistant in your session: EDA & covariates | 40 | Hands-on | Feet dirty |
| 4 | Tier 2b — Fitting the LGCP, and checking it | 35 | Hands-on | Feet dirty |
| — | ☕ Break | 10 | | |
| 5 | Tier 3 — the `pa` agent on a real repository | 55 | Watch (+1 live) | **Wow** |
| 6 | Local models and pitfalls | 10 | Watch | Land it |
| 7 | Wrap-up and feedback | 5 | | |

Total: 240 minutes.

---

## Block 1 — Cold open: zero to a diel pattern (25m)

> No slides for the first eight minutes. The workshop opens with the thing
> people came to see.

- **(8m) The cold open.** Live, from an empty directory: hand the `pa` agent the
  raw seven-day up-call detection file and one sentence of intent. It reads the
  file, describes the columns, notices the detections are timestamped, plots
  calls-per-hour against time of day, and flags the diel structure. Do not
  narrate while it runs — let the room read the screen.
- **(4m) Pull the curtain back.** Same result, honestly framed: what it got
  right, what it assumed, and the one thing in the output that is wrong (there
  is always one — find it during dry-run and keep it). This sets the tone for
  the whole session: impressive is not the same as correct.
- **(5m) Welcome, and the map.** Who's here, the three tiers, and the promise:
  by 17:00 you will have done tiers 1 and 2 yourself and watched tier 3.
- **(8m) Setup checkpoint.** `_exercises/01_setup-check/` — confirm the Posit
  AI Pass sign-in, confirm the assistant answers in the editor, confirm `pa`
  runs in a terminal. With AI Pass there are no keys to paste, which is the
  whole reason this block is eight minutes instead of thirty. Posit Cloud is the
  fallback for anyone whose laptop fights the install. Helpers circulate.

*Changed from the parent repo:* the Morning 1 "verify API access" beat and its
`.env` / API-key-sharing app are **gone**. AI Pass is a sign-in, not a secret,
and removing key provisioning from minute ten is the single biggest improvement
over the full-day version.

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

## ☕ Break (15m)

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

## Block 5 — Tier 3: the `pa` agent on a real repository (55m)

> Highest commitment, zero attendee typing. Recorded spine so the timing is
> safe; one live task at the end so the room knows it's real.

- **(5m) What an agent is.** Read tool, write tool, a loop, and permission to
  run things. Why that combination is a step change rather than a faster
  autocomplete.
- **(30m) The recorded run, narrated.** Hand `pa` the plan file from block 2
  against a real project repository. Same assistant as block 3, same sign-in,
  more autonomy — that continuity is the point. Chapters, each a natural pause
  point for questions:
  1. Orientation — it reads the repo and restates the plan in its own terms
  2. Implementation — the analysis, written across several files
  3. Refactor — the same code, made presentable
  4. Documentation — a methods section for the manuscript
  5. Project tracking — issues and a pull request on GitHub
  Pause the recording at each chapter boundary. The narration is where the
  teaching happens: what you would have accepted, what you sent back.
  Anyone who wants to try it later has `_exercises/08_agent-followalong/`.
- **(15m) The live flourish.** One task, taken from the room if possible:
  *"now add a figure showing the fitted intensity against the observed calls,
  and put it in the manuscript."* Run it live. If it fails, that is also a
  lesson and you have the recording as a backstop.
- **(5m) The bill.** Tokens, wall-clock and money for what the room just
  watched. Nobody else will tell them this and everybody wants to know.

## Block 6 — Local models and pitfalls (10m)

- **(5m) Ollama.** `_exercises/09_ollama-local`. The same up-call question
  against a local model — Posit Assistant takes a local provider, so this is a
  dropdown change rather than a different workflow. It is
  slower and worse — show that honestly — and it never leaves the laptop. When
  that trade is the right one: embargoed data, permits, no cloud, no budget.
- **(5m) Best practices and pitfalls, collected.** The list the room has been
  accumulating all session, now written down: context is a resource; docs in
  the prompt beat a bigger model; never accept a number you haven't checked;
  keep the plan in version control; the agent's confidence is uncorrelated with
  its correctness.

## Block 7 — Wrap-up (5m)

- Where this is going next. Brief, non-breathless.
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
- The deliberate error in the cold open — pick it during dry-run, don't
  improvise it.
- Dataset staging: pre-loaded in the project, or fetched in block 3? Pre-loaded
  is safer for conference wifi.
