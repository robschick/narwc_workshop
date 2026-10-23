# Tier 3 — follow along (optional)

You do not need to run anything in this session. This folder is here for people
who have a terminal agent installed and want to try the same thing later.

## What is being demonstrated

The plan file you wrote with `/plan` in exercise 02, handed to the `pa` terminal
agent working on a real repository, in five chapters:

1. **Orientation** — it reads the repo and restates the plan in its own terms
2. **Implementation** — the analysis, written across several files
3. **Refactor** — the same code, made presentable
4. **Documentation** — a methods section for the manuscript
5. **Project tracking** — issues and a pull request

## To try it yourself afterwards

```bash
cd your-project
pa          # or: claude
> Read analysis-plan.md and tell me what you'd do first. Don't write code yet.
```

Note this is the same assistant and the same sign-in as the editor pane you used
in blocks 3 and 4. Only the autonomy is different.

That last sentence is the whole technique. Make it plan out loud before it acts,
and read the plan.

## Watch for

- Where it asks permission, and where it should have asked and didn't.
- What it does when the plan is ambiguous — does it ask, or does it guess?
- What the acceptance checks in your plan actually caught.
