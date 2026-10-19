# Game Skills Test Documentation

**Document type:** Static package validation and QA readiness review  
**Review date:** 2026-10-19  
**Status:** Package checks completed; actual game execution not performed

## 1. Scope

This review covers the two uploaded ZIP packages:

- `game-testing.zip` — game QA workflow and common bug checklist.
- `game-rules-core.zip` — game-rule design workflow and collision/physics reference.

The supplied archives contain skill instructions and reference Markdown files. They do **not** include a game repository, game source code, executable build, automated test suite, or browser session. Therefore, this document validates package integrity and documentation coverage; it does not certify a particular game as working.

## 2. Test environment and method

- Inputs: the two uploaded ZIP archives.
- Method: ZIP integrity checks, file inventory, metadata/front-matter inspection, and targeted content assertions.
- Execution: no game runtime, browser playtest, unit test suite, or performance profiler was available in the supplied files.
- Evidence standard: a check is marked PASS only for the package-level property actually inspected. Game behavior remains unverified unless executed against the game itself.

## 3. Results summary

| ID | Check | Result | Evidence / notes |
|---|---|---|---|
| PKG-01 | ZIP integrity | **PASS** | Both archives passed ZIP CRC/integrity validation (testzip returned no corrupt member). |
| PKG-02 | Expected Markdown files | **PASS** | Both packages contain a SKILL.md and the referenced Markdown guide/checklist. |
| PKG-03 | Skill metadata | **PASS** | game-testing name field: 'game-testing'. |
| PKG-04 | Skill metadata | **PASS** | game-rules-core name field: 'game-rules-core'. |
| PKG-05 | Required workflow and reporting guidance | **PASS** | Checked that the testing workflow includes review, test creation, execution/observation, report output, and evidence-based claims. |
| PKG-06 | Rules coverage guidance | **PASS** | Checked for core gameplay rules and frame-rate-independent update guidance. |
| PKG-07 | Collision reference guidance | **PASS** | Checked for common collision/physics failure modes. |
| PKG-08 | Cross-package game testing checklist | **PASS** | Checked representative game-loop, persistence, and browser-specific QA cases. |

## 4. Package inventory

### `game-testing.zip`

| File | Purpose |
|---|---|
| `game-testing/SKILL.md` | Defines QA workflow, test categories, bug-report structure, and evidence requirements. |
| `game-testing/references/checklist.md` | Checklist for game loop/state, input, collisions, spawning/memory, scoring/save, and web-specific issues. |

### `game-rules-core.zip`

| File | Purpose |
|---|---|
| `game-rules-core/SKILL.md` | Defines the process for documenting game rules before implementation and includes universal rules plus genre-specific additions. |
| `game-rules-core/references/collision.md` | Describes collider choices, collision pipeline, known physics bugs, layer interactions, and physics constants. |

## 5. Coverage assessment

### Game Testing skill

Documented test categories include:

- Core loop and state transitions: start, pause, resume, restart, game over, and win.
- Input edge cases: simultaneous keys, focus loss, held keys, rapid taps, and supported touch/gamepad input.
- Collision and physics: tunneling, corner snagging, edge standing, moving platforms, and world bounds.
- Rules traceability: each rule in `RULES.md` should map to at least one test.
- Scoring and persistence: single increments, reset behavior, reload behavior, and corrupt saved data.
- Spawning and cleanup: spawn limits, passable layouts, restart cleanup, and memory growth.
- Frame-rate independence at simulated 30, 60, and 144 FPS.
- Performance, deterministic replay, resize, tab switching, rapid restart, and mobile viewport behavior.

**Assessment:** The checklist is a useful starting point for web/2D/3D game QA. It explicitly requires evidence-based bug reports and forbids claiming unexecuted tests passed.

### Game Rules Core skill

Documented rule areas include:

- Explicit game states and transitions.
- Fixed-timestep gameplay updates.
- Win/loss and restart behavior.
- Scoring/progress, health/lives, spawn/despawn, difficulty, and input behavior.
- Genre add-ons for platformers, endless runners, shooters, puzzles, and racing/3D games.
- Collision pipeline: broad phase, narrow phase, resolution, and enter/stay/exit events.
- Collision-layer matrix and centralized physics constants.

**Assessment:** The rules guide provides a solid structure for testable mechanics. Each project should still add concrete numeric values and game-specific rules; generic guidance alone is not a complete specification.

## 6. Findings and recommendations

No package-integrity issue was detected in the supplied archives. The following are recommendations for making the skills more effective when used against a real repository.

| ID | Priority | Finding / recommendation |
|---|---|---|
| REC-01 | High | Add a game-specific `RULES.md` before testing. Convert each rule into one or more test cases with IDs and expected outcomes. |
| REC-02 | High | Add executable unit tests for pure logic (collision math, score changes, state transitions) and document the exact command used to run them. |
| REC-03 | High | Record environment details for runtime tests: OS, browser/device, build or commit hash, viewport, and frame-rate conditions. |
| REC-04 | Medium | Add an explicit test matrix mapping every `RULES.md` rule to test IDs and results, so untested rules are visible. |
| REC-05 | Medium | Define measurable performance thresholds appropriate to the game (for example, frame-time budget and maximum active entity count) rather than recording only qualitative observations. |
| REC-06 | Medium | If randomness affects gameplay, provide a seed/configuration mechanism and include the seed and scripted inputs in reproducibility notes. |
| REC-07 | Medium | Record browser console errors, failed asset/network requests, and screenshots or logs for any runtime bug. |
| REC-08 | Low | Add a short package README describing intended use, supported project types, prerequisites, and how to invoke the skill workflow. |

These are improvement recommendations, not confirmed defects in a game.

## 7. Test cases for applying the skills to an actual game

The following tests are **planned, not executed**. Their exact expected values must be adapted to the game's rules.

| Test ID | Scenario | Expected result | Status |
|---|---|---|---|
| GAME-001 | Launch the game from a clean state | Initial state matches the documented boot/menu rules; no startup errors | Not run — game files not supplied |
| GAME-002 | Start, pause, and resume | State transitions are explicit; gameplay timers/physics stop while paused | Not run |
| GAME-003 | Restart after progress has changed | All fields specified as reset return to their initial values; intended persistent values remain | Not run |
| GAME-004 | Trigger a win/loss condition | Outcome fires once and the resulting state is correct | Not run |
| GAME-005 | Hold left and right simultaneously | Behavior matches the input rules and is deterministic | Not run |
| GAME-006 | Lose window focus while a key is held | No stuck input remains after focus returns | Not run |
| GAME-007 | Move an entity at high speed toward a thin collider | Collision is not skipped, or the game has an explicitly documented alternative outcome | Not run |
| GAME-008 | Activate a trigger over multiple frames | One-time effects occur once; repeat effects occur only if specified | Not run |
| GAME-009 | Run equivalent input at 30, 60, and 144 FPS | Gameplay outcomes remain equivalent within documented tolerances | Not run |
| GAME-010 | Reload after saving a high score/progress | Valid data loads; corrupt or missing data is handled safely | Not run |
| GAME-011 | Restart repeatedly and observe entities/listeners | No duplicate event listeners or unbounded entity growth | Not run |
| GAME-012 | Resize to a narrow/mobile viewport | Controls and visible play area remain usable; rendering scales correctly | Not run |
| GAME-013 | Replay the same seed and input sequence | The result is reproducible if deterministic behavior is promised | Not run |
| GAME-014 | Inspect console and network requests during load | No unexplained errors or missing required assets | Not run |

## 8. What was not tested

- No game source code was included or reviewed.
- No `RULES.md` for a specific game was supplied.
- No unit, integration, browser, or end-to-end game tests were executed.
- No manual playtest was performed.
- No collision behavior, frame-rate independence, save/load behavior, memory usage, draw calls, or performance was measured.
- No claim is made that any particular game passes QA.

## 9. Recommended next step

Add the actual game repository or upload its source ZIP, including `RULES.md` if available. Then use this workflow:

1. Identify the game entry point, update loop, state machine, input, collision, spawning, scoring, and persistence code.
2. Build a rule-to-test traceability matrix.
3. Run existing tests and add targeted automated tests where feasible.
4. Perform runtime/browser checks where the environment permits.
5. Produce a separate `BUG_REPORT.md` with evidence, severity, reproduction steps, expected/actual behavior, and suggested fixes.

## 10. Archive fingerprints

SHA-256 fingerprints of the supplied archives, for traceability:

- `game-testing.zip`: `{sha256_file(testing_zip)}`
- `game-rules-core.zip`: `{sha256_file(rules_zip)}`

---

**Conclusion:** The two skill packages passed the package-level integrity and content checks described above. This is a documentation and QA-readiness result, **not a game pass/fail certification**. Runtime status remains unverified until the actual game project is tested.
