# Using AI in the Analysis of Marine Ecological Data

Half-day workshop (4 hours, two breaks). Scaffold only — the outline is
complete, the exercise files are stubs with the task structure in place.

```
narwc_workshop/
├── CLAUDE.md               # auto-loaded project context for Claude Code
├── HANDOFF.md              # narrative state, decisions, blockers, cold-start prompt
├── STATUS.md               # dated status snapshot
├── syllabus.md             # the Posit-facing syllabus
├── outline.md              # the timed outline, and what carries over from the full day
├── website/                # Quarto site: one page per block, listing-driven schedule
├── _exercises/             # numbered stubs, one folder per exercise
├── _solutions/             # (empty — fill as exercises firm up)
├── _demos/                 # (empty — cold open + agent recording live here)
└── data/                   # (empty — stage narw_upcalls.rds here)
```

Runs on Posit Assistant throughout — Positron, RStudio, and the `pa` terminal
TUI — with Posit AI Pass for access. No API keys anywhere in the setup path.

## Next steps

1. Stage the seven-day DCL/DE up-call dataset as `data/narw_upcalls.rds`. Every
   exercise reads from that path; change it in one place if you'd rather it live
   elsewhere. **Nothing is runnable until this is done.**
2. Hear back from Posit on AI Pass seats and a Cloud instructor space. The setup
   path assumes yes and degrades to bring-your-own-key if not.
3. Decide which repository the tier 3 agent run operates on.
4. Dry-run the cold open and pick the deliberate error (see `outline.md`).
5. Record the tier 3 spine, chaptered.
6. Fill `_solutions/` as the exercises settle.
7. Delete the original at `~/Documents/_research/rrr/llm/workshop_2026/` once
   you're satisfied this copy is good — keeping both is how they drift.

Working in Claude Code? `CLAUDE.md` loads automatically; read `HANDOFF.md` once
at the start of a new thread.

## Preview the site

```bash
quarto preview website
```

## License

CC-BY 4.0. Adapted in part from the posit::conf(2025) *Programming with LLMs*
workshop by Joe Cheng and Garrick Aden-Buie. See `LICENSE.md`.
