# Request to Posit — NARWC AI workshop

2026-10-26 · Rob Schick

Support request for the half-day workshop described in the workshop syllabus
(`syllabus.md`).

The workshop runs 08:30–11:30 on November 18, 2026, at the North Atlantic Right
Whale Consortium annual meeting in Halifax, Nova Scotia, for an expected 15–20
attendees.

## The asks

Two asks, both aimed at the same problem: getting every attendee set up before
they arrive, so the three hours go to the analysis and not to installs.

**Posit AI Pass seats for attendees, from setup through the workshop.** Most
attendees have never had an API key or a billing account with a model provider.
Without AI Pass, setup means creating those accounts and pasting keys into
`.env` files before any analysis starts. With it, setup is a sign-in. Attendees
run a short setup check from the workshop site the week before the meeting, so
seats would need to be active from about November 11 through November 18. A
seat is listed at $20/month with $15 in monthly credits, and there is currently
no education discount. For 15–20 attendees that comes to roughly $300–400, plus
instructor seats. [Without support, this would be paid by ___.]

**A Posit Cloud instructor space with the project pre-built.** Local installs are
the other common problem: R versions, compilers for the spatial and
point-process packages, and institutional laptops that don't allow installing
software. A Cloud instructor space gives every attendee the same environment in
a browser tab. Anyone whose local setup fails can switch to it without holding
up the room. Posit already documents this setup for teaching.

## What Posit gets

The workshop uses Posit Assistant in all three places it ships: Positron,
RStudio and the `pa` terminal. The audience is government, academic and NGO
researchers who choose the tools their own labs use, and most are just starting
to use AI. Positron and RStudio are treated as equal paths, so the session
reaches the many attendees who still work in RStudio. The materials are openly
licensed and will stay up as a Quarto site after the meeting. We will credit
Posit's support in the materials and from the front of the room. Afterward we
will send a frank write-up of what worked and what didn't, including where
attendees got stuck.

## Questions we would like Posit's help with

1. **Credentials for scripted exercises.** Three exercises call models directly
   from R with ellmer. Can AI Pass access be used from ellmer, or would Posit be
   able to provide workshop credentials for those calls, as at posit::conf(2025)?
2. **Posit Cloud.** Do Posit Assistant and AI Pass sign-in work inside a Posit
   Cloud project? The Cloud fallback depends on it.
3. **RStudio parity.** Is `/plan` available in RStudio's Posit Assistant, and
   does the RStudio chat see the live R session as Positron's does?
4. **The `pa` TUI.** Is `pa` covered by an AI Pass seat? This decides whether
   attendees install it or it stays instructor-only.
5. **Instructor usage.** Recording the block 5 agent run, and rehearsing it,
   will use well over $15 of credit. Is a higher-credit instructor seat
   possible?

The workshop is on November 18, so the timeline is short. An answer by
November 3 would give us time to build the Cloud project and send setup
instructions a week ahead.

Rob Schick · Duke University / Southall Environmental Associates · [email]

## Sources

- [Posit AI Pass user guide](https://docs.posit.co/posit-ai/user/) and [FAQ](https://docs.posit.co/posit-ai/user/faq/)
- [Teaching with Posit Cloud](https://docs.posit.co/cloud/guide/teach/index.html) and [instructor spaces](https://support.posit.co/hc/en-us/articles/34788647349527-How-to-Set-Up-an-Instructor-Space-in-Posit-Cloud)
