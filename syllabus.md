# Workshop Syllabus — Using AI in the Analysis of Marine Ecological Data

**A half-day workshop · North Atlantic Right Whale Consortium Annual Meeting**

Prepared 2026-10-23 by Rob Schick · Duke University, Department of Marine
Conservation / Southall Environmental Associates

## Overview

This half-day workshop teaches marine mammal researchers to use AI in a real
analytical workflow, at three different levels, on one dataset
throughout: seven days of North Atlantic right whale up-call detections from the
publicly available
[DCLDE 2013 dataset](https://www.ncei.noaa.gov/access/metadata/landing-page/bin/iso?id=gov.noaa.ncei.pad%3ADCLDE_2013)
(NOAA NCEI).

After an initial instructor-led demonstration of building a shiny app to examine the call data, there will be three hands-on components in the workshop: 1) working with a chat interface for planning an analysis; 2) using a coding
assistant working alongside the researcher in a live R session; and 3) a
command-line agent working on a real repository. Attendees plan the analysis in
tier 1 and write the plan to a file; they do exploratory analysis, pull
environmental covariates from ERDDAP, and fit a log-Gaussian Cox process with
self-excitement in tier 2; and in tier 3 they hand the same plan file to an agent that implements it, refactors it, drafts a README, a pull-request with a code-flow distram. The session closes with an instructor-led demo of using local model via Ollama, for when
data privacy, cloud access or cost is a barrier.

Like it or not, some type of software engineering work is part of many modern scientist's workflow. AI has fundamentally altered how people can write code, so a critical goal of the workshop is to expose participants to several different ways of working with AI. Each instructional block is designed to use a familiar dataset, but work with AI in increasingly sophisticated ways. Throughout, there will be an emphasis on checking and verifying AI's
output, not blindly trusting it. The framing throughout: the AI accelerates the
work, but you remain the scientist. Your experience and deep knowledge matters in critical ways.

## Audience and prerequisites

Attendees are researchers at the North Atlantic Right Whale Consortium annual
meeting: field biologists, acousticians, population modelers, and agency staff,
with a wide spread of programming experience.

Required: basic R familiarity — able to read a script, install a package, and
make a plot. No AI experience is assumed, and no machine-learning background is
needed.

## Posit tooling

The workshop runs end to end on the Posit stack.
[Posit Assistant](https://assistant.posit.co/docs/getting-started/) ships in
Positron, RStudio and a terminal TUI, which correspond to the three tiers this
workshop teaches — so a single product carries the whole arc, and an attendee
never has to switch vendors to move up a tier.

| Tool | Role in the workshop | Block |
| --- | --- | --- |
| [Positron](https://positron.posit.co) | Primary editor for the hands-on blocks; the assistant reads the live R session, its data frames and plots | 3, 4 |
| [RStudio](https://docs.posit.co/ide/user/ide/guide/tools/posit-ai.html) | Supported alternative throughout, with Posit Assistant chat and Next-Edit Suggestions, so long-time RStudio users are not forced to switch editors to attend | 3, 4 |
| [Posit Assistant](https://assistant.posit.co/docs/getting-started/) | The one assistant across all three tiers | 1–6 |
| [Plan Mode](https://assistant.posit.co/docs/features/plan-mode/) (`/plan`) | Tier 1. Explores read-only, asks clarifying questions, and writes a timestamped markdown plan to `.posit/assistant/plans/`. This file is critical to the workshop: it gets written in block 2, and then handed to the agent in block 5 | 2, 5 |
| [`pa` terminal TUI](https://assistant.posit.co/downloads/tui/) | Tier 3. The agentic finale on a real repository: first step-by-step with the instructor approving each action, then given the plan file in one command and left to run on its own | 1, 5 |
| [Posit AI Pass](https://docs.posit.co/posit-ai/user/) | Sign-in-once access with no API keys to manage; removes key provisioning from the setup path entirely | all |
| [Posit Cloud](https://docs.posit.co/cloud/guide/teach/index.html) | Instructor space with the project pre-built, as the fallback for anyone whose laptop fights the local install | all |
| [ellmer](https://ellmer.tidyverse.org) | Programmatic LLM calls from R, for the scripted exercises and the Ollama comparison | 2, 3, 6 |
| Ollama (via Posit Assistant and ellmer) | Local-model closing segment; Posit Assistant supports local models alongside Anthropic, OpenAI and Gemini | 6 |

Two features of the Posit stack do real pedagogical work here rather than just
appearing in the syllabus. Plan Mode writes a plan to a file, which is precisely
the hand-off this workshop is built around — the artifact an attendee produces
in tier 1 is the input an agent consumes in tier 3, and Posit builds that
hand-off in, so we don't have to rig up a workaround of our own. And because
Posit Assistant spans editor, IDE and terminal, the escalation from tier 1 to
tier 3 is a change in how much autonomy the researcher grants, not a change in
product, which is a much clearer lesson than three unrelated tools would be.

Wherever `pa` appears, the materials also name Claude Code as the equivalent
command-line agent, for attendees who already use it.

## Schedule

Three hours including one break. The shape is deliberate: the room is shown the
destination before the machinery and types for the middle two hours. The final
block is watched rather than typed, because by then attention is lowest.

| # | Block | Mins | Mode | Posit surface |
| --- | --- | --- | --- | --- |
| 1 | Cold open: napkin to app | 15 | Watch | `pa` terminal agent |
| 2 | Tier 1 — planning the analysis | 45 | Hands-on | Posit Assistant chat, `/plan` |
| 3 | Tier 2a — EDA and environmental covariates | 40 | Hands-on | Posit Assistant in Positron or RStudio |
| 4 | Tier 2b — fitting the LGCP, and checking it | 35 | Hands-on | Posit Assistant in Positron or RStudio |
| — | Break | 10 | | |
| 5 | Tier 3 — the agent on a real repository | 15 | Watch | `pa` terminal agent |
| 6 | Local models and pitfalls | 15 | Watch | Ollama via Posit Assistant |
| 7 | Wrap-up and feedback | 5 | | |

**Block 1** opens cold, with no slides: a hand-drawn sketch of a dashboard, the
raw detection file, and an agent that turns them into a working Shiny app
showing calls per hour by time of day. Four minutes are then spent on an error
deliberately planted in it, which sets the tone for the day: a polished, working
app can still be wrong. A recording of the run is ready as a backup. Setup is done before the session, from
the workshop site, with Posit Cloud as the fallback for anyone it fails for.

**Block 2** teaches the conversation model — system, user and assistant roles,
and the fact that context is a resource spent deliberately — then has attendees
describe the dataset and ask for candidate models rather than code. It includes
a hallucination exercise in which the same figure-interpretation question is
asked of a real plot and of a plausible-looking plot built from noise. The block
ends with `/plan` writing the analysis plan to a file.

*Verification step (block 2):* compare the assistant's reading of the real plot
with its reading of the noise plot, then judge whether the `/plan` file is
specific enough to act on — model form, covariates, and how the fit will be
checked.

**Blocks 3 and 4** are the hands-on core. The covariate exercise is the most
useful habit in the workshop: ask for ERDDAP extraction code cold, watch the
model invent function signatures, then paste the package documentation into the
prompt and watch it succeed. Block 4 fits the model and then, with the assistant
switched off, verifies the fit by hand before asking the assistant to critique
its own work.

*Verification step (block 3):* spot-check the extracted covariates against an
ERDDAP map or a known value at a known time and place before they enter a model.

*Verification step (block 4):* with the assistant off, integrate the fitted
intensity and compare it to the observed call count, check that the
self-excitation kernel's timescale is biologically plausible, and examine
time-rescaled residuals with a KS test and QQ plot. Only then ask the assistant
to critique its own fit.

**Block 5** hands the plan file from block 2 to the `pa` agent on a real
repository, in five chapters with a pause at each: orientation, implementation,
refactor, manuscript documentation, and a pull request. It is recorded, so the
timing is safe in a fifteen-minute slot. The block closes by showing the actual
token and dollar cost of what the room just watched.

## Learning outcomes

By the end of the session an attendee can:

1. Describe a dataset to an AI assistant well enough to get useful modeling
   advice, and recognize when an answer is agreeable rather than correct.
2. Produce a written analysis plan with `/plan` and judge whether it is specific
   enough to act on.
3. Use Posit Assistant in a live R session for exploratory analysis, reading
   generated code critically before running it.
4. Supply package documentation as context, and explain why that beats reaching
   for a larger model.
5. Verify a fitted model independently of the tool that produced it — integrate
   the intensity, check the kernel timescale, examine rescaled residuals.
6. Judge when an agentic workflow is worth the setup cost, and when a chat
   window is enough.
7. Decide when a local model is the right trade for data that cannot leave the
   laptop.

## Logistics

- **Meeting dates and venue:** North Atlantic Right Whale Consortium Annual
  Meeting, Halifax, Nova Scotia, Canada. November 18, 2026.
  <https://www.narwc.org/annual-meeting.html>
- **Workshop slot:** 08:30–11:30
- **Expected headcount:** 15-20

**Materials.** Published as a Quarto site under a CC-BY license, adapted in part
from the posit::conf(2025) *Programming with LLMs* workshop by Joe Cheng and
Garrick Aden-Buie, which is itself CC-BY.

**Dataset.** Seven days of North Atlantic right whale up-call detections from
the DCLDE 2013 dataset, pre-staged in the project so that nothing depends on
conference wifi. The data are publicly available from NOAA NCEI, so they can be
shared freely with attendees and in the Cloud project.

## Sources

- [Posit Assistant — Getting Started](https://assistant.posit.co/docs/getting-started/)
- [Posit Assistant — Plan Mode](https://assistant.posit.co/docs/features/plan-mode/)
- [Posit Assistant — Terminal (TUI)](https://assistant.posit.co/downloads/tui/)
- [Posit Assistant in Positron](https://positron.posit.co/assistant.llms.md)
- [Posit Assistant in RStudio](https://docs.posit.co/ide/user/ide/guide/tools/posit-ai.html)
- [Posit AI Pass user guide](https://docs.posit.co/posit-ai/user/) and [FAQ](https://docs.posit.co/posit-ai/user/faq/)
- [Posit AI solutions overview](https://posit.co/solutions/ai)
- [Teaching with Posit Cloud](https://docs.posit.co/cloud/guide/teach/index.html) and [instructor spaces](https://support.posit.co/hc/en-us/articles/34788647349527-How-to-Set-Up-an-Instructor-Space-in-Posit-Cloud)
- [DCLDE 2013 dataset, NOAA NCEI](https://www.ncei.noaa.gov/access/metadata/landing-page/bin/iso?id=gov.noaa.ncei.pad%3ADCLDE_2013)
