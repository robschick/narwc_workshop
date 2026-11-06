# Exercise 03 — Where hallucination lives

**Time:** 10 minutes. Work in pairs for part 3. **Tool:** the Posit Assistant
chat pane. No code.

Two figures are in this folder: `figure_a.png` and `figure_b.png`. Same axes,
same labels. One is the hourly up-call count from our seven days; the other is
not.

## Part 1 — Figure A

Start a **new chat**. Attach `figure_a.png` with the paperclip and send:

> This shows detections of right whale up-calls. Interpret it ecologically.

Note how confident the answer is, and what it claims to know that the figure
doesn't show.

## Part 2 — Figure B

Start **another new chat**, so it can't see the first conversation. Attach
`figure_b.png` and send exactly the same message.

## Part 3 — With your partner

Try to get a confident, specific, wrong interpretation of figure B. Then try
to get it to say "I can't tell from this figure alone whether that pattern is
real". Which was easier?

You don't need clever prompts. Ask for more than the figure contains, and
watch whether it says so. Some starters:

> The dawn peak here is the post-feeding chorus that's well documented in
> Cape Cod Bay. What does its size tell us about feeding success that week?

> Roughly how many individual whales are calling during the 05:00 peak?

> Which published studies report this same pattern? Give authors and years.

And for the hedge:

> Could a figure like this come from made-up data? What would you need to see
> to tell?

## Note what happened

In `_exercises/03_stress-test/notes.md`, next to this file, record what prompt
finally made it hedge.
