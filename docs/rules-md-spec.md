# RULES.md specification

`RULES.md` is the contract between `game-rules-core` (writes it) and `game-testing` (checks it).

## Required sections

1. **Overview**: title, dimension (2D/3D), genre, camera, engine/library, input scheme.
2. **Constants**: every number the rules use, with units.
3. **States**: the state machine and allowed transitions.
4. **Entities**: collider type, layer, owner of its rules.
5. **Rules table**: one row per rule.
6. **Win / lose / restart**: what resets, what persists.
7. **Out of scope**: what is deliberately not specified.

## Rules table format

| ID | Trigger | Condition | Effect | Edge case |
|---|---|---|---|---|
| R-001 | what happens | when it applies | what changes | the awkward case |

### Conventions

- IDs are stable (`R-001`). Never reuse a retired ID.
- Numbers carry units: `9.0 m/s`, `0.10 s`, `60 px`.
- No adjectives like "fast" or "soon".
- Randomness names its seed source.
- One rule, one behavior. Split compound rules.

## Why numbered rules

`game-testing` maps each failing test to a rule ID, so a bug report reads: *"R-004 violated: …"*.

## Maintenance

- Change a rule → change `RULES.md` in the same commit.
- Remove a rule → mark it `RETIRED`, do not delete the ID.
