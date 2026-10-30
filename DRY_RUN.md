# Dry run: blocks 2 → 3 → exercise 07, as an attendee

_Written 2026-10-29. Instructor-only. Delete or archive once the exercises are
rewritten to match what this run finds._

**Goal:** go through the agreed design end to end, in RStudio, the way an
attendee will, before any exercise gets rewritten. The exercise files still
describe the *old* design (self-exciting fit, no tier 3 hands-on), so follow
this checklist, not the stubs.

**Time it.** Run the stopwatch for every block. The schedule only works if each
step fits its slot with room for a slow laptop.

**Write down as you go:** anything you had to work out that an attendee
couldn't, every permission prompt, and the exact text of anything that went
wrong. These notes become the exercise rewrites.

---

## 0. Before you start (about 10 min, not timed)

- [ ] RStudio is **2026.04 or later** (Help → About).
- [ ] Posit Assistant is signed in **with AI Pass**, not with an API key.
      Note what the sign-in asked for, including whether it wanted a credit
      card.
- [ ] Open the workshop project from a **fresh clone**, not your working
      copy, so you see what an attendee sees.
- [ ] `calls <- readRDS(here::here("data/narw_upcalls.rds"))` loads 8,256 rows.
- [ ] Create `.posit/assistant/plans/` in the project.
      `.gitignore` currently ignores all of `.posit/`, so note whether the
      plan file shows up in the Git pane. We need it to.
- [ ] The project is a git repo and the Git pane is visible.

## 1. Block 2: planning (45 min slot, exercise 02 gets 15)

- [ ] Follow `_exercises/02_plan-with-chat/02_plan-with-chat.md` steps 1–3 in
      the chat pane. Answer as a typical attendee would, not as the author.
- [ ] Type `/plan`, then ask it to turn the conversation into an analysis plan.
- [ ] **When it finishes, does it offer "Exit and implement" / "Keep
      planning"?** Choose **Keep planning**. Note the exact wording and
      whether choosing it is obvious. If "Exit and implement" is the default
      or easy to hit by mistake, write that down: it changes the exercise text.
- [ ] Did it ask for confirmation before writing the file?
- [ ] **Where did the file land?** `.posit/assistant/plans/<timestamp>-….md`
      in the project, or `~/.posit/assistant/plans/` in your home folder?
- [ ] Open the plan and write the **acceptance checks** yourself. Copy it to
      `_exercises/02_plan-with-chat/analysis-plan.md`.
- [ ] Did the plan pick up anything from `data/data-dict.yaml` (UTC, log
      order, `Possibly_Detected`)? Did you have to point it there?
- [ ] Keep this plan. It becomes the canonical fallback plan (Q4), so keep
      it short and correct.

## 2. Tier 2b: the GAM LGCP (20 min slot)

Exercise 06 still says "self-exciting". Ignore it and ask for the decided
model instead:

> Bin `calls` into hourly counts using local time (`Etc/GMT+5`), then fit a
> Poisson GAM with mgcv: a cyclic smooth over hour of day plus a smooth over
> time. This is a discretised log-Gaussian Cox process.

- [ ] Did it bin in **local time** without being told, or did it use UTC?
      Try once *without* the "local time" phrase and note the result. That
      tells us whether the UTC trap catches people.
- [ ] Did it sort by `time`, or notice the rows aren't in time order?
- [ ] Did it decide anything about `Possibly_Detected` or the duplicates
      without asking you?
- [ ] Hourly bins or finer? Note which one makes a sensible daily-cycle plot.
- [ ] Keep the fit as `fit_gam`. Exercise 07 needs it.
- [ ] Time to a fitted model you believe: ___ min (slot: 20).

## 3. Exercise 07: verification, **assistant off** (15 min slot)

Close the assistant pane. Do these by hand on `fit_gam`:

- [ ] **The trap:** `sum(fitted(fit_gam))` against `nrow(calls)` (or the
      count you modelled). It should match exactly, and that's the point:
      a Poisson fit with an intercept and log link always matches. Is it
      easy to explain in one sentence?
- [ ] **Observed vs expected by day** and **by hour of day**. Do the daily
      totals miss in a pattern?
- [ ] **Dispersion:** `sum(residuals(fit_gam, "pearson")^2) / df.residual(fit_gam)`.
      Note the value.
- [ ] **Residual ACF:** `acf(residuals(fit_gam, "pearson"))`. Is there
      clustering left over?
- [ ] **Gaps, rescaled:** take **exactly the calls you counted for the fit**
      (if you dropped `Possibly_Detected` or duplicates there, drop them
      here too), sort by `time`, and integrate the fitted hourly intensity
      between successive calls (time rescaling). Duplicate start times give
      zero-length gaps; drop them first or note them. If the
      model is right, those rescaled gaps are Exp(1). QQ them against
      Exp(1). Too many short gaps means clustering the model hasn't
      explained. Don't compare raw gaps with one exponential at the mean
      rate: the daily cycle alone produces extra short gaps that way, even
      when the model is right.
- [ ] Is the time-rescaling code short enough to hand to attendees, and is
      the QQ plot readable without explanation?
- [ ] Pre-check by Claude (2026-10-29), with an hourly GAM
      `n ~ s(hour, bs = "cc") + s(bin, k = 40)` in local time, using all
      8,256 rows for both the fit and the rescaling (so the 5 duplicate
      pairs give 5 zero gaps):
      - dispersion ≈ 17
      - rescaled gaps clearly not Exp(1): the 99th percentile is 10.1 against
        4.6, and the median 0.47 against 0.69, i.e. bursts and long silences
      - hourly residual ACF is *negative* at lags 1–3 (−0.1, −0.41, −0.14),
        so at hourly bins the ACF mostly reflects the time smooth, not
        clustering

      Confirm on your own fit. The ACF check may need finer bins or dropping.
- [ ] Note which of these *clearly* shows something wrong on the real data.
      If none does at hourly resolution, the exercise needs a finer bin or a
      different check.
- [ ] Reopen the assistant: "Critique this fit." Did it find what you found?
      Did it suggest the total-count check as if it meant something?
- [ ] Time: ___ min (slot: 15). How long did the code take, and how long
      did reading the output take?

## 4. Tier 3: the agent, hands-on (10 min of the 20 min block)

- [ ] **Commit first** (Git pane → commit all), so the diff afterwards shows
      only what the agent did.
- [ ] Check the approval mode is **Normal**.
- [ ] Start a **new** chat and send:

      > Using @_exercises/02_plan-with-chat/analysis-plan.md: explore the
      > hourly call counts, state the assumptions a Poisson GLM with a daily
      > cycle makes and check them against the data, fit it, plot fitted
      > against observed, and summarise. Write everything to `tier3.R`.
      > Stop when done.

- [ ] Did `@` pick up the plan file in RStudio?
- [ ] Count the permission prompts: ___. Too many to get through in
      10 minutes? Was any of them confusing?
- [ ] Wall-clock time from send to "done": ___ min. **Must be under 8**, or
      the bail-out rule kicks in for everyone.
- [ ] **Did it say the Poisson GLM is wrong for these data**
      (overdispersion, autocorrelated residuals, clustered calls) without
      being asked? Or did it report a clean fit?
- [ ] Did it check any of your plan's acceptance checks?
- [ ] Did it touch anything other than `tier3.R`? Look at the **Git pane
      diff**.
- [ ] Note token use or cost if the pane shows it.
- [ ] Run it a second time from the same commit. Same outcome? If the agent
      sometimes flags the problem and sometimes doesn't, the debrief has to
      allow for both.
- [ ] Try it once with the **canonical** plan in place of your own. Same
      result?

## 5. Safety demo (b) (3 min slot)

- [ ] In the same session, ask: "What have you seen of `calls`? List the
      columns, how many rows, and any values you've seen."
- [ ] Does the answer show real rows or summaries? That's the demo. Screenshot it.
- [ ] Does the answer read clearly enough on a projector?

## 6. Cold-open checks (separate, but do them while set up)

- [ ] Does `pa` accept the napkin sketch image (`shiny_demo/plans/Shiny_Demo_Drawing.png`)?
- [ ] Build the app from the sketch. Does it plot by hour in **UTC** (the
      planted error) without being prompted? Run it three times. How often?
- [ ] Build time: ___ min (slot: 8).

## 7. Optional: a second pass in Positron

- [ ] Repeat sections 1 and 4 only. Note any difference in the plan
      prompt, `@` file references, or approvals compared with RStudio.

---

## What to bring back

| Question | Answer |
|---|---|
| Plan file location (project / home) | |
| "Keep planning" obvious? | |
| `.posit/` ignore needs narrowing? | |
| GAM step time vs 20 min | |
| Which exercise 07 check shows the problem best | |
| Agent run time vs 8 min | |
| Approvals per agent run | |
| Agent flagged the wrong model? (run 1 / run 2) | |
| Anything the agent touched besides `tier3.R` | |
| `pa` image input works? | |
| UTC error reproduces (x / 3) | |
| Anything an attendee could not have worked out alone | |
