---
name: game-testing
description: Systematic QA and bug-hunting for simple 2D or 3D games, especially web and Three.js games. Use when asked to test, playtest, QA, debug, or find bugs in a game, or to verify a game against its RULES.md. Produces a test plan, automated checks where possible, and a severity-ranked bug report.
---

# Game Testing

Test a game the way a QA engineer would, using Claude Code or a chat session with the project files.

## Workflow
1. **Read the rules**: open `RULES.md` if it exists (from the game-rules-core skill). If not, infer rules from the code and write them down first. Untestable rules are bugs in the spec.
2. **Map the code**: find the game loop, state machine, input handling, collision, spawn, and scoring code.
3. **Static review**: scan for the common bugs in `references/checklist.md`.
4. **Write tests**: unit-test pure logic (collision math, scoring, state transitions) and add a deterministic simulation test where possible (fixed seed, fixed dt, scripted input).
5. **Run and observe**: run the tests and, if a browser tool is available, play the game and capture console errors.
6. **Report**: write `BUG_REPORT.md` using the format below.

## Test categories (cover all)
- **Core loop**: starts, pauses, resumes, restarts, game over, win. Every state transition works and resets the right things.
- **Input**: simultaneous keys, key held across pause, rapid taps, focus loss (blur), touch and gamepad if supported.
- **Collision/physics**: tunneling at high speed, corner snagging, standing on edges, moving platforms, falling out of the world.
- **Rules**: each line of `RULES.md` has at least one test: trigger, condition, effect, edge case.
- **Scoring/progress**: increments correctly, no double counting, resets on restart, persistence (localStorage) survives reload and handles corrupt data.
- **Spawning**: limits respected, always passable, no entities left after restart, no memory growth over time.
- **Frame-rate independence**: run at simulated 30, 60, and 144 FPS; gameplay results must match.
- **Performance**: frame time, entity count growth, memory leaks, draw calls (3D).
- **Robustness**: resize window, tab switch, rapid restart, mobile viewport.
- **Determinism**: same seed plus same inputs gives the same result.

## Bug report format
For each bug:
- **ID / Title**
- **Severity**: Critical (crash, soft-lock, progress loss) / Major (rule broken) / Minor (visual, feel) / Polish
- **Steps to reproduce** (numbered, exact)
- **Expected vs Actual**
- **Evidence**: file and line, console error, or failing test name
- **Suggested fix** (one or two lines)

End the report with a summary table (counts per severity) and a list of what was NOT tested.

## Hard rules
- Never claim a bug without evidence (a failing test, a log, or a code path you can point to).
- Never claim something works if you did not run it; say "reviewed, not executed".
- Prefer deterministic tests over "I played it and it felt fine".
- Do not change gameplay code unless asked; report first, fix on request.
