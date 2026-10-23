# Workshop Syllabus — Using AI in the Analysis of Marine Ecological Data

**A half-day workshop · North Atlantic Right Whale Consortium annual meeting**

Prepared 2026-10-07 by Rob Schick, Southall Environmental Associates / Duke
University Marine Geospatial Ecology Lab

> Also published as a Claude doc at <https://claude.ai/artifact/4gyMGsWVSjseJPKvSFG2Xs>
> — the shareable, commentable version. Keep the two in sync or pick one as
> canonical.

## Overview

This half-day workshop teaches marine mammal researchers to use AI in a real
analytical workflow, at three escalating levels of commitment, on one dataset
throughout: seven days of DCL/DE detections of North Atlantic right whale
up-calls.

The three tiers are a chat interface for planning an analysis; a coding
assistant working alongside the researcher in a live R session; and a
command-line agent turned loose on a real repository. Attendees plan the
analysis in tier 1 and write the plan to a file; they do exploratory analysis,
pull environmental covariates from ERDDAP, and fit a log-Gaussian Cox process
with self-excitement in tier 2; and in tier 3 they watch that same plan file
handed to an agent that implements it, refactors it, drafts a methods section,
and opens a pull request. The session closes with a local model via Ollama, for
when data privacy, cloud access or cost is a barrier.

The pedagogical spine is critical use. Every hands-on block ends in verification
rather than execution, and the recurring question is not whether the code ran
but whether the answer is right. The framing throughout: the AI accelerates the
work, but you remain the scientist.

## Audience and prerequisites

Attendees are researchers at the North Atlantic Right Whale Consortium annual
meeting: field biologists, acousticians, population modellers, and agency staff,
with a wide spread of programming experience.

Required: basic R familiarity — able to read a script, install a package, and
make a plot. No AI experience is assumed, and no machine-learning background is
needed.

The audience matters for the tooling choice. Many are long-time RStudio users
who have never opened a different editor, a meaningful number have never used a
terminal, and most have never held an API key. A workshop that opens with key
provisioning loses the room in the first fifteen minutes. This is the single
biggest design constraint, and it is what the request to Posit addresses.

## Posit tooling

The workshop runs end to end on the Posit stack.
[Posit Assistant](https://assistant.posit.co/docs/getting-started/) ships in
Positron, RStudio and a terminal TUI, which happens to map exactly onto the
three tiers this workshop teaches — so a single product carries the whole arc,
and an attendee never has to switch vendors to move up a tier.

| Tool | Role in the workshop | Block |
| --- | --- | --- |
| [Positron](https://positron.posit.co) | Primary editor for the hands-on blocks; the assistant reads the live R session, its data frames and plots | 3, 4 |
| [RStudio](https://docs.posit.co/ide/user/ide/guide/tools/posit-ai.html) | Supported alternative throughout, with Posit Assistant chat and Next-Edit Suggestions, so long-time RStudio users are not forced to switch editors to attend | 3, 4 |
| [Posit Assistant](https://assistant.posit.co/docs/getting-started/) | The one assistant across all three tiers; replaced Positron Assistant and Databot as the default AI experience in Positron 2026.07 | 2–5 |
| [Plan Mode](https://assistant.posit.co/docs/features/plan-mode/) (`/plan`) | Tier 1. Explores read-only, asks clarifying questions, and writes a timestamped markdown plan to `.posit/assistant/plans/`. This file is the workshop's spine — written in block 2, handed to the agent in block 5 | 2, 5 |
| `pa` terminal TUI | Tier 3. The agentic finale, interactive and headless, operating on a real repository | 5 |
| [Posit AI Pass](https://docs.posit.co/posit-ai/user/) | Sign-in-once access with no API keys to manage; removes key provisioning from the setup path entirely | all |
| [Posit Cloud](https://docs.posit.co/cloud/guide/teach/index.html) | Instructor space with the project pre-built, as the fallback for anyone whose laptop fights the local install | all |
| [ellmer](https://ellmer.tidyverse.org) | Programmatic LLM calls from R, for the scripted exercises and the Ollama comparison | 2, 3, 6 |
| Ollama (via Posit Assistant and ellmer) | Local-model closing segment; Posit Assistant supports local models alongside Anthropic, OpenAI and Gemini | 6 |

Two features of the Posit stack do real pedagogical work here rather than just
appearing in the syllabus. Plan Mode writes a plan to a file, which is precisely
the hand-off this workshop is built around — the artifact an attendee produces
in tier 1 is the input an agent consumes in tier 3, and Posit ships that as a
first-class feature rather than something we have to improvise. And because
Posit Assistant spans editor, IDE and terminal, the escalation from tier 1 to
tier 3 is a change in how much autonomy the researcher grants, not a change in
product, which is a much clearer lesson than three unrelated tools would be.

## Schedule

Four hours including two breaks. The shape is deliberate: the room is shown the
destination before the machinery, types for the middle two hours, and watches
the most impressive material at the end when attention is lowest.

| # | Block | Mins | Mode | Posit surface |
| --- | --- | --- | --- | --- |
| 1 | Cold open: zero to a diel pattern | 25 | Watch | `pa` terminal agent |
| 2 | Tier 1 — planning the analysis | 45 | Hands-on | Posit Assistant chat, `/plan` |
| — | Break | 15 | | |
| 3 | Tier 2a — EDA and environmental covariates | 40 | Hands-on | Posit Assistant in Positron or RStudio |
| 4 | Tier 2b — fitting the LGCP, and checking it | 35 | Hands-on | Posit Assistant in Positron or RStudio |
| — | Break | 10 | | |
| 5 | Tier 3 — the agent on a real repository | 55 | Watch, plus one live task | `pa` terminal agent |
| 6 | Local models and pitfalls | 10 | Watch | Ollama via Posit Assistant |
| 7 | Wrap-up and feedback | 5 | | |

**Block 1** opens cold, with no slides: the raw detection file, one sentence of
intent, and an agent that reads the data, plots calls per hour against time of
day, and flags the diel structure. Four minutes are then spent on what it got
wrong, which sets the tone for the day. Setup troubleshooting happens under
cover of this block.

**Block 2** teaches the conversation model — system, user and assistant roles,
and the fact that context is a resource spent deliberately — then has attendees
describe the dataset and ask for candidate models rather than code. It includes
a hallucination exercise in which the same figure-interpretation question is
asked of a real plot and of a plausible-looking plot built from noise. The block
ends with `/plan` writing the analysis plan to a file.

**Blocks 3 and 4** are the hands-on core. The covariate exercise is the most
useful habit in the workshop: ask for ERDDAP extraction code cold, watch the
model invent function signatures, then paste the package documentation into the
prompt and watch it succeed. Block 4 fits the model and then, with the assistant
switched off, verifies the fit by hand before asking the assistant to critique
its own work.

**Block 5** hands the plan file from block 2 to the `pa` agent on a real
repository, in five chapters with a pause at each: orientation, implementation,
refactor, manuscript documentation, and a pull request. A recorded spine keeps
the timing safe; one live task at the end keeps it honest. The block closes by
showing the actual token and dollar cost, which nobody else tells them and
everybody wants to know.

## Learning outcomes

By the end of the session an attendee can:

1. Describe a dataset to an AI assistant well enough to get useful modelling
   advice, and recognise when an answer is agreeable rather than correct.
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

## Request to Posit

Two asks, both aimed at the same problem: getting a room of marine mammal
researchers productive inside the first fifteen minutes rather than the first
hour.

**Posit AI Pass seats for attendees, for the day of the workshop.** API key
provisioning is the failure mode that kills hands-on AI workshops. Attendees
arrive without keys, do not have a billing relationship with a model provider,
and would be asked to create accounts and paste secrets into `.env` files before
writing a line of analysis. AI Pass removes that entirely — sign in once, no
keys to manage — and it is the difference between a workshop that starts on time
and one that spends its first block on troubleshooting. A seat is listed at
$20/month with $15 in monthly credits, and the documentation notes no education
discount at present, so this is a genuine request rather than something we can
absorb. Day-of or short-term access for the registered attendee list would be
ideal.

**A Posit Cloud instructor space with the project pre-built.** Even with the
assistant sorted, local installs are the other reliable time sink: R versions,
compilers for the spatial and point-process dependencies, and institutional
laptops with locked-down permissions. A Cloud instructor space gives every
attendee an identical working environment in a browser tab and gives us a
fallback that does not derail the room. Posit already documents this workflow
for teaching, so we would be using it as intended.

**What Posit gets.** The workshop is a four-hour showcase of Posit Assistant
across all three of its surfaces, in front of an audience of government,
academic and NGO researchers who make tooling decisions for their own labs and
who are, as a group, early in their AI adoption. Positron and RStudio are
presented as equal first-class paths, so the session reaches the large
contingent who have not left RStudio. The materials are openly licensed and will
be published as a Quarto site that outlives the meeting. We are glad to credit
Posit's support explicitly in the materials and from the front of the room, and
to share a candid write-up of what worked and what did not — including where
attendees got stuck, which is probably the more useful half for Posit.

## Logistics and open items

To be filled before this goes to Posit:

- [ ] Meeting dates and venue
- [ ] Workshop slot — which half-day, and whether it runs against other sessions
- [ ] Expected headcount, which sets the number of AI Pass seats requested
- [ ] Room facilities — power, wifi bandwidth, projector resolution

Still being decided on our side:

- [ ] Which repository the block 5 agent run operates on
- [ ] Whether `pa` is installed by attendees or stays instructor-only
- [ ] The deliberate error in the cold open, to be chosen during dry-run

**Materials.** Published as a Quarto site under a CC-BY licence, adapted in part
from the posit::conf(2025) *Programming with LLMs* workshop by Joe Cheng and
Garrick Aden-Buie, which is itself CC-BY.

**Dataset.** Seven days of DCL/DE detections of North Atlantic right whale
up-calls, pre-staged in the project so that nothing depends on conference wifi.

## Sources

- [Posit Assistant — Getting Started](https://assistant.posit.co/docs/getting-started/)
- [Posit Assistant — Plan Mode](https://assistant.posit.co/docs/features/plan-mode/)
- [Posit Assistant in Positron](https://positron.posit.co/assistant.llms.md)
- [Posit Assistant in RStudio](https://docs.posit.co/ide/user/ide/guide/tools/posit-ai.html)
- [Posit AI Pass user guide](https://docs.posit.co/posit-ai/user/) and [FAQ](https://docs.posit.co/posit-ai/user/faq/)
- [Posit AI solutions overview](https://posit.co/solutions/ai)
- [Teaching with Posit Cloud](https://docs.posit.co/cloud/guide/teach/index.html) and [instructor spaces](https://support.posit.co/hc/en-us/articles/34788647349527-How-to-Set-Up-an-Instructor-Space-in-Posit-Cloud)
